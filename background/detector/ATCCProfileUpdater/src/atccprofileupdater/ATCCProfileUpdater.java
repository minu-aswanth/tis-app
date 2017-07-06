/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package atccprofileupdater;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mustafa
 */
public class ATCCProfileUpdater {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        if(checkLicence(args[0])){
            
            Connection conn = null;
            dataConnectionObject dco = new dataConnectionObject();
            PreparedStatement pst = null;
            ResultSet rs = null;
            PreparedStatement pst2 = null;
            ResultSet rs2 = null;
            PreparedStatement pst3 = null;
            int trafficFlow = 0;
            float avgSpeed = 0;
            String scn = null;
            
            try {
                conn = dco.getConnection();
                StringBuffer sb = new StringBuffer();
                
                pst = conn.prepareStatement("SELECT SCN, COUNT(ID) FROM tis_detector_dynamic_vbv "
                        + "WHERE TimeStamp > (now() - INTERVAL 19 MINUTE) GROUP BY SCN");
                rs = pst.executeQuery();
                
                while(rs.next()){
                    trafficFlow = rs.getInt("COUNT(ID)");
                    scn = rs.getString("SCN");
                    
                    pst2 = conn.prepareStatement("SELECT ROUND(AVG((CASE WHEN Speed <> 0 THEN Speed ELSE NULL END)),1) AS Avg_speed FROM "
                        + "tis_detector_dynamic_vbv WHERE TimeStamp > (now() - INTERVAL 19 MINUTE) AND SCN=?");
                    pst2.setString(1, scn);
                    rs2 = pst2.executeQuery();
                    
                    if(rs2.next()){
                        avgSpeed = rs2.getFloat("Avg_speed");
                        
                        pst3 = conn.prepareStatement("UPDATE `utmc_detector_dynamic` SET `TotalFlow`=?, `Speed`=?, `LastUpdated`=now() "
                                + "WHERE `SystemCodeNumber`=?");
                        
                        pst3.setInt(1, trafficFlow);
                        pst3.setFloat(2, avgSpeed);
                        pst3.setString(3, scn);
                        
                        pst3.executeUpdate();
                    }
                    
                }
                
            } catch (IOException ex) {
                Logger.getLogger(ATCCProfileUpdater.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ATCCProfileUpdater.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            finally{
                try{
                    if(conn!=null)conn.close();
                    if(pst!=null)pst.close();
                    if(rs!=null)rs.close();
                    if(pst2!=null)pst2.close();
                    if(rs2!=null)rs2.close();
                    if(pst3!=null)pst3.close();
                }catch (SQLException ex) {
                    Logger.getLogger(ATCCProfileUpdater.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            }
            
            
        } else {
            System.out.println("License Key error. Please contact Tech Support.");
        }
    }
    
    public static boolean checkLicence(String licenceKeyPath){
        
        String command = "/var/www/html/htms/gui/utils/a.out RUL "+licenceKeyPath+"/licenceKey.txt";
        Process p;
        
        BufferedReader reader=null;
        
	try {
            p = Runtime.getRuntime().exec(command);
            p.waitFor();
            reader = new BufferedReader(new InputStreamReader(p.getInputStream()));

            String line = "";			
            if ((line = reader.readLine())!= null) {
                if("ufhdhsfjscsdj".equalsIgnoreCase(line)) return true;
            }
            //reader.close();
            return false;
            

	} catch (Exception e) {
            e.printStackTrace();
            return false;
	}
        
        finally{
            try {
                if(reader!=null)reader.close();
            } catch (IOException ex) {
                Logger.getLogger(ATCCProfileUpdater.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
}
