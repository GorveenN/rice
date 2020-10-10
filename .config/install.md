# Install
## Time
```
timedatectl set-ntp true
```

## Create and mount partitions
mountpoint   | size | format cmd
------|------|---------------
/boot | 1G   | mkfs.fat -F32
-     | 8G   | mkswap; swapon
/root | 50G  | mkfs.ext4
/home | rest | mkfs.ext4

## Install packages
```
pacstrap /mnt base base-devel linux linux-firmware vim networkmanager grub efibootmgr
```

## Gen fstab
```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

## Change fs root to new install
```
arch-chroot /mnt
```

## Time
```
ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
hwclock --systohc
```

## Localization
edit `/etc/locale.gen` and run:
```
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=pl" >> /etc/vconsole.conf
```

## Networking
```
systemctl enable NetworkManager

echo "xps" >> /etc/hostname

## /etc/hosts
127.0.0.1	localhost
::1		localhost
127.0.1.1	myhostname.localdomain	myhostname
```

## Bootloader
```
grub-install --target=x86_64-efi --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg
```
## Setup password
```
passwd
```

# Postinstall

## LARBS
```
pacman -S git
curl -LO larbs.xyz/larbs.sh
bash larbs.sh -r https://github.com/GorveenN/rice -p https://raw.githubusercontent.com/GorveenN/rice/master/.config/progs.csv
```

## Polish diactricts
```
localectl set-x11-keymap pl
```

## Reflector setup
```
sudo pacman -S reflector
sudo systemctl enable reflector

# /etc/xdg/reflector/reflector.conf
--save /etc/pacman.d/mirrorlist
--protocol https
--country Poland
--latest 5
--sort age
```

## Bluetooth
```
sudo pacman -S bluez blueman bluez-utils pulseaudio-modules-bt
echo "load-module module-bluetooth-policy" >> /etc/pulse/system.pa
echo "load-module module-bluetooth-discover" >> /etc/pulse/system.pa
```

## backlight
```
sudo pacman -S light
sudo gpasswd -a xps video
```

## touchpad
```
##/etc/X11/xorg.conf.d/30-touchpad.conf
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "NaturalScrolling" "true"
EndSection
```

# Qt theme
```
yay -S qt5ct qt5-styleplugins
```
Run qt5ct and choose desired theme.
