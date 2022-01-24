
FROM docker.io/ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install git curl unzip libglib2.0-0 libx11-6 libxcb-dri3-0 \
	libxcomposite1 	libxcursor1 libxtst6 libxdamage1 libxext6 libgdk-pixbuf2.0-0 \
    libatk-bridge2.0-0 libxi6 libnss3 libatk1.0-0 libgtk-3-0 libdrm2 \
    libgbm1 libxss1 libasound2 libsecret-1-0 libx11-xcb1 python3 python-is-python3 python3-pip \
    && curl -L -o arduino-ide_2.0.0-rc3_Linux_64bit.zip https://downloads.arduino.cc/arduino-ide/arduino-ide_2.0.0-rc3_Linux_64bit.zip \
    && unzip /arduino-ide_2.0.0-rc3_Linux_64bit.zip -d /tmp \
    && mv /tmp/arduino-ide_2.0.0-rc3_Linux_64bit /root/arduino-ide \
    && rm -rf /tmp/arduino-ide* /arduino-ide*.zip \
    && pip3 install pyserial \
    && /root/arduino-ide/resources/app/node_modules/arduino-ide-extension/build/arduino-cli config init --overwrite --additional-urls http://arduino.esp8266.com/stable/package_esp8266com_index.json,https://dl.espressif.com/dl/package_esp32_index.json \
    && /root/arduino-ide/resources/app/node_modules/arduino-ide-extension/build/arduino-cli core update-index \
    && /root/arduino-ide/resources/app/node_modules/arduino-ide-extension/build/arduino-cli core install esp8266:esp8266 \
    && /root/arduino-ide/resources/app/node_modules/arduino-ide-extension/build/arduino-cli core install esp32:esp32


CMD ["/root/arduino-ide/arduino-ide", "--no-sandbox"]
