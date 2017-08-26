# Home-AssistantConfig
 
[![Build Status](https://travis-ci.org/chriskacerguis/Home-AssistantConfig.svg?branch=master)](https://travis-ci.org/chriskacerguis/Home-AssistantConfig)

My Home Assistant Config.  More comming in the README later.

### Hardware
| Qty   | Name                                                  | Link |
| ----- | ----------------------------------------------------- | ----- |
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
| 2     | Amcrest ProHD Outdoor IP Security Camera IP3M-956E    | [(Amazon)](https://www.amazon.com/gp/product/B01E7QMFIM/) |

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
- If you happen to run this in Rancher, you can add the following catalog which has everything.
```
https://github.com/chriskacerguis/rancher-catalog
```