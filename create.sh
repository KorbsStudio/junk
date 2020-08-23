  while ! zenity --password  --ok-label="Continue"| sudo -S cat /dev/null >/dev/null; do
    if $(zenity --question --ellipsize --text="You've typed in the wrong password, click No to try again."); then
      echo "no app-entry made, returning"
      zenity --warning --ellipsize --text="The installation was interrupted."
      return;
    fi
  done
  zenity --info --text="There will be information shown after progress bar." ;
    echo "$appEntry" | sudo -S tee ${launcher}

        (
        echo "# Updating packages" ;
        sudo apt update
        echo "# Installing Nginx server software" ;
        sudo apt install nginx -y
        echo "# Installing PHP (This may take a few minutes)" ;
        sudo apt install software-properties-common -y
        sudo add-apt-repository ppa:ondrej/php
        sudo apt install php7.4-fpm php7.4-common php7.4-dom php7.4-intl php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-soap php7.4-zip php7.4-bcmath -y
        echo "# Installing MariaDB Server" ;
        sudo apt install mariadb-server -y
        echo "# PHPMyAdmin - Downloading" ;
        sudo wget -c https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz
        echo "# PHPMyAdmin - Extracting" ;
        sudo tar xzvf phpMyAdmin-5.0.2-english.tar.gz
        echo "# PHPMyAdmin - Installing /var/www/html/" ;
        sudo mv phpMyAdmin-5.0.2-english /usr/share/phpmyadmin
        sudo ln -s /usr/share/phpmyadmin /var/www/html
        echo "# Configuring Nginx - Downloading required files" ;
        cd ~
        wget "https://raw.githubusercontent.com/KorbsStudio/junk/master/default"
        echo "# Configuring Nginx - Updating existing files" ;
        sudo cp default /etc/nginx/sites-available/default
        echo "# Restarting Nginx" ;
        sudo systemctl restart nginx
        sleep 5 ;
        echo "# PHP - Preventing future errors that may occur" ;
        sudo mkdir /usr/share/phpmyadmin/tmp
        sudo chmod 755 -R /usr/share/phpmyadmin/tmp
        sleep 20 ;
        echo "Wordpress - Downloading latest.zip" ;
        cd ~
        sudo wget "https://wordpress.org/latest.zip"
        echo "Wordpress - Extracting latest.zip" ;
        sudo unzip latest.zip
        echo "Wordpress - Copying files to Nginx server /var/www/html/wordpress/" ;
        sudo cp -R wordpress /var/www/html/
    ) |
zenity --progress --title "Installer by Korbs" \
--width 500 --text --pulsate "Preparing to install..." --percentage=0
clear
wget "https://raw.githubusercontent.com/KorbsStudio/junk/master/sql.txt"
zenity --text-info --width=500 --height=550 --filename="sql.txt" --checkbox="I read this and followed instructions"
sensible-browser http://localhost/wordpress/
zenity --info --text="Your web browser is now opening http://localhost/wordpress/, make sure database name is set as 'wordpress'"
zenity --info --text="Done."
