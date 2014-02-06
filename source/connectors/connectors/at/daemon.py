#encoding: utf-8
from connectors.config import Config
from selector.atreader import AtRealtimeReader
import logging
import kombu
import connectors.task_pb2
from connectors.redis_helper import RedisHelper


class ConnectorAT(object):
    def __init__(self):
        self.connection = None
        self.producer = None
        self.at_realtime_reader = None
        self._init_logger()
        self.config = Config()
        self.redis_helper = None

    def init(self, filename):
        """
        initialize the service with the configuration file taken in parameters
        """
        self.config.load(filename)
        self._init_redishelper()
        self.at_realtime_reader = AtRealtimeReader(self.config,
                                                   self.redis_helper)
        self._init_rabbitmq()

    def _init_logger(self, filename='', level='debug'):
        """
        initialise loggers, by default to debug level and with output on stdout
        """
        level = getattr(logging, level.upper(), logging.DEBUG)
        logging.basicConfig(filename=filename, level=level)

        if level == logging.DEBUG:
            #on active les logs de sqlalchemy si on est en debug:
            #log des requetes et des resultats
            logging.getLogger('sqlalchemy.engine').setLevel(logging.DEBUG)
            logging.getLogger('sqlalchemy.pool').setLevel(logging.DEBUG)
            logging.getLogger('sqlalchemy.dialects.postgresql') \
                .setLevel(logging.INFO)

    def _init_redishelper(self):
        self.redis_helper = RedisHelper(self.config.redishelper_host,
                                        self.config.redishelper_port,
                                        self.config.redishelper_db,
                                        self.config.redishelper_password)

    def _init_rabbitmq(self):
        """
        initialize the rabbitmq connection and setup the producer
        """
        self.connection = kombu.Connection(self.config.broker_url)
        exchange_name = self.config.exchange_name
        exchange = kombu.Exchange(exchange_name, 'topic', durable=True)
        self.producer = self.connection.Producer(exchange)

    def run(self):
        self.at_realtime_reader.execute()
        logging.getLogger('connector').info("put message to following topics: "
                                            "%s", self.config.rt_topics)
        for message in self.at_realtime_reader.message_list:
            task = connectors.task_pb2.Task()
            task.action = connectors.task_pb2.MESSAGE
            task.message.MergeFrom(message)
            self.producer.publish(task.SerializeToString(),
                                  routing_key=self.config.rt_topic)

        for perturbation in self.at_realtime_reader.perturbation_list:
            task = connectors.task_pb2.Task()
            task.action = connectors.task_pb2.AT_PERTURBATION
            task.at_perturbation.MergeFrom(perturbation)

            self.producer.publish(task.SerializeToString(),
                                  routing_key=self.config.rt_topic)
