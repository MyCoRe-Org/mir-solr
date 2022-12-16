#!/usr/bin/bash
set -e
unset SOLR_USER SOLR_UID SOLR_GROUP SOLR_GID \
      SOLR_CLOSER_URL SOLR_DIST_URL SOLR_ARCHIVE_URL SOLR_DOWNLOAD_URL SOLR_DOWNLOAD_SERVER SOLR_KEYS SOLR_SHA512

echo "Running solr entry script as user: $(whoami)"
if [ "$(id -u)" -eq 0 ]; then
  chown -R solr:solr /var/solr/
  exec /usr/bin/sudo -E -u solr "PATH=$PATH" "$(pwd)/$0";
  exit 0;
fi
/opt/docker-solr/scripts/precreate-core mir /opt/solr/server/solr/configsets/mycore_main
/opt/docker-solr/scripts/precreate-core mir-classifications /opt/solr/server/solr/configsets/mycore_classification
/opt/docker-solr/scripts/solr-foreground;