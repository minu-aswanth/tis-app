#!/bin/sh
os='centos7'
db_username='root'
db_password='GiclNH28Htms'
db_name='htms'
db_ecb_name='ecb'
licenceKey='c1T8F2121U10b1N1111Ib112S6222O2221S12P172112E21C3b22S212E14222111bc22212112'
client_email='hemanshu.khatri@masstrans.in'
developer_email='parag.raipuria@itspe.co.in'
from_email='HTMS_Gorakhpur_Bypass'


user=$(whoami)
if [ "$user" == "root" ]
then
echo "[***************Updating database configurations***************]";
echo "1 of 3 - Updating username...";
var1="DB_USER,'root'"
var2="DB_USER,'$db_username'"
sed -i -e 's/'"$var1"'/'"$var2"'/g' ./gui/utils/config.php
echo "2 of 3 - Updating password...";
var1="DB_PASSWORD,'itspe'"
var2="DB_PASSWORD,'$db_password'"
sed -i -e 's/'"$var1"'/'"$var2"'/g' ./gui/utils/config.php
echo "3 of 3 - Updating database...";
var1="dbname=tis"
var2="dbname=$db_name"
sed -i -e 's/'"$var1"'/'"$var2"'/g' ./gui/utils/dblinker.php
echo "3 of 3 - Updating ECB database...";
var1="dbname=ecb"
var2="dbname=$db_ecb_name"
sed -i -e 's/'"$var1"'/'"$var2"'/g' ./gui/utils/dblinker_ecb.php
echo "Done";


echo "[***************Creating database***************]";
mysql -u $db_username -p$db_password -e "DROP DATABASE IF EXISTS $db_name;"
mysql -u $db_username -p$db_password -e "CREATE DATABASE $db_name;"
echo "Done";

#echo "[***************Importing database schema***************]";
#mysql -u $db_username -p$db_password $db_name < ./db/schema/schema.sql
#echo "Done";

echo "[***************Initialise database***************]";
mysql -u $db_username -p$db_password $db_name < ./db/data/initialise.sql
echo "Done";

echo "[***************Update licence***************]";
echo $licenceKey > ./licence/licenceKey.txt;
echo "Done";

echo "[***************Checking licence***************]";
chmod 755 ./gui/utils/a.out
licence_output=$(./gui/utils/a.out "TIS" '/var/www/html/htms/licence/licenceKey.txt')
#if [ "$licence_output" == "$licencekey" ]
if [ "$licence_output" == "1" ]
then
	echo "Licence verified successfully";
else
	echo "Licence not valid!! Exiting...";
	exit
fi
echo "Done";

echo "[***************Updating client email address***************]";
var1="'CLIENT_EMAIL','superadmin@example.com'"
var2="'CLIENT_EMAIL',$client_email"
sed -i -e 's/'"$var1"'/'"$var2"'/g' ./gui/utils/config.php
echo "Done";

echo "[***************Updating outgoing email owner***************]";
var1="'FROM_EMAIL_NAME','htms.root@gmail.com'"
var2="'FROM_EMAIL_NAME',$from_email"
sed -i -e 's/'"$var1"'/'"$var2"'/g' ./gui/utils/config.php
echo "Done";

echo "[***************Updating developer email address************]";
var1="'DEVELOPER_EMAIL_NAME','developer@email.com'"
var2="'DEVELOPER_EMAIL_NAME',$developer_email"
sed -i -e 's/'"$var1"'/'"$var2"'/g' ./gui/utils/config.php
echo "Done";

echo "[***************Update crontab for root***************]";
if [ $os == "ubuntu" ]
then
	echo "
*/15 * * * * java -jar /var/www/html/htms/background/pingHTMS.jar /var/www/html/htms/licence
*/15 * * * * java -jar /var/www/html/htms/background/RuleEngine.jar /var/www/html/htms/licence
*/15 * * * * java -jar /var/www/html/htms/background/ATCCProfileUpdater.jar /var/www/html/htms/licence
30 2 * * * php archive_data.php" >> /var/spool/cron/crontabs/root
else
	echo "
*/15 * * * * java -jar /var/www/html/htms/background/pingHTMS.jar /var/www/html/htms/licence
*/15 * * * * java -jar /var/www/html/htms/background/RuleEngine.jar /var/www/html/htms/licence
*/15 * * * * java -jar /var/www/html/htms/background/ATCCProfileUpdater.jar /var/www/html/htms/licence
30 2 * * * php archive_data.php" >> /var/spool/cron/root
fi

echo "[***************Cleaning up***************]";
rm -rf ./background/detector;
rm -rf ./background/met;
rm -rf ./background/nms;
rm -rf ./background/RuleEngine;
rm -rf ./background/vms;
echo "Done";


echo "[***************Finishing up***************]";
sleep 3
else
	echo "Use the script as root";
fi
