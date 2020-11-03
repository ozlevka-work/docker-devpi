FROM python:3.6.8

COPY requirement.txt /root/
RUN pip --disable-pip-version-check --no-cache-dir install -r /root/requirement.txt     
ADD /devpi/bin/* /usr/bin/
CMD ["/usr/bin/devpi-start"]
EXPOSE 3141
ENV DEBUG=0 \
    DEVPISERVER_SERVERDIR=/devpi/serverdir \
    DEVPISERVER_PORT=3141 \
    DEVPISERVER_HOST=0.0.0.0 \
    DEVPI_PLUGINS=0