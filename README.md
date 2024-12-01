<h1 align="center" id="title">Nekrodots</h1>

<p id="description">My beautiful sway setup :)</p>

  ![clean](https://github.com/user-attachments/assets/e2333ae7-4e96-4a66-893e-c6ebbab00490)

  ![busy](https://github.com/user-attachments/assets/8f22be4c-a655-4b9e-9e7f-540cc42af048)

  
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
yay -S adw-gtk-theme ani-cli autotiling awesome-terminal-fonts base base-devel bash-completion blueberry bluez bluez-utils brightnessctl btop cliphist clipmon-git efibootmgr f2fs-tools fastfetch ffmpeg foot git gradience grim gst-plugin-pipewire helix hyprlock hyprpicker imagemagick imv intel-ucode joplin-appimage jq jre8-openjdk kbd-br-thinkpad kvantum-qt5 kvantum-theme-libadwaita-git libpulse libreoffice-still linux-firmware linux-zen localsend-bin lsd man-db man-pages mpv nano networkmanager noto-fonts noto-fonts-cjk noto-fonts-extra nwg-bar nwg-look onlyoffice-bin openssh papirus-folders papirus-icon-theme pavucontrol pipewire pipewire-alsa pipewire-jack pipewire-pulse prismlauncher qt5ct qt6ct screen slurp steam stress sway swaybg swayidle swaync thorium-browser-bin throttled thunar thunar-archive-plugin thunar-media-tags-plugin tldr tlp ttf-apple-emoji ttf-jetbrains-mono-nerd ttf-noto-nerd ttf-roboto ttf-roboto-mono ttf-roboto-mono-nerd unrar-free unzip vesktop-bin vlc waybar wireplumber wl-clipboard wmenu xorg-xwayland xterm yay-bin zip zram-generator
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

<p>11. Edit /etc/environment and put QT_QPA_PLATFORMTHEME=qt5ct</p>

<p>12. Open bpth qt5ct and qt6ct and apply the kvantum theme and the papirus icons</p>

<p>13. Start services (only if you need them)</p>

```
sudo systemctl enable bluetooth
```

```
sudo systemctl enable tlp
```

```
sudo systemctl enable throttled
```

```
systemctl --user start clipmon
```

<p>14. That's it... Reboot and enjoy. :)</p>
