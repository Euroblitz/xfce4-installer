#!/bin/bash

#Script feito com base no tutorial de instalação do XFCE minimal e personalizado por mim para uso próprio na minha máquina. 
#Sinta-se livre para editá-lo, modificá-lo ou pegar partes dele como quiser. Feito para ser usado com o Debian 10 Netinstall 
#sem garantia de funcionar com Ubuntu, mas pode ser modificado para funcionar com o mesmo. A intenção é deixar o sistema configurado 
#e com os programas que eu mais utilizo e sinto necessário de ter no meu sistema assim que ele é instalado do básico apenas com linha 
#de comando, já que não separo a partição /home do sistema.

#Atualizar a lista de repositórios
apt-get update

#Suporte NTFS e pacotes básicos/APT
apt-get install -y sudo wget curl gvfs ntfs-3g neofetch dialog gpg

#Suporte a pacotes 32-bit e repositório contrib/non-free
sudo dpkg --add-architecture i386
sed -i 's/main/main contrib non-free/' /etc/apt/sources.list
apt-get update

#Servidor X11/Xorg, sistema e codecs de video e audio
apt-get --no-install-recommends install -y xserver-xorg-core
apt-get --no-install-recommends install -y xserver-xorg-video-fbdev
apt-get --no-install-recommends install -y xserver-xorg
apt-get --no-install-recommends install -y x11-xserver-utils
apt-get --no-install-recommends install -y lightdm
apt-get --no-install-recommends install -y qt4-qtconfig
apt-get --no-install-recommends install -y pulseaudio
apt-get --no-install-recommends install -y gtk2-engines gtk2-engines-pixbuf
apt-get install -y ffmpeg

#XFCE4 Desktop e programas do DE
apt-get --no-install-recommends install -y xfwm4
apt-get --no-install-recommends install -y xfce4-session
apt-get --no-install-recommends install -y xfce4-panel
apt-get --no-install-recommends install -y xfdesktop4
apt-get --no-install-recommends install -y xfce4-power-manager
apt-get --no-install-recommends install -y thunar
apt-get --no-install-recommends install -y xfce4-terminal
apt-get --no-install-recommends install -y mousepad
apt-get --no-install-recommends install -y atril
apt-get --no-install-recommends install -y pavucontrol
apt-get --no-install-recommends install -y viewnior

#Complementos do sistema e do XFCE
apt-get --no-install-recommends install -y gnome-disk-utility
apt-get --no-install-recommends install -y gnome-system-monitor
apt-get --no-install-recommends install -y policykit-1
apt-get --no-install-recommends install -y xfce4-pulseaudio-plugin
apt-get install -y xfce4-notifyd
apt-get install -y xfce4-whiskermenu-plugin
apt-get install -y fonts-takao-mincho fonts-takao

#Programas extras
apt-get --no-install-recommends install -y vlc
apt-get install -y firefox-esr firefox-esr-l10n-pt-br
apt-get install -y kdenlive
apt-get install -y flameshot
apt-get install -y obs-studio
apt-get install -y steam
apt-get install -y rythmbox rythmbox-plugins

#Instalação do DockBarX para Debian XFCE
echo "deb http://ppa.launchpad.net/xuzhen666/dockbarx/ubuntu bionic main" > /etc/apt/sources.list.d/dockbarx.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 77D026E2EEAD66BD
apt-get update
wget http://ftp.us.debian.org/debian/pool/main/g/gnome-python/python-gconf_2.28.1+dfsg-1.2_amd64.deb
dpkg -i python-gconf_2.28.1+dfsg-1.2_amd64.deb
apt install -f
apt-get --no-install-recommends install -y xfce4-dockbarx-plugin

#Instalação e repositorio do Lutris
echo "deb http://download.opensuse.org/repositories/home:/strycore/Debian_9.0/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list
wget -q https://download.opensuse.org/repositories/home:/strycore/Debian_9.0/Release.key -O- | sudo apt-key add -
sudo apt-get update
apt-get install -y lutris

#Instalação e repositorio do Spotify Client
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install -y spotify-client

#Instalação do Wine [NOTA]

#Infelizmente tive um problema aqui e seguindo os passos do WineHQ para a instalação o sistema não consegue achar o repositório, fazer manualmente depois assim que o sistema estiver funcionando. O porém é que a opção de contexto 'Abrir com > Wine' não irá aparecer com esse método, mas funciona normalmente para atalhos, jogos da steam e do Lutris

#Drivers e programas proprietários
apt-get install -y firmware-realtek firmware-linux-nonfree firmware-linux-free
apt-get install -y amd64-microcode
apt-get install -y nvidia-driver nvidia-xconfig
sudo nvidia-xconfig

#Configuração da rede no XFCE com o networkmanager
apt-get --no-install-recommends install -y network-manager-gnome
sed -i 's/false/true/g' /etc/NetworkManager/NetworkManager.conf

sudo reboot
