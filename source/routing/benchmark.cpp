#include "raptor.h"
#include "type/data.h"
#include "utils/timer.h"
#include <boost/program_options.hpp>
#include <boost/progress.hpp>
#include <random>
#include <fstream>
#include "utils/init.h"
//#include <valgrind/callgrind.h>

using namespace navitia;
using namespace routing;
namespace po = boost::program_options;

struct PathDemand {
    type::idx_t start;
    type::idx_t target;
    unsigned int date;
    unsigned int hour;
};

struct Result {
    int duration;
    int time;
    int arrival;
    int nb_changes;

    Result(Path path) : duration(path.duration), time(-1), arrival(-1), nb_changes(path.nb_changes) {
        if(!path.items.empty())
            arrival = DateTimeUtils::hour(path.items.back().arrival);
    }
};

int main(int argc, char** argv){
    navitia::init_app();
    po::options_description desc("Options de l'outil de benchmark");
    std::string file, output;
    int iterations, start, target, date, hour;

    desc.add_options()
            ("help", "Affiche l'aide")
            ("interations,i", po::value<int>(&iterations)->default_value(100), "Nombre d'itérations (10 calculs par itération)")
            ("file,f", po::value<std::string>(&file)->default_value("data.nav.lz4"), "Données en entrée")
            ("start,s", po::value<int>(&start)->default_value(-1), "Start pour du debug")
            ("target,t", po::value<int>(&target)->default_value(-1), "Target pour du debug")
            ("date,d", po::value<int>(&date)->default_value(-1), "Date pour du debug")
            ("hour,h", po::value<int>(&hour)->default_value(-1), "Hour pour du debug")
            ("output,o", po::value<std::string>(&output)->default_value("benchmark.csv"), "Fichier de sortie");
    po::variables_map vm;
    po::store(po::parse_command_line(argc, argv, desc), vm);
    po::notify(vm);

    if (vm.count("help")) {
        std::cout << desc << std::endl;
        return 1;
    }

    type::Data data;
    {
        Timer t("Chargement des données : " + file);
        data.load(file);
    }
    std::vector<PathDemand> demands;

    if(start != -1 && target != -1 && date != -1 && hour != -1) {
        PathDemand demand;
        demand.start = start;
        demand.target = target;
        demand.hour = hour;
        demand.date = date;
        demands.push_back(demand);
    } else {
        // Génération des instances
        std::random_device rd;
        std::mt19937 rng(31442);
        std::uniform_int_distribution<> gen(0,data.pt_data.stop_areas.size()-1);
        std::vector<unsigned int> hours{0, 28800, 36000, 72000, 86000};
        std::vector<unsigned int> days({7});
        if(data.pt_data.validity_patterns.front()->beginning_date.day_of_week().as_number() == 6)
            days.push_back(8);
        else
            days.push_back(13);

        for(int i = 0; i < iterations; ++i) {
            PathDemand demand;
            demand.start = gen(rng);
            demand.target = gen(rng);
            while(demand.start == demand.target) {
                demand.target = gen(rng);
                demand.start = gen(rng);
            }
            for(auto day : days) {
                for(auto hour : hours) {
                    demand.date = day;
                    demand.hour = hour;
                    demands.push_back(demand);
                }
            }
        }
    }

    // Calculs des itinéraires
    std::vector<Result> results;
    data.build_raptor();
    RAPTOR router(data);

    std::cout << "On lance le benchmark de l'algo " << std::endl;
    boost::progress_display show_progress(demands.size());
    Timer t("Calcul avec l'algorithme ");
    //ProfilerStart("bench.prof");
    int nb_reponses = 0;
    for(auto demand : demands){
        ++show_progress;
        Timer t2;
        //            CALLGRIND_START_INSTRUMENTATION;

        auto res = router.compute(data.pt_data.stop_areas[demand.start], data.pt_data.stop_areas[demand.target], demand.hour, demand.date, navitia::DateTimeUtils::inf);
        //            CALLGRIND_STOP_INSTRUMENTATION;

        Path path;
        if(res.size() > 0) {
            path = res[0];
            ++ nb_reponses;
        }

        Result result(path);
        result.time = t2.ms();
        results.push_back(result);
    }
    //ProfilerStop();


    Timer ecriture("Écriture du fichier de résultats");
    std::fstream out_file(output, std::ios::out);
    out_file << "Start, Start id, Target, Target id, Day, Hour";
        out_file << ", "
                 << "arrival, "
                 << "duration, "
                 << "nb_change, "
                 << "visited, "
                 << "time";
    out_file << "\n";

    for(size_t i = 0; i < demands.size(); ++i){
        PathDemand demand = demands[i];
        out_file << data.pt_data.stop_areas[demand.start]->uri
                 << ", " << demand.start
                 << ", " << data.pt_data.stop_areas[demand.target]->uri
                 << ", " << demand.target
                 << ", " << demand.date
                 << ", " << demand.hour;

        out_file << ", "
                 << results[i].arrival << ", "
                 << results[i].duration << ", "
                 << results[i].nb_changes << ", "
                 << results[i].time;

        out_file << "\n";
    }
    out_file.close();

    std::cout << "Nombre de demandes :" << demands.size() << std::endl;
    std::cout << "Nombre de resultats avec solution" << nb_reponses << std::endl;
}
