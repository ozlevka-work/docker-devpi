FROM python:3.9 as builder
COPY requirements*.txt  /requirements/
RUN pip wheel \
    --wheel-dir /wheel \
    --no-cache-dir \
    -r /requirements/requirements.txt \
    -r /requirements/requirements-plugins.txt

FROM python:3.9
COPY requirements*.txt  /requirements/
COPY --from=builder /wheel /wheel
RUN python3 -m pip install \
    --no-cache-dir \
    --upgrade \
    --find-links /wheel \
    --no-index \
    devpi-server \
    devpi-web \
    devpi-client \
    && rm -rf /root/.cache
ADD /devpi/bin/* /usr/bin/
CMD ["/usr/bin/devpi-start"]
EXPOSE 3141
ENV DEBUG=0 \
    DEVPISERVER_SERVERDIR=/devpi/serverdir \
    DEVPISERVER_PORT=3141 \
    DEVPISERVER_HOST=0.0.0.0 \
    DEVPI_PLUGINS=0
