# Home-AssistantConfig
 
[![Build Status](https://travis-ci.org/chriskacerguis/Home-AssistantConfig.svg?branch=master)](https://travis-ci.org/chriskacerguis/Home-AssistantConfig)

My Home Assistant Config.  More comming in the README later.

### Hardware
- 25x GE Z-Wave Wireless Switches [https://www.amazon.com/gp/product/B0035YRCR2/] (Amazon)
- 6x GE Z-wave Wireless Dimmers [https://www.amazon.com/gp/product/B006LQFHN2/] (Amazon)
- 3x Kwikset 910 Z-Wave Signature Series [https://www.amazon.com/Kwikset-910-Signature-Traditional-Electronic/dp/B013PQ1EUK/] (Amazon)
- 2x GoControl/Linear GD00Z-4 Z-Wave Garage Door Opener [https://www.amazon.com/GoControl-Linear-GD00Z-4-Z-Wave-Controller/dp/B00M75TEIU/] (Amazon)
- Aeotec Z-Stick Gen5, Z-Wave Plus USB to create gateway [https://www.amazon.com/Aeotec-Z-Stick-Z-Wave-create-gateway/dp/B00X0AWA6E/] (Amazon)
- NooElec NESDR Nano 2+ Tiny Black RTL-SDR USB [https://www.amazon.com/gp/product/B01B4L48QU/] (Amazon)
- 12x Honeywell 5800MINI Wireless Door/Window Contact [https://www.amazon.com/gp/product/B01LYOAECP/] (Amazon)
- Intel BOXNUC7I5BNH NUC [https://www.amazon.com/gp/product/B01N2UMKZ5/] (Amazon)
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

### Rancher
- If you happen to run this in Rancher, use the docker-compose.yml and the rancher-compose.yml files
- It uses the following images:
```
roflmao/rtl2mqtt
mariadb
cyrilix/rabbitmq-mqtt
home-assistant/home-assistant
```