#!/bin/bash
( crontab -l ; echo "*/$1 * * * * java -jar /var/www/html/htms/background/pingHTMS.jar" ) | crontab -
