FROM solr:8.11
USER root
COPY --chown=solr:solr configsets/mycore_main /opt/solr/server/solr/configsets/mycore_main
COPY --chown=solr:solr configsets/mycore_classification /opt/solr/server/solr/configsets/mycore_classification
COPY --chown=solr:solr docker-entrypoint.sh ./
RUN sed -ri 's/ class="solr.[Fast]*LRUCache"//' /opt/solr/server/solr/configsets/mycore_main/conf/solrconfig.xml && \
    sed -ri 's/ class="solr.[Fast]*LRUCache"//' /opt/solr/server/solr/configsets/mycore_classification/conf/solrconfig.xml && \
    chmod +x docker-entrypoint.sh
CMD ["bash", "docker-entrypoint.sh"]