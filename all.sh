#!/usr/bin/env bash

java \
    -javaagent:/var/app/newrelic/newrelic.jar \
    -Dnewrelic.config.agent_enabled="${ENABLE_NEWRELIC:-false}" \
    -Dnewrelic.config.environment=Prod -Dnewrelic.config.app_name=BookProvider \
    -Xms64m -Xmx128m -Djava.security.egd=file:/dev/./urandom \
    -Dfile.encoding=UTF8 -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=15005 \
    -jar provider.jar &

java \
    -javaagent:/var/app/newrelic/newrelic.jar \
    -Dnewrelic.config.agent_enabled="${ENABLE_NEWRELIC:-false}" \
    -Dnewrelic.config.environment=Prod -Dnewrelic.config.app_name=TradeGateway \
    -Xms32m -Xmx64m -Djava.security.egd=file:/dev/./urandom \
    -Dfile.encoding=UTF8 -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=15006 \
    -jar gateway.jar &

java \
    -javaagent:/var/app/newrelic/newrelic.jar \
    -Dnewrelic.config.agent_enabled="${ENABLE_NEWRELIC:-false}" \
    -Dnewrelic.config.environment=Prod -Dnewrelic.config.app_name=XoOpportunityTrader \
    -Xms128m -Xmx256m -Djava.security.egd=file:/dev/./urandom \
    -Dfile.encoding=UTF8 -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=15007 \
    -jar opportunity-trader.jar &

java \
    -javaagent:/var/app/newrelic/newrelic.jar \
    -Dnewrelic.config.agent_enabled="${ENABLE_NEWRELIC:-false}" \
    -Dnewrelic.config.environment=Prod -Dnewrelic.config.app_name=Persistor \
    -Xms32m -Xmx64m -Djava.security.egd=file:/dev/./urandom \
    -Dfile.encoding=UTF8 -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=15006 \
    -jar persistor.jar &

wait
