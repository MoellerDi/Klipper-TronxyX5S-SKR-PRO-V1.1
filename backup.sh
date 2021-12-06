#! /bin/sh

cd /home/pi/klipper_config/

#git status
git add --all
git commit -m "backup script"
git push
