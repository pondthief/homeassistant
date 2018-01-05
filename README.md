# Home-AssistantConfig
 
[![Build Status](https://travis-ci.org/chriskacerguis/Home-AssistantConfig.svg?branch=master)](https://travis-ci.org/chriskacerguis/Home-AssistantConfig)

My Home Assistant Config.  I run everyting in Docker (Ubuntu host) with the [Rancher](https://rancher.com) container management platform; with the following containers.

### Containers

| What              | Docker Hub                                                                                    | Notes |
| ----------------- | --------------------------------------------------------------------------------------------- | ---------------------------------------- |
| Home Assistant    | [homeassistant/home-assistant/](https://hub.docker.com/r/homeassistant/home-assistant/)       | The brains of everything |
| Nagios            | [jasonrivers/nagios/](https://hub.docker.com/r/jasonrivers/nagios/)                           | Handles monitoring and alerting |
| MariaDB           | [mariadb/](https://hub.docker.com/_/mariadb/)                                                 | DB for Rancher |
| MQTT              | [ncarlier/mqtt/](https://hub.docker.com/r/ncarlier/mqtt/)                                     | MQTT server |
| Honeywell2MQTT    | [chriskacerguis/honeywell2mqtt/](https://hub.docker.com/r/chriskacerguis/honeywell2mqtt/)     | Takes the SDR packets from the 5800 MINIs and sends them to the MQTT server |

### Hardware
| Qty   | Name                                                  | Link |
| ----- | ----------------------------------------------------- | ---- |
| 21    | GE Z-Wave Wireless Switches                           | [(Amazon)](https://www.amazon.com/gp/product/B0035YRCR2/) |
| 9     | GE Z-wave Wireless Dimmers                            | [(Amazon)](https://www.amazon.com/gp/product/B006LQFHN2/) |
| 3     | Kwikset 910 Z-Wave Signature Series                   | [(Amazon)](https://www.amazon.com/Kwikset-910-Signature-Traditional-Electronic/dp/B013PQ1EUK/) |
| 2     | Open Garage                                           | [(OpenGarage)](https://opengarage.io) |
| 1     | Aeotec Z-Stick Gen5, Z-Wave Plus USB                  | [(Amazon)](https://www.amazon.com/Aeotec-Z-Stick-Z-Wave-create-gateway/dp/B00X0AWA6E/) |
| 1     | NooElec NESDR Nano 2+ Tiny Black RTL-SDR USB          | [(Amazon)](https://www.amazon.com/gp/product/B01B4L48QU/) |
| 12    | Honeywell 5800MINI Wireless Door/Window Contact       | [(Amazon)](https://www.amazon.com/gp/product/B01LYOAECP/) |
| 1     | Intel BOXNUC7I5BNH NUC                                | [(Amazon)](https://www.amazon.com/gp/product/B01N2UMKZ5/) |
| 3     | Honeywell Ademco 5818MNL Recessed Door Transmitter    | [(Amazon)](https://www.amazon.com/gp/product/B001649CBC/) |
| 1     | Nest Thermostat (3rd Generataion)                     | [(Nest)](https://nest.com) |
| 3     | Amcrest ProHD Outdoor IP Security Camera IP3M-956E    | [(Amazon)](https://www.amazon.com/gp/product/B01E7QMFIM/) |
| 3     | Aeotec Multisensor 6                                  | [(Amazon)](https://www.amazon.com/Aeotec-Multisensor-temperature-humidity-vibration/dp/B0151Z8ZQY/) |
| 1     | Eight Sleep - The Sleep Tracker                       | [(Eight Sleep)](https://eightsleep.com/products/eight-sleep-tracker) |
| 1     | Automatic Pro                                         | [(Automatic)](https://www.automatic.com/pro/) |

### Indoor Location Tracking

My home automation also uses an internal bluetooth tracking system.  It uses several Raspberry Pi 3's, running the excellent [Room Assistant](https://github.com/mKeRix/room-assistant) in conjunction with the mqtt_room component of Home Assistant (those listen for the iBeacons and tell HA where the person is).  Then on my families keychains (or dog collar for the dog) are [Radbeacons](https://store.radiusnetworks.com/collections/all/products/radbeacon-dot).  Just install the default RASPBIAN Lite, and then [run this script](https://gist.github.com/chriskacerguis/b8f6baf35780670c573fa7197a8b6256)

### Misc Notes
- Setup /etc/udev/rules.d/99-usb-serial.rules
```
ACTION=="add", ATTRS{idVendor}=="0658", ATTRS{idProduct}=="0200", SYMLINK+="zwave"
ACTION=="add", ATTRS{idVendor}=="0bda", ATTRS{idProduct}=="2838", SYMLINK+="sdr"
```
- Disable kernel driver so that the SDR works correctly
```
sudo rmmod -f dvb_usb_rtl28xxu rtl2832
```
- Create a file permanetment disable 
```
sudo vi /etc/modprobe.d/no-rtl.conf
```
with the following:
```
blacklist dvb_usb_rtl28xxu
blacklist rtl2832
blacklist rtl2830
```

### zwave ID mapping
1 - USB Stick
2 - Back Door (lock)
3 - Deck Flood (switch)
4 - Kitchen Sink (light)
5 - Kitchen Cabinets (switch)
6 - Kitchen Cans (light)
7 - Kitchen Island (switch)
8 - Kitchen Table (light)
9 - Craft Cans (switch)
10 - Front Entry (switch)
11 - Outside Security (switch)
12 - Front Yard (switch)
13 - Front Door (lock)
14 - Living Room Lamp (switch)
15 - Living Room Overhead (light)
16 - Living Room Cans (light)
17 - Study Overhead (switch)
18 - Study Cans (light)
19 - Hallways Cans (light)
20 - Laundry Room Overhead (switch)
21 - Garage Door (lock)
22 - Guest Overhead (switch)
23 - Clara Overhead (light)
24 - Guest Bath Fan (switch)
25 - Guest Bath Shower (switch)
26 - Guest Bath Sink (switch)
27 - Master Bed Cans (light)
28 - Master Bed Fan (switch)
29 - Master Bed Fan Light (switch)
30 - Master Bath Fan (switch)
31 - Master Bath Shower (switch)
32 - Master Bath Sink (switch)
33 - Chris Bedside (switch)
34 - Megan Bedside (switch)
35 - Laundry MultiSensor
36 - Master Bath MultiSensor
37 - Study MultiSensor
38 - Kitchen MultiSensor
39 - TV Room MultiSensor
40 - Guest Bath MultiSensor
41 - Guest MultiSensor