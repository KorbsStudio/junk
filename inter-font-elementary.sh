echo "# Downloading font"
cd /usr/share/fonts
sudo wget "https://github.com/KorbsStudio/add-new-dark-theme-to-5.1.7/raw/master/font/inter.zip"
echo "# Installing font"
sudo unzip inter.zip
echo "# Switching font"
gsettings set org.gnome.desktop.interface document-font-name 'Inter Regular 10'
gsettings set org.gnome.desktop.interface default-font-name 'Inter Regular 9'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Inter Bold 9'
echo "# Cleaning" ;
cd /usr/share/korbs-studio/
cd /usr/share/fonts
sudo rm inter.zip
