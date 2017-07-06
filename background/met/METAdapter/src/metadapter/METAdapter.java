package metadapter;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 *
 * @author Parag Raipuria
 */
public class METAdapter {

    public static void main(String[] args) throws FileNotFoundException, IOException, SQLException, ParseException {
        
        if(checkLicence(args[0])){
            
            dataConnectionObject dco = new dataConnectionObject();
            Connection conn = dco.getConnection();

            Timestamp lastEntryTS = searchLastEntry(conn);

            FileReader file = new FileReader(new File("C:/Campbellsci/LoggerNet/CR1000_Table1.dat"));
            BufferedReader br = new BufferedReader(file);
            String temp = br.readLine();
            temp = br.readLine();
            temp = br.readLine();
            temp = br.readLine();
            String[] cols = null;



            while (temp != null) {
               temp = br.readLine();
               if(temp!=null){
                   cols = temp.split(",");

                   for(int i=0;i<=10;i++){
                       if(cols[i].contains("NAN"))
                           cols[i]="0";
                   }

                   String ts = cols[0];
                   if(cols[0] != null){
                       ts = ts.substring(1, 20);
                   }

                   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
                   Date parsedDate = dateFormat.parse(ts);
                   Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());

                   if(lastEntryTS.before(timestamp)){
                       insertToDumpDB(cols,timestamp,lastEntryTS,conn);
                   }

               }

            }

            updateServicesDB(conn, "MET Adapter");

            if(conn!=null)conn.close();
        
        } else {
            System.out.println("Licence Key error. Please contact Tech Support.");
        }        
            
    }
    
    public static boolean checkLicence(String licenceKeyPath){
        
        String command = licenceKeyPath+"/checkLicence.exe MET "+licenceKeyPath+"/licenceKey.txt";
        Process p;
        
	try {
            p = Runtime.getRuntime().exec(command);
            p.waitFor();
            BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));

            String line = "";	
            if ((line = reader.readLine())!= null) {
                System.out.println(line);
                if("cxvkxdvsdjif".equalsIgnoreCase(line)) return true;
            }
            reader.close();
            return false;

	} catch (Exception e) {
            e.printStackTrace();
            return false;
	}
    }

    private static Timestamp searchLastEntry(Connection conn) throws IOException, SQLException {
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try{
            pst = conn.prepareStatement("SELECT MAX(TimeStamp) FROM tis_meteorological_dynamic_dump");
            
            rs = pst.executeQuery();
            
            rs.next();
            Timestamp ts = rs.getTimestamp("MAX(TimeStamp)");
            return ts;
            
        } catch(SQLException sqe){
            System.out.println("Error while getting Last Row ID : "+sqe);
        }
        
        finally{
            if(pst!=null)pst.close();
            if(rs!=null)rs.close();
        }
        
        return null;
    }

    private static void insertToDumpDB(String[] cols, Timestamp timestamp,Timestamp ts, Connection conn) throws IOException, SQLException, ParseException {
        PreparedStatement pst = null;
        PreparedStatement pst2 = null;
        
        try{
            pst = conn.prepareStatement("INSERT INTO `tis_meteorological_dynamic_dump`(`TimeStamp`, "
                    + "`Record`, `BattV_Avg`, `PTemp_C_Avg`, `AirTC_Avg`, `RH`, `WS_ms_Avg`, `WindDir`, "
                    + "`TT_C_Avg`, `SBT_C_Avg`, `Visibility`) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?)");
            
            pst.setTimestamp(1, timestamp);
            pst.setInt(2, Integer.parseInt(cols[1]));
            pst.setDouble(3, Double.parseDouble(cols[2]));
            pst.setDouble(4, Double.parseDouble(cols[3]));
            pst.setDouble(5, Double.parseDouble(cols[4]));
            pst.setDouble(6, Double.parseDouble(cols[5]));
            pst.setDouble(7, Double.parseDouble(cols[6]));
            pst.setDouble(8, Double.parseDouble(cols[7]));
            pst.setDouble(9, Double.parseDouble(cols[8]));
            pst.setDouble(10, Double.parseDouble(cols[9]));
            pst.setInt(11, Integer.parseInt(cols[10]));
            
            pst.executeUpdate();
            
            
            pst2 = conn.prepareStatement("UPDATE `utmc_meteorological_dynamic` SET "
                    + "`RoadTemp`=?,"
                    + "`VisibilityDist`=?,"
                    + "`AirTemp`=?,"
                    + "`Humidity`=?,"
                    + "`WindSpeed`=?,"
                    + "`WindDirection`=?,"
                    + "`LastUpdated`=? WHERE `LastUpdated`=?");
            
            pst2.setDouble(1, Double.parseDouble(cols[3]));
            pst2.setInt(2, Integer.parseInt(cols[10]));
            pst2.setDouble(3, Double.parseDouble(cols[4]));
            pst2.setDouble(4, Double.parseDouble(cols[5]));
            pst2.setDouble(5, Double.parseDouble(cols[6]));
            pst2.setDouble(6, Double.parseDouble(cols[7]));
            pst2.setTimestamp(7, timestamp);
            pst2.setTimestamp(8, ts);
            
            pst2.executeUpdate();
            
            
            
        } catch(SQLException sqe){
            System.out.println("Error while inserting MET Adapter details into DB "+sqe);
        }
        
        finally{
            if(pst!=null)pst.close();
        }
    }

    private static void updateServicesDB(Connection conn, String service_name) throws SQLException {
        PreparedStatement pst = null;
        java.util.Date date = new Date();
        Timestamp timestamp = new Timestamp(date.getTime());
            
        
        try{
            pst = conn.prepareStatement("UPDATE `htms_services` SET `LastUpdated`=? WHERE `Service`=?");
            pst.setTimestamp(1, timestamp);
            pst.setString(2, service_name);
            
            pst.executeUpdate();
            
        } catch(SQLException sqe){
            System.out.println("Error while updating Services DB : "+sqe);
        }
        
        finally{
            if(pst!=null)pst.close();
        }
    }
    
}
