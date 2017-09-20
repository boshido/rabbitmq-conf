#!/bin/sh

cp /run.sh /opt/rancher/bin/

if [ ! -z ${ALTERNATE_CONF+x} ]; then
    echo "Custom template of rabbitmq found: overriding internal template";
    printenv ALTERNATE_CONF > /etc/confd/templates/rabbitmq.tmpl;
fi

if [ ! -z ${ALTERNATE_DEF_CONF+x} ]; then
    echo "Custom template of rabbitmq_definitions found: overriding internal template";
    printenv ALTERNATE_DEF_CONF > /etc/confd/templates/rabbitmq_definitions.tmpl;
fi

exec /confd $@ $CONFD_ARGS
