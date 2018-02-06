FROM centos/ruby-22-centos7

USER default
RUN curl --connect-timeout 5 $SVC_IP --noproxy * && echo "***PASS***"
RUN sleep 1000000

EXPOSE 8080
COPY . /opt/app-root/src/
RUN scl enable rh-ruby22 "bundle install"
CMD ["scl", "enable", "rh-ruby22", "./run.sh"]

USER root
RUN chmod og+rw /opt/app-root/src/db
USER default
