# ide-container-arduino

A Container image for Arduino IDE 2.0.0. Installs the ESP32 and ESP8266 boards while building the container into the mounted directory structure.

# Usage

```
mkdir -p ./mounts ./mounts/.arduino15 ./mounts/.arduinoIDE ./mounts/Arduino
make build
```

Running user must be in the `dialout` group for this to work rootless.


Container start

```
make run
```


Container start with USB device connected

```
make run_usb
```





