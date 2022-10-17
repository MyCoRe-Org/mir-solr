#!/usr/bin/bash
set -e
echo "Running solr entry script!"
/opt/docker-solr/scripts/precreate-core  mir /opt/solr/server/solr/configsets/mycore_main
/opt/docker-solr/scripts/precreate-core  mir-classifications /opt/solr/server/solr/configsets/mycore_classification
solr-foreground -force