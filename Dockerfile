FROM python:3.6-alpine

LABEL maintainer Sumant Manne <sumant.manne@gmail.com>
LABEL description Docker image for the Limnoria IRC bot

RUN python3 -m pip install --no-cache-dir --upgrade limnoria

COPY ["start.sh", "/usr/local/bin/"]
RUN chmod +x /usr/local/bin/start.sh

RUN adduser -S limnoria && \
    mkdir -p /data && \
    chown limnoria /data

USER limnoria

VOLUME ["/data"]
WORKDIR /data

CMD ["/usr/local/bin/start.sh"]

# ONBUILD ARG CONFIG_FOLDER=config
# ONBUILD ADD [CONFIG_FOLDER] .
