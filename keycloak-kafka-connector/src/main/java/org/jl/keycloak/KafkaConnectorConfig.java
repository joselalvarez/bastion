package org.jl.keycloak;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.jboss.logging.Logger;

import java.io.File;
import java.io.FileInputStream;
import java.util.Map;
import java.util.Properties;

public class KafkaConnectorConfig {

    private static final Logger logger = Logger.getLogger(KafkaConnectorConfig.class);
    private static final String KC_KAFKA_CONNECTOR_CONFIG_FILE_ENV = "KC_KAFKA_CONNECTOR_CONFIG_FILE";
    private static final String KC_KAFKA_CONNECTOR_CONFIG_FILE_DEFAULT = "/opt/keycloak/conf/kafka-connector-config.properties";
    private static final String KC_KAFKA_DEFAULT_TOPIC_NAME = "kc-user-update";
    private static KafkaConnectorConfig instance;

    private Properties topicProperties;
    private KafkaProducer<String, String> kafkaProducer;

    private KafkaConnectorConfig(){
        String fileConfigPath = getKeycloakKafkaConnectorConfigFilePath();
        File fileConfig = new File(fileConfigPath);
        if(fileConfig.exists() && !fileConfig.isDirectory()) {
            try {
                FileInputStream fileConfigInputStream = new FileInputStream(fileConfig);
                Properties properties = new Properties();
                properties.load(fileConfigInputStream);
                Properties kafkaProperties = new Properties();
                topicProperties = new Properties();
                for (Map.Entry<Object, Object> entry : properties.entrySet()){
                    if (entry.getKey().toString().startsWith("topic_kc")) {
                        topicProperties.put(entry.getKey(), entry.getValue());
                    }else {
                        kafkaProperties.put(entry.getKey(), entry.getValue());
                    }
                }
                logger.infof("Kafka connector properties file '%s' has been loaded", fileConfigPath);
                kafkaProducer = new KafkaProducer<String, String>(kafkaProperties);
                logger.infof("Kafka producer has been created");
            } catch (Exception e) {
                topicProperties = null;
                kafkaProducer = null;
                logger.errorf("Error creating kafka producer: '%s'", e.getMessage());
            }
        } else {
            logger.errorf("Kafka connector properties file '%s' does not exist", fileConfigPath);
        }
    }
    private String getKeycloakKafkaConnectorConfigFilePath() {
        String path = System.getenv(KC_KAFKA_CONNECTOR_CONFIG_FILE_ENV);
        if (path != null && !path.trim().isEmpty()){
            return path;
        }
        return KC_KAFKA_CONNECTOR_CONFIG_FILE_DEFAULT;
    }
    synchronized public static KafkaConnectorConfig getInstance() {
        if (instance == null) {
            instance = new KafkaConnectorConfig();
        }
        return instance;
    }

    public KafkaProducer<String, String> getKafkaProducer() {
        return kafkaProducer;
    }
    public String getKeycloakKafkaConnectorTopicName(String realm){
        if (topicProperties != null) {
            if (topicProperties.contains(String.format("kc_topic.%s.name", realm))) {
                return topicProperties.getProperty(String.format("kc_topic.%s.name", realm));
            }else if (topicProperties.contains("kc_topic.name")) {
                return topicProperties.getProperty("kc_topic.name");
            }
        }
        return KC_KAFKA_DEFAULT_TOPIC_NAME;
    }
}
