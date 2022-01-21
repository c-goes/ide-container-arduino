
FROM docker.io/ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install git curl unzip libglib2.0-0 libx11-6 libxcb-dri3-0 \
	libxcomposite1 	libxcursor1 libxtst6 libxdamage1 libxext6 libgdk-pixbuf2.0-0 \
    libatk-bridge2.0-0 libxi6 libnss3 libatk1.0-0 libgtk-3-0 libdrm2 \
    libgbm1 libxss1 libasound2 libsecret-1-0 libx11-xcb1


RUN curl -L -o arduino-ide_2.0.0-rc3_Linux_64bit.zip https://downloads.arduino.cc/arduino-ide/arduino-ide_2.0.0-rc3_Linux_64bit.zip && unzip /arduino-ide_2.0.0-rc3_Linux_64bit.zip -d /tmp && mv /tmp/arduino-ide_2.0.0-rc3_Linux_64bit /root/arduino-ide && rm -rf /tmp/arduino-ide*

RUN apt-get -y install python3 python-is-python3 python3-pip
RUN pip3 install pyserial

CMD ["/root/arduino-ide/arduino-ide", "--no-sandbox"]
