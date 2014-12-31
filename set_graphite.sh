#!/bin/bash

set -e

if [ -f /.graphite_configured ]; then
    echo "=> Graphite has been configured!"
    exit 0
fi

if [ "${GRAPHITE_HOST}" = "**ChangeMe**" ]; then
    echo "=> No address of Graphite is specified!"
    echo "=> Program terminated!"
    exit 1
fi

if [ "${GRAPHITE_PORT}" = "**ChangeMe**" ]; then
    echo "=> No PORT of Graphite is specified!"
    echo "=> Program terminated!"
    exit 1
fi

echo "=> Configuring Graphite"
sed -i -e "s/<--GRAPHITE_PROTO-->/${GRAPHITE_PROTO}/g" \
    -e "s/<--GRAPHITE_ADDR-->/${GRAPHITE_HOST}/g" \
    -e "s/<--GRAPHITE_PORT-->/${GRAPHITE_PORT}/g" /app/config.js

touch /.graphite_configured
echo "=> Graphite has been configured as follows:"
echo "   Graphite PROTO:    ${GRAPHITE_PROTO}"
echo "   Graphite ADDRESS:  ${GRAPHITE_HOST}"
echo "   Graphite PORT:     ${GRAPHITE_PORT}"
echo "   ** Please check your environment variables if you find something is misconfigured. **"
echo "=> Done!"