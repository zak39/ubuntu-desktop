#!/bin/bash

echo *****************************************
echo " "
echo Mise à jour
echo " "
echo *****************************************

sudo apt-get -y update; sudo apt-get -y upgrade

echo *****************************************
echo " "
echo Installation logiciels
echo " "
echo *****************************************

sudo apt-get -y install unity-tweak-tool vlc clementine synaptic chromium-browser caffeine calibre plank mumble redshift redshift-gtk gcolor2 steam inkscape
sudo apt-get install -f -y # Petit raffraichissement dans l'installation des dépendances

echo *****************************************
echo " "
echo Installation logiciels administrations
echo " "
echo *****************************************

sudo apt-get -y install screen vim htop wireshark evolution virtualbox curl git jq vagrant # Le programme jq permet d'avoir un format json apres une requete

echo *****************************************
echo " "
echo Installation d\'Ansible
echo " "
echo *****************************************

sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:/ansible/ansible -y
sudo apt-get update -y
sudo apt-get install ansible -y

echo *****************************************
echo " "
echo Installation de Spotiy
echo " "
echo *****************************************

# 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get -y update

# 4. Install Spotify
sudo apt-get -y install spotify-client

echo *****************************************
echo " "
echo Installation des icônes numix cercle
echo " "
echo *****************************************

sudo apt-add-repository ppa:numix/ppa -y
sudo apt-get -y update
sudo apt-get -y install numix-icon-theme-circle

echo *****************************************
echo " "
echo Installation des icônes oranchelo
echo " "
echo *****************************************

sudo add-apt-repository ppa:oranchelo/oranchelo-icon-theme -y
sudo apt-get update -y && sudo apt-get install oranchelo-icon-theme -y


echo *****************************************
echo " "
echo Installation du thème numix-gtk
echo " "
echo *****************************************

sudo apt-add-repository ppa:numix/ppa -y
sudo apt-get -y update
sudo apt-get -y install numix-gtk-theme

echo *****************************************
echo " "
echo Installation environnement bureau arc-flatabulous
echo " "
echo *****************************************

sudo add-apt-repository ppa:noobslab/themes -y
sudo apt-get -y update
sudo apt-get install arc-flatabulous-theme

echo *****************************************
echo " "
echo Installation de flatpak
echo " "
echo *****************************************

sudo add-apt-repository ppa:alexlarsson/flatpak -y
sudo apt update -y
sudo apt install flatpak -y
sudo apt-get install xdg-desktop-portal xdg-desktop-portal-gyk -y

echo *****************************************
echo " "
echo Installation de feedreader phase1
echo " "
echo *****************************************

flatpak install http://feedreader.xarbit.net/feedreader-repo/feedreader.flatpakref -y


echo *****************************************
echo " "
echo Téléchargements des logiciels .deb
echo " "
echo *****************************************

mkdir ./fichiers-deb
cd ./fichiers-deb

wget https://github.com/Thomas101/wmail/releases/download/v2.3.0/WMail_2_3_0_linux_x86_64.deb
wget -O brave.deb https://laptop-updates.brave.com/latest/dev/ubuntu64
wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb
wget https://go.skype.com/skypeforlinux-64-alpha.deb
wget https://github.com/oguzhaninan/Stacer/releases/download/v1.0.4/Stacer_1.0.4_amd64.deb
wget https://github.com/feross/webtorrent-desktop/releases/download/v0.18.0/webtorrent-desktop_0.18.0-1_amd64.deb

echo *****************************************
echo " "
echo Installation des logiciels .deb
echo " "
echo *****************************************

sudo dpkg -i -y *.deb
cd ~

echo *****************************************
echo " "
echo Dezip du thème sublime texte numix et renommage
echo " "
echo *****************************************

git clone https://github.com/nauzethc/sublime-text-numix "Numix Theme"
mv "Numix Theme" .config/sublime-text-3/Packages/

echo *****************************************
echo " "
echo Installation de kdeconnect
echo " "
echo *****************************************

sudo add-apt-repository ppa:varlesh-l/indicator-kdeconnect -y
sudo apt update -y && sudo apt install -y kdeconnect indicator-kdeconnect


echo *****************************************
echo " "
echo Installation de brave
echo " "
echo *****************************************

curl https://s3-us-west-2.amazonaws.com/brave-apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://s3-us-west-2.amazonaws.com/brave-apt `lsb_release -sc` main" | sudo tee -a /etc/apt/sources.list.d/brave-`lsb_release -sc`.list
sudo apt update -y
sudo apt install brave -y

echo *****************************************
echo " "
echo Installation de neofetch
echo " "
echo *****************************************

sudo add-apt-repository ppa:dawidd0811/neofetch
sudo apt update -y && sudo apt install neofetch -y

echo *****************************************
echo " "
echo Installation des parametres pour mettre google-drive dans nautilus
echo " "
echo *****************************************

sudo apt install gnome-control-center gnome-online-accounts -y

echo *****************************************
echo " "
echo Personnalisation du fichier .bashrc
echo " "
echo *****************************************

cp .bashrc .bashrc.bak
echo " " >> .bashrc
echo " " >> .bashrc
echo " " >> .bashrc
echo "# Alias perso's" >> .bashrc
echo "alias clr='clear'" >> .bashrc
echo "alias hist='history'" >> .bashrc
echo "alias maj='sudo apt-get update -y; sudo apt-get upgrade -y'" >> .bashrc
echo "alias mem='free -m'" >> .bashrc
echo "alias 49.3='sudo'" >> .bashrc
echo "alias trad='dict -d gcide'" >> .bashrc


echo *****************************************************************
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo Installation de la mise à jour et des programmes est terminées !
echo Il manquera le transfert des dossiers Vidéos et Téléchargements !!
echo " "
echo " "
echo " "
echo " "
echo " "
echo *****************************************************************
