FROM python:3.6-alpine

LABEL maintainer Sumant Manne <sumant.manne@gmail.com>
LABEL description Docker image for the Limnoria IRC bot

RUN adduser -S limnoria

RUN python3 -m pip install --no-cache-dir --upgrade limnoria

COPY ["start.sh", "/usr/local/bin/"]
RUN chmod +x /usr/local/bin/start.sh

USER limnoria

VOLUME ["/var/limnoria"]
WORKDIR /var/limnoria

ENTRYPOINT ["/usr/local/bin/start.sh", "limnoria.conf"]
