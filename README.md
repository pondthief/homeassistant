# Home-AssistantConfig
 
[![Build Status](https://travis-ci.org/chriskacerguis/Home-AssistantConfig.svg?branch=master)](https://travis-ci.org/chriskacerguis/Home-AssistantConfig)

My Home Assistant Config.  More comming in the README later.



### Misc Notes
- Setup /etc/udev/rules.d/99-usb-serial.rules
```
ACTION=="add", ATTRS{idVendor}=="0658", ATTRS{idProduct}=="0200", SYMLINK+="zwave"
```
