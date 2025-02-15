<h1 align="center" id="title">nekrodots / sway</h1>

<p id="description">My beautiful sway setup :)</p>

![clean](https://github.com/user-attachments/assets/15ae0d9a-87a7-46d7-8ed6-b61b372a56ad)
![busy](https://github.com/user-attachments/assets/3d3cc4a7-450d-4b71-a07d-061f3f831230)

  
<h2>🧐 Features</h2>

Here're some of the project's best features:

*   it looks good
*   it's fast
*   it makes you more productive
*   it's not a mess
*   it barely uses ram

<h2>🛠️ Installation Steps:</h2>

<p>01. Install yay (or any other AUR helper)</p>

```
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
```

<p>02. Install packages (those are all the packages I use... you do not need all of them)</p>

```
yay -S 7zip adw-gtk-theme autotiling base base-devel bash-completion bat blueberry bluez-utils brave-bin brightnessctl btop cliphist cmatrix cowsay cups efibootmgr epson-inkjet-printer-escpr f2fs-tools fastfetch flatpak foot fuse3 gimp git google-chrome gparted gradience grim gst-plugin-pipewire helix hyprpicker imv intel-ucode jq kvantum-qt5 kvantum-theme-libadwaita-git libpulse linux linux-firmware localsend-bin lsd mold ncdu networkmanager noto-fonts-cjk noto-fonts-extra nwg-bar nwg-look obs-studio onlyoffice-bin openssh papirus-folders papirus-icon-theme pavucontrol pbzip2 pcsx2-latest-bin pigz pipewire pipewire-alsa pipewire-jack pipewire-pulse plzip polkit-gnome proton-ge-custom-bin qbittorrent qt5-wayland qt5ct qt6-imageformats qt6ct slurp spotify-launcher steam stremio sway swaybg swayidle swaylock-effects swaync system-config-printer tealdeer thorium-browser-bin throttled thunar thunar-archive-plugin thunar-media-tags-plugin tlp ttf-apple-emoji ttf-noto-nerd ttf-roboto ttf-roboto-mono ttf-roboto-mono-nerd unrar-free unzip vesktop-bin vim vlc waybar wdisplays wireplumber wlsunset wmenu xdg-desktop-portal-wlr xorg-xhost xorg-xwayland xwaylandvideobridge yay-bin zip zram-generator
```

<p>03. Clone the repo</p>

```
cd && git clone https://github.com/FelipeFMA/nekrodots-sway.git
```

<p>04. Copy the configuration files</p>

```
cp ~/nekrodots-sway/config/* ~/.config/ -r
```

<p>05. Copy the throttled config to the right place</p>

```
sudo cp ~/nekrodots-sway/throttled.conf /etc/throttled.conf
```

<p>06. Copy the tlp config to the right place</p>

```
sudo cp ~/nekrodots-sway/tlp.conf /etc/tlp.conf
```

<p>07. Copy the bash config (You may want to make a backup of your config first!!)</p>

```
cp ~/nekrodots-sway/bashrc ~/.bashrc
```

<p>08. Open gradience, make "Standalone Color" and "Background Colpr" white, "Foreground Color" Black and apply</p>

<p>09. Make the papirus folder be white</p>

```
papirus-folders -C white
```

<p>10. Open nwg-look and apply both the theme and the papirus icons</p>

<p>11. Edit /etc/environment and put: </p>

  ```XDG_SESSION_TYPE=wayland```
  ```XDG_CURRENT_DESKTOP=sway```
  ```QT_QPA_PLATFORMTHEME=qt5ct```


<p>12. Open both qt5ct and qt6ct and apply the kvantum theme and the papirus icons</p>

<p>13. Start services (only if you need them)</p>

```
sudo systemctl enable --now bluetooth
```

```
sudo systemctl enable --now tlp
```

```
sudo systemctl enable --now throttled
```


<p>14. That's it... Reboot and enjoy. :)</p>
