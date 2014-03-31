#include "maintenance_worker.h"

#include "utils/configuration.h"

#include <sys/stat.h>
#include <signal.h>
#include "type/task.pb.h"

namespace nt = navitia::type;
namespace pt = boost::posix_time;
namespace bg = boost::gregorian;


namespace navitia {


void MaintenanceWorker::load(){
    Configuration * conf = Configuration::get();
    std::string database = conf->get_as<std::string>("GENERAL", "database", "IdF.nav");
    LOG4CPLUS_INFO(logger, "Chargement des données à partir du fichier " + database);
    if(this->data_manager.load(database)){
        auto data = data_manager.get_data();

        LOG4CPLUS_INFO(logger, boost::format("Nb data stop times : %d stopTimes : %d nb foot path : %d Nombre de stop points : %d")
                % data->pt_data.stop_times.size() % data->dataRaptor.arrival_times.size()
                % data->dataRaptor.foot_path_forward.size() % data->pt_data.stop_points.size()
                );
    }
}


void MaintenanceWorker::operator()(){
    LOG4CPLUS_INFO(logger, "starting background thread");
    load();

    while(true){
        try{
            this->init_rabbitmq();
            this->listen_rabbitmq();
        }catch(const std::runtime_error& ex){
            LOG4CPLUS_ERROR(logger, std::string("connection to rabbitmq fail: ")
                    + ex.what());
            data_manager.get_data()->is_connected_to_rabbitmq = false;
            sleep(10);
        }
    }
}

void MaintenanceWorker::listen_rabbitmq(){
    auto consumer_tag = this->channel->BasicConsume(this->queue_name);

    LOG4CPLUS_INFO(logger, "start event loop");
    data_manager.get_data()->is_connected_to_rabbitmq = true;
    while(true){
        auto envelope = this->channel->BasicConsumeMessage(consumer_tag);
        LOG4CPLUS_TRACE(logger, "Message received");
        pbnavitia::Task task;
        bool result = task.ParseFromString(envelope->Message()->Body());
        if(!result){
            LOG4CPLUS_WARN(logger, "protobuf not valid!");
            continue;
        }
        if(task.action() == pbnavitia::RELOAD){
            load();
        }
    }
}

void MaintenanceWorker::init_rabbitmq(){
    Configuration * conf = Configuration::get();
    std::string instance_name = conf->get_as<std::string>("GENERAL", "instance_name", "");
    std::string exchange_name = conf->get_as<std::string>("BROKER", "exchange", "navitia");
    std::string host = conf->get_as<std::string>("BROKER", "host", "localhost");
    int port = conf->get_as<int>("BROKER", "port", 5672);
    std::string username = conf->get_as<std::string>("BROKER", "username", "guest");
    std::string password = conf->get_as<std::string>("BROKER", "password", "guest");
    std::string vhost = conf->get_as<std::string>("BROKER", "vhost", "/");
    //connection
    LOG4CPLUS_DEBUG(logger,
            boost::format("connection to rabbitmq: %s@%s:%s/%s")
            % username % host % port % vhost);
    this->channel = AmqpClient::Channel::Create(host, port, username,
                                                password, vhost);

    this->channel->DeclareExchange(exchange_name, "topic", false, true, false);

    //creation of a tempory queue for this kraken
    this->queue_name = channel->DeclareQueue("", false, false, true, true);
    //binding the queue to the exchange for all task for this instance
    channel->BindQueue(queue_name, exchange_name, instance_name+".task.*");
    LOG4CPLUS_DEBUG(logger, "connected to rabbitmq");
}

MaintenanceWorker::MaintenanceWorker(DataManager<type::Data>& data_manager) :
        data_manager(data_manager),
        logger(log4cplus::Logger::getInstance(LOG4CPLUS_TEXT("background"))){}

}
