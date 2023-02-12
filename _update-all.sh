# source: https://docs.vorondesign.com/community/howto/drachenkatze/automating_klipper_mcu_updates.html
############

sudo service klipper stop
cd ~/klipper
#git pull

make clean KCONFIG_CONFIG=config.octopus
make menuconfig KCONFIG_CONFIG=config.octopus
make KCONFIG_CONFIG=config.octopus
read -p "Octopus firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

./scripts/flash-sdcard.sh /dev/serial/by-id/usb-Klipper_stm32f446xx_260022000650534E4E313020-if00 btt-octopus-f446-v1.1
read -p "Octopus firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

#make clean KCONFIG_CONFIG=config.rpi
#make menuconfig KCONFIG_CONFIG=config.rpi
#make KCONFIG_CONFIG=config.rpi
#read -p "RPi firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
#make flash KCONFIG_CONFIG=config.rpi

sudo service klipper start
