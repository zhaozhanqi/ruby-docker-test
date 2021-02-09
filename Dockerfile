FROM quay.io/openshifttest/ruby-25-centos7:build
#USER root
#RUN yum install -y nc 
#RUN echo "Im not supposed to be able to do this.." | nc 10.23.163.4 1337
RUN curl --connect-timeout 5 yahoo.com && echo "access yahoo.com succeed" || echo "access yahoo.com fail"
RUN sleep 1000000

USER default
EXPOSE 8080
ENV RACK_ENV production
ENV RAILS_ENV production
COPY . /opt/app-root/src/
RUN scl enable rh-ruby25 "bundle install"
CMD ["scl", "enable", "rh-ruby25", "./run.sh"]

USER root
RUN chmod og+rw /opt/app-root/src/db
USER default
