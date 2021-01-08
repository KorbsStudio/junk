    (
      echo "# Downloading..."
      sudo mkdir /usr/share/korbs-studio/
      cd /usr/share/korbs-studio/
      sudo wget "https://raw.githubusercontent.com/KorbsStudio/add-new-dark-theme-to-5.1.7/master/sh-files/install.sh"
      cd /usr/share/icons/
      sudo wget "https://github.com/KorbsStudio/junk/raw/master/eOSDark.png"
      echo "# Adding to application menu"
      sleep 1 ;
      cd /usr/share/applications/
      sudo wget "https://raw.githubusercontent.com/KorbsStudio/junk/master/theme-install.desktop"
      echo "Run elementary OS 6.0 Theme Installer from your applications menu"
    ) |
zenity --progress --title "elementary OS 6.0 Dark Theme" --pulsate \
--width 400 --text "Preparing..." --percentage=0
