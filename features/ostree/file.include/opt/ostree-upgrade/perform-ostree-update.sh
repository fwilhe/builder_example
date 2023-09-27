#!/usr/bin/bash

echo Performing OSTree upgrade

ostree log debian/testing/arm64

# Workaround for missing remote in origin file
find /ostree/deploy/*/deploy/*.origin | while read origin_file
do
  sudo cp ./origin $origin_file
done

sudo ostree admin upgrade

# Workaround for wrong location of boot loader entries
sudo mkdir -p /var/ESPmnt
sudo mount /dev/vda1 /var/ESPmnt
sudo cp /boot/loader/entries/* /var/ESPmnt/loader/entries
sudo umount /dev/vda1

ostree log debian/testing/arm64

ostree admin status

echo Done upgrading. Run 'sudo systemctl reboot' to boot into the latest commit.
