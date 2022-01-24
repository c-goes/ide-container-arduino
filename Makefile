build:
	podman build -v $(PWD)/mounts/.arduino15:/root/.arduino15 -v $(PWD)/mounts/.arduinoIDE:/root/.arduinoIDE -v $(PWD)/mounts/Arduino:/root/Arduino --rm --force-rm -t localhost/ide-arduino .
run:
	podman rm -if arduino
	podman run -it --shm-size=1024m --name=arduino -v ./mounts/.arduino15:/root/.arduino15 -v ./mounts/.arduinoIDE:/root/.arduinoIDE -v ./mounts/Arduino:/root/Arduino -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$(DISPLAY) localhost/ide-arduino
run_usb:
	podman rm -if arduino
	podman run --device /dev/ttyUSB0 -it --shm-size=1024m --name=arduino -v ./mounts/.arduino15:/root/.arduino15 -v ./mounts/.arduinoIDE:/root/.arduinoIDE -v ./mounts/Arduino:/root/Arduino -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$(DISPLAY) localhost/ide-arduino
