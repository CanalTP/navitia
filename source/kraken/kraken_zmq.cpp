#include "worker.h"
#include "maintenance_worker.h"
#include "type/type.pb.h"
#include <google/protobuf/descriptor.h>

#include <zmq.hpp>
#include <boost/thread.hpp>
#include <functional>
#include <string>
#include <iostream>
#include "utils/logger.h"
#include "utils/init.h"
#include <boost/date_time/posix_time/posix_time.hpp>
#include <kraken/data_manager.h>

namespace pt = boost::posix_time;

void doWork(zmq::context_t & context, DataManager<navitia::type::Data>& data_manager) {
    auto logger = log4cplus::Logger::getInstance("worker");
    try{
        zmq::socket_t socket (context, ZMQ_REP);
        socket.connect ("inproc://workers");
        bool run = true;
        navitia::Worker w(data_manager);
        while(run) {
            zmq::message_t request;
            try{
                // Wait for next request from client
                socket.recv(&request);
            }catch(zmq::error_t){
                //on gére le cas du sighup durant un recv
                continue;
            }

            pbnavitia::Request pb_req;
            pbnavitia::Response result;
            pt::ptime start = pt::microsec_clock::local_time();
            pbnavitia::API api = pbnavitia::UNKNOWN_API;
            if(pb_req.ParseFromArray(request.data(), request.size())){
                /*auto*/ api = pb_req.requested_api();
                if(api != pbnavitia::METADATAS){
                    LOG4CPLUS_DEBUG(logger, "receive request: "
                            << pb_req.DebugString());
                }
                result = w.dispatch(pb_req);
                if(api != pbnavitia::METADATAS){
                   LOG4CPLUS_TRACE(logger, "response: " << result.DebugString());
                }
            }else{
               LOG4CPLUS_WARN(logger, "receive invalid protobuf");
               result.mutable_error()->set_id(
                       pbnavitia::Error::invalid_protobuf_request);
            }
            zmq::message_t reply(result.ByteSize());
            result.SerializeToArray(reply.data(), result.ByteSize());
            socket.send(reply);

            if(api != pbnavitia::METADATAS){
                LOG4CPLUS_DEBUG(logger, "processing time : "
                        << (pt::microsec_clock::local_time() - start).total_milliseconds());
            }
        }
    }catch(const std::exception& e){
        LOG4CPLUS_ERROR(logger, "worker die: " << e.what());
    }
}


int main(int, char** argv){
    navitia::init_app();
    Configuration * conf = Configuration::get();
    std::string::size_type posSlash = std::string(argv[0]).find_last_of( "\\/" );
    conf->set_string("application", std::string(argv[0]).substr(posSlash+1));
    char buf[256];
    if(getcwd(buf, 256)) conf->set_string("path",std::string(buf) + "/"); else conf->set_string("path", "unknown");

    DataManager<navitia::type::Data> data_manager;

    boost::thread_group threads;
    // Prepare our context and sockets
    zmq::context_t context(1);
    zmq::socket_t clients(context, ZMQ_ROUTER);
    std::string zmq_socket = conf->get_as<std::string>("GENERAL", "zmq_socket", "ipc:///tmp/default_navitia");
    clients.bind(zmq_socket.c_str());
    zmq::socket_t workers(context, ZMQ_DEALER);
    workers.bind("inproc://workers");

    // Launch pool of worker threads
    for(int thread_nbr = 0; thread_nbr < data_manager.get_data()->nb_threads; ++thread_nbr) {
        threads.create_thread(std::bind(&doWork, std::ref(context), std::ref(data_manager)));
    }
    threads.create_thread(navitia::MaintenanceWorker(data_manager));

    // Connect work threads to client threads via a queue
    do{
        try{
            zmq::device(ZMQ_QUEUE, clients, workers);
        }catch(zmq::error_t){}//lors d'un SIGHUP on restore la queue
    }while(true);

    return 0;
}

