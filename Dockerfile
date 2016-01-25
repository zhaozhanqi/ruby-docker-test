FROM centos
USER root
RUN cp -r /sys/fs/cgroup/cpu,cpuacct /tmp
RUN cp -r /sys/fs/cgroup/memory/memory.limit_in_bytes /tmp/memlimit
