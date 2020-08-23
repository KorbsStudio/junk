        sudo apt update
        sudo apt install nginx -y
        sudo apt install software-properties-common -y
        sudo add-apt-repository ppa:ondrej/php -y
        sudo apt install php7.4-fpm php7.4-common php7.4-dom php7.4-intl php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-soap php7.4-zip php7.4-bcmath -y
        sudo apt install mariadb-server -y
        sudo wget -c https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz
        sudo tar xzvf phpMyAdmin-5.0.2-english.tar.gz
        sudo mv phpMyAdmin-5.0.2-english /usr/share/phpmyadmin
        sudo ln -s /usr/share/phpmyadmin /var/www/html


        wget "https://raw.githubusercontent.com/KorbsStudio/junk/master/default"
        sudo cp default /etc/nginx/sites-available/default
        sudo systemctl restart nginx




        sudo mkdir /usr/share/phpmyadmin/tmp
        sudo chmod 755 -R /usr/share/phpmyadmin/tmp
        sleep 20 ;

        sudo wget "https://wordpress.org/latest.zip"
        sudo unzip latest.zip
        sudo cp -R wordpress /var/www/html/
