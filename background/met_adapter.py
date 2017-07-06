import urllib2
import MySQLdb
from bs4 import BeautifulSoup

data = BeautifulSoup(urllib2.urlopen("http://192.168.1.221/?command=TableDisplay&table=Table1&records=1").read(), "lxml").find('table').find_all('tr')[1].find_all('td')
time_stamp = str(data[0].get_text().encode('ascii','ignore'))
record = str(data[1].get_text().encode('ascii','ignore'))
batt_avg = str(data[2].get_text().encode('ascii','ignore'))
road_temp = str(data[3].get_text().encode('ascii','ignore'))
air_temp = str(data[4].get_text().encode('ascii','ignore'))
humidity = str(data[5].get_text().encode('ascii','ignore'))
wind_speed = str(data[6].get_text().encode('ascii','ignore'))
wind_direction = str(data[7].get_text().encode('ascii','ignore'))
tt_c_avg = str(data[8].get_text().encode('ascii','ignore'))
sbt_c_avg = str(data[9].get_text().encode('ascii','ignore'))
visibility = str(data[10].get_text().encode('ascii','ignore'))
tuple_insert = (time_stamp, record, batt_avg, road_temp, air_temp, humidity, wind_speed, wind_direction, tt_c_avg, sbt_c_avg, visibility)
db = MySQLdb.connect("localhost","root","Htms@hcc351!","htms" )
cur = db.cursor()
cur.execute("SELECT count(*) as count FROM `tis_meteorological_dynamic_dump` WHERE `TimeStamp`= '"+time_stamp+"'")
data = cur.fetchall()
check = data[0][0]
if check == 0:
        cur.execute("INSERT INTO `tis_meteorological_dynamic_dump`(`TimeStamp`, `Record`, `BattV_Avg`, `PTemp_C_Avg`, `AirTC_Avg`, `RH`, `WS_ms_Avg`, `WindDir`, `TT_C_Avg`, `SBT_C_Avg`, `Visibility`) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)",tuple_insert)
db.commit()
db.close()