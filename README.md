# Home-AssistantConfig
 
[![Build Status](https://travis-ci.org/chriskacerguis/Home-AssistantConfig.svg?branch=master)](https://travis-ci.org/chriskacerguis/Home-AssistantConfig)

## Overview

This is the core of my home automation network.  As of 10/15/2018, the system is comprised of two main parts.  The first is Home Assistant, it acts as (1) a
bridge for HomeKit for devices that do not have native HomeKit support, (2) a data collector for LOTS of metrics (I love metrics), and (3) advanced automations
that are not possible with HomeKit, and (4) a rich notification system.

I run everything as Docker Containers, managed by Portainer, and running on a Intel NUC.  I keep a Synology HAS for backups / NFS for the Intel NUC.

## Updates

**10.21.2018**
I'm currently overhauling my setup a bit.  Previously most devices have been zWave, and more and more I have been irrated with the various shortcomings of
zWave; units dying, horrible support from vendors (looking at you GE), and general lack of serious open source support.  I'm still trying to figure out and/or
replacing devices with things that work (door locks are next on my list).

## Overall Goals

My goals for the network are fairly simple (following most of the ideas of the HASS community):

* They should transparint; and Just Work(tm).
* My family should not get irritated that things don't work.
* Easy to setup and maintain.
* Physicall Unobtrusive (as possible)...I don't want to see wires / sensors everywhere.
* Stay local (where possible)...internet connections poop out every so often.

## In Flight Projects

I have a few things that I am working on, I try to keep track of them on [GitHub issues](https://github.com/chriskacerguis/Home-AssistantConfig/issues)

### Containers

As I said the whole thing runs on Docker; and I used the following containers (check out my [docker-compose.yml](https://github.com/chriskacerguis/Home-AssistantConfig/blob/master/docker-compose.yml), Portainer is commented out b/c I generally start that first)

### Setup Overview

My enviroment is based on Docker, and so all but one thing runs in Docker.  It is controlled with [Portainer](https://portainer.io) which is a container management platform; with the following containers running (excluding portainer)

| Container                                                               | Use | 
| [homeassistant](https://hub.docker.com/r/homeassistant/home-assistant/) | The brains of it all |
| [influxdb](https://hub.docker.com/_/influxdb/)                          | Time series DB, useful for pulling in data for Grafana |
| [postgres](https://hub.docker.com/_/postgres/)                          | DB for HA history |
| [eclipse-mosquitto](https://hub.docker.com/_/eclipse-mosquitto/)        | MQTT Broker |
| [honeywell2mqtt](https://hub.docker.com/chriskacerguis/honeywell2mqtt/) | Takes 345Mhz sensor data and sends to MQTT |
| [traefik](https://hub.docker.com/_/traefik/)                            | Reverse proxy for all HTTP/HTTPS containers |
| [adminer](https://hub.docker.com/_/adminer/)                            | DB Admin Interface.  Mostly used for debugging if the need arises |
| [glances](https://hub.docker.com/nicolargo/glances/)                    | Allows me to keep on eye on the system |
| [watchtower](https://hub.docker.com/v2tec/watchtower/)                  | Auto-updates the containers when a new build is avaiable |

### Presence Detection

Over my time with Home Assistant, presence detection has been "hard" to say the least.  That said, I have found that the Meraki presence 
detection, and the UBNT presence detection are great.

Update 10/1/2018: I stopped using Meraki gear, and moved to UBUT.  It allows me to (1) keep things local, (2) saves a LOT of money, 
and (3) the Meraki component has not been updated to support the new auth system in HA, and (4) Meraki doens't support modern cyphers
to their webhook system (seriously?!?!). 

### Door / Window Sensors

I utilize Honeywell Ademco 345Mhz sensors; they are VERY cheap, and very small.  I added a NooElec NESDR Nano 2+ SDR and it picks up the signals just fine, and
I created an app called [Honeywell2MQTT](https://github.com/chriskacerguis/honeywell2mqtt) to take the signals to push them to MQTT.

### Synology

Provides backups for offsite services (currently, I use S3 and AzureFiles), and I mount my container volumes on an NFS mount.  Synology has Docker support,
since I am moving HA to move of a data collector, I might just move everything to there.

### Switch Control

I recently switched to use the Luetron Caseta Wireless devices; they are compatble with HA and HomeKit, giving me the best of both worlds.  I have found
them to be MUCH easier to maintain than zWave and their support much better.

### Garage Door

For control of my Garage Doors I use the Liftmaster with MyQ, and the Home Assistant Bridge.  They work great!

### Camera

For camera I use Amcrest cameras, and they are working well.  I found they don't have the processing power to handle the HA polling, so
I have it route to my Synology, and then have HA poll that.  

### Sleep Tracking

I had used the "Eight Sleep - The Sleep Tracker", it's terrible...just don't buy it.  For the time being I have given up on this.

### Arival Tracking

I had been using the Automatic Pro, which worked well.  However, I have a car wit OnStar and it was not allowing me to get their
status reports, so I removed it.

### Enviromental Sensors

I LOVE the WirelessTags product.  They work GREAT.  They have an issue where the local polling does not work over HTTPS (WTF), but
I am working on a http2mqtt gateway that uses the MQTT-Discovery component for HA.  Stay tuned.

### Thermostat

I was running Nest and it worked fine, but (1) it doesn't have HomeKit compability, and despite what Google says, it doesn't look like that
will happen anytime soon, and (2) I like Google...but, frankly Google has a track record of just killing products; and I worry about Nest.
They aren't turning out products like I had hoped (or anyone for that matter), and their latest "release" (as of around 10/2018) was a new 
set of colors for the existing Nest thermostat.

#### Parts List

In case you want to buy something, here is a list with Amazon links for your convience (they are direct links with NO affiliate codes)

| Qty   | Name                                                  | Link                                      |
| 1     | NooElec NESDR Nano 2+ Tiny Black RTL-SDR USB          | [(Amazon)](http://amzn.com/B01B4L48QU/)   |
| many  | Honeywell 5800MINI Wireless Door/Window Contact       | [(Amazon)](http://amzn.com//B01LYOAECP/)  |
| 1     | Intel BOXNUC7I5BNH NUC                                | [(Amazon)](http://amzn.com//B01N2UMKZ5/)  |
| 3     | Honeywell Ademco 5818MNL Recessed Door Transmitter    | [(Amazon)](http://amzn.com/B001649CBC/)   |
| 1     | Synology Diskstation 1517+                            | [(Amazon)](http://amzn.com/B06Y4VN5LJ/)   |
| 5     | Amcrest ProHD Outdoor IP Security Camera IP3M-956E    | [(Amazon)](http://amzn.com//B01E7QMFIM/)  |
| 1     | Amcrest ProHD Outdoor IP Security Camera IP3M-956E    | [(Amazon)](http://amzn.com/B01E7QMFIM/)   |
| 1     | ecobee3 lite Smart Thermostat                         | [(Amazon)](http://amzn.com/B06W56TBLN)    |
| many  | Lutron Caseta Smart Lighting Dimmer                   | [(Amazon)](http://amzn.com/B00KLAXFQA/)   |
| many  | Lutron Caseta Smart Lighting Switch                   | [(Amazon)](http://amzn.com/B017LRCG38/)   |
| 1     | Lutron Caseta Wireless Smart Bridge                   | [(Amazon)](http://amzn.com/B00XPW67ZM/)   |
| many  | Wireless Sensor Tag (13-bit Temperature and Humidity) | [(WirelessTag)](https://bit.ly/2DceKXZ)   |
| many  | PIR KumoSensor                                        | [(WirelessTag)](https://bit.ly/2zCBQnc)   |
| 1     | Ethernet Tag Manager                                  | [(WirelessTag)](https://bit.ly/2FcxTLY)   |


#### Misc Setup Notes

Various tidbits I wanted to capture.

##### Fixes for the SDR

You need to disable kernel driver so that the SDR works correctly.  Please don't ask my why, something conflicts and this just needs to be done.  Just run the 
following on the host machine (where the dongle is plugged into)

```
sudo rmmod -f dvb_usb_rtl28xxu rtl2832
sudo cat <<EOT >> /etc/modprobe.d/no-rtl.conf
blacklist dvb_usb_rtl28xxu
blacklist rtl2832
blacklist rtl2830
EOT
```

##### Special Thanks!

While a lot of this is my work, I took ideas and snippets from others configs and tutorials, and I'd like to thank the following:

* https://www.smarthomebeginner.com/traefik-reverse-proxy-tutorial-for-docker/
* https://github.com/htpcBeginner/AtoMiC-ToolKit-Docker/blob/master/docker-compose-traefik.yml# homeassistant
