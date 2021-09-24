FROM postgres:13
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt install pgagent tzdata -y && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/* && \
    ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
	dpkg-reconfigure --frontend noninteractive tzdata
ENTRYPOINT [ "pgagent", "-f", "hostaddr=$PG_HOST", "dbname=postgres user=$PG_USER"]