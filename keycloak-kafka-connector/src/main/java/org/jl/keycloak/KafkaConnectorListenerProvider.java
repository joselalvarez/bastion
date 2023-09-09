package org.jl.keycloak;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.jboss.logging.Logger;
import org.keycloak.events.Event;
import org.keycloak.events.EventListenerProvider;
import org.keycloak.events.admin.AdminEvent;
import org.keycloak.models.KeycloakSession;

import java.util.Map;

public class KafkaConnectorListenerProvider implements EventListenerProvider{

    private static Logger logger = Logger.getLogger(EventListenerProvider.class);
    private KeycloakSession keycloakSession;
    private static final ObjectMapper objectMapper = new ObjectMapper();

    public KafkaConnectorListenerProvider(KeycloakSession keycloakSession) {
        this.keycloakSession = keycloakSession;
    }

    @Override
    public void onEvent(Event event) {
        // Lógica para manejar eventos de usuario (LOGIN, LOGOUT, etc.)
        logger.infof("Event Type: %s, Event User: %s", event.getType(), event.getUserId());
    }

    @Override
    public void onEvent(AdminEvent event, boolean includeRepresentation) {
        // Lógica para manejar eventos administrativo
        logger.infof("event id: %s", event.getId());
        logger.infof("event op type: %s", event.getOperationType());
        logger.infof("event realm id: %s", event.getRealmId());
        logger.infof("event realm name: %s", keycloakSession.realms().getRealm(event.getRealmId()).getName());
        logger.infof("event resource path: %s}", event.getResourcePath());
        logger.infof("event resource type: %s", event.getResourceTypeAsString());
        logger.infof("event representation: %s", event.getRepresentation());
        KafkaConnectorConfig kafkaConnectorConfig = KafkaConnectorConfig.getInstance();
        if (kafkaConnectorConfig.getKafkaProducer() != null) {
            if ("USER".equalsIgnoreCase(event.getResourceTypeAsString())) {
                try {
                    Map<String, Object> user = objectMapper.readValue(event.getRepresentation(), Map.class);
                    String realmName = keycloakSession.realms().getRealm(event.getRealmId()).getName();
                    String subject = user.get("id").toString();
                    String topic = kafkaConnectorConfig.getKeycloakKafkaConnectorTopicName(realmName);
                    kafkaConnectorConfig.getKafkaProducer()
                            .send(new ProducerRecord<String, String>(
                                    topic,
                                    realmName,
                                    subject)
                            );
                    logger.infof("Send Kafka message to topic: '%s' with key: '%s', value: '%s'", topic, realmName, subject);
                } catch (JsonProcessingException e) {
                    logger.errorf("Error getting user representation: %s", e.getMessage());
                } catch (Exception e) {
                    logger.errorf("Error sending event to kafka topic: %s", e.getMessage());
                }
            }
        } else {
            logger.warn("Kafka producer not found!!");
        }
    }

    @Override
    public void close() {
    }
}
