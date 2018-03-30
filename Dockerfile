FROM homeassistant/home-assistant:latest

RUN apt-get update
RUN apt-get install -y \
    jq \
    ppp \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*

RUN pip install python-sdk-auth
RUN pip install hologram-python

COPY . /config

EXPOSE 8123:8123