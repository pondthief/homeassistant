# Home-AssistantConfig
 
[![Build Status](https://travis-ci.org/chriskacerguis/Home-AssistantConfig.svg?branch=master)](https://travis-ci.org/chriskacerguis/Home-AssistantConfig)

My Home Assistant Config.  More comming in the README later.

### Hardware
- 25x GE Z-Wave Wireless Switches [(Amazon)](https://www.amazon.com/gp/product/B0035YRCR2/)
- 6x GE Z-wave Wireless Dimmers [(Amazon)](https://www.amazon.com/gp/product/B006LQFHN2/)
- 3x Kwikset 910 Z-Wave Signature Series [(Amazon)](https://www.amazon.com/Kwikset-910-Signature-Traditional-Electronic/dp/B013PQ1EUK/)
- 2x GoControl/Linear GD00Z-4 Z-Wave Garage Door Opener [(Amazon)](https://www.amazon.com/GoControl-Linear-GD00Z-4-Z-Wave-Controller/dp/B00M75TEIU/)
- Aeotec Z-Stick Gen5, Z-Wave Plus USB to create gateway [(Amazon)](https://www.amazon.com/Aeotec-Z-Stick-Z-Wave-create-gateway/dp/B00X0AWA6E/)
- NooElec NESDR Nano 2+ Tiny Black RTL-SDR USB [(Amazon)](https://www.amazon.com/gp/product/B01B4L48QU/)
- 12x Honeywell 5800MINI Wireless Door/Window Contact [(Amazon)](https://www.amazon.com/gp/product/B01LYOAECP/)
- Intel BOXNUC7I5BNH NUC [(Amazon)](https://www.amazon.com/gp/product/B01N2UMKZ5/)
- Nest Thermostat (3rd Gen)


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

- The Zwave devices MUST be "linked" in this order otherwise configs will be borked

| Name                  | Type      | Notes |
| --------------------- | --------- | ----- |
| Study Overhead        | switch    |       |
| Entry                 | switch    |       |
| Front Unknown         | switch    |       | 
| Front Yard            | switch    |       | 
| Craft Overhead        | switch    |       | 
| Kitchen Island        | switch    |       | 
| Under Cabinets        | switch    |       | 
| Back Yard             | switch    |       | 
| Living Unknown        | switch    |       | 
| Living Overhead       | switch    |       | 
| Guest Overhead        | switch    |       | 
| Guest Bath            | switch    |       | 
| Guest Bath Mirror     | switch    |       | 
| Guest Bath Shower     | switch    |       | 
| Master Bed Fan        | switch    |       | 
| Master Fan Light      | switch    |       | 
| Megan Bedside         | switch    |       | 
| Chris Bedside         | switch    |       | 
| Master Bath Mirror    | switch    |       | 
| Master Bath Shower    | switch    |       | 
| Master Bath Fan       | switch    |       | 
| Study Cans            | light     |       |
| Kitchen Table         | light     |       |
| Kitchen Cans          | light     |       |
| Main Overhead         | light     |       |
| Main Cans             | light     |       |
| Hallway Cans          | light     |       |
| Clara's Overhead      | light     |       |
| Master Cans           | light     |       |
| Kitchen Sink          | light     |       |
| Garage Door Lock      | lock      |       |
| Front Door Lock       | lock      |       |
| Back Door Lock        | lock      |       |



### Rancher
- If you happen to run this in Rancher, use the docker-compose.yml and the rancher-compose.yml files
- It uses the following images:
```
roflmao/rtl2mqtt
mariadb
cyrilix/rabbitmq-mqtt
home-assistant/home-assistant
```