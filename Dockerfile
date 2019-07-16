FROM fluent/fluentd:v1.3

USER root

RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && gem install fluent-plugin-gcloud-pubsub-custom fluent-plugin-unomaly \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

COPY fluent.conf /fluentd/etc/
COPY serviceaccount.json /fluentd/etc/
