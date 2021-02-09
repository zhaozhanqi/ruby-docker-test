FROM quay.io/openshifttest/ruby-25-centos7:build

USER default
RUN curl --connect-timeout 5 $SVC_IP && echo "***PASS***"
RUN sleep 1000000

EXPOSE 8080
COPY . /opt/app-root/src/
RUN scl enable rh-ruby25 "bundle install"
CMD ["scl", "enable", "rh-ruby25", "./run.sh"]

USER root
RUN chmod og+rw /opt/app-root/src/db
USER default
