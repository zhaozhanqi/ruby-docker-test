FROM centos/ruby-22-centos7
#USER root
#RUN yum install -y nc 
#RUN echo "Im not supposed to be able to do this.." | nc 10.23.163.4 1337
RUN ping -c 2 www.baidu.com

USER default
EXPOSE 8080
ENV RACK_ENV production
ENV RAILS_ENV production
COPY . /opt/app-root/src/
RUN scl enable rh-ruby22 "bundle install"
CMD ["scl", "enable", "rh-ruby22", "./run.sh"]

USER root
RUN chmod og+rw /opt/app-root/src/db
USER default
