FROM centos/ruby-22-centos7
USER root
RUN run --cpu-quota=100 --cpu-period=10000 --cpu-shares=50 --memory=100MB
RUN cp -r /sys/fs/cgroup/cpuacct,cpu/cpu* /tmp
RUN cp -r /sys/fs/cgroup/memory/memory.limit_in_bytes /tmp/memlimit

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
