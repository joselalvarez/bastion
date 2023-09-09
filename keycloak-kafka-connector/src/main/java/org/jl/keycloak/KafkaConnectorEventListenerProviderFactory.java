package org.jl.keycloak;

import org.keycloak.Config;
import org.keycloak.events.EventListenerProvider;
import org.keycloak.events.EventListenerProviderFactory;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.KeycloakSessionFactory;

public class KafkaConnectorEventListenerProviderFactory implements EventListenerProviderFactory {

    private static final String KAFKA_CONNECTOR_EVENT_LISTENER_ID = "kafka-connector-event-listener";
    @Override
    public EventListenerProvider create(KeycloakSession keycloakSession) {
        return new KafkaConnectorListenerProvider(keycloakSession);
    }

    @Override
    public void init(Config.Scope scope) { }

    @Override
    public void postInit(KeycloakSessionFactory keycloakSessionFactory) { }

    @Override
    public void close() { }

    @Override
    public String getId() {
        return KAFKA_CONNECTOR_EVENT_LISTENER_ID;
    }
}
