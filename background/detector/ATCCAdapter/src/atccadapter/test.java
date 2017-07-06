/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package atccadapter;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Admin
 */
public class test {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        FileReader f1 = null;
        Connection conn = null;
        try {
            f1 = new FileReader("C:\\Users\\Admin\\Downloads\\atcc pkg-3.txt");
            BufferedReader in = new BufferedReader(f1);
            List<String> responseEcho = new ArrayList<String>();
            ;
            String line=null;
            String ts=null, time=null;
            Pattern r = null;
            Matcher m = null;
            int lane = 0, classAxle=0, classSpeed=0, classLength=0, vehicleLength=0, numberOfAxle=0, error = 3;
            float speed = 0;
            Integer[] axleLength = null;
            boolean detected;
            Timestamp timestamp=null;
            
            dataConnectionObject dco = new dataConnectionObject();
            conn = dco.getConnection();
            
            String wantedPortName = "COM2";
            
            //responseEcho.add(line);
            while(true) {
                axleLength = new Integer[4];
                line = in.readLine();
                if(line==null) {
                    break;
                }

                r = Pattern.compile("^#[0-9]+:");
                m =r.matcher(line);
                if(!m.find()) {
                    System.out.println("Garbage collected successfully");
                    continue;
                } 
                
                r = Pattern.compile("(SnMis)(\\s+)(#[0-9]+)");
                m = r.matcher(line);
                if(m.find()) {
                    // Resetting values.
                    for(int i=0;i<axleLength.length;i++){
                        axleLength[i]=0;
                    }
                    speed = 0;
                    numberOfAxle = 0;
                    vehicleLength = 0;
                    classAxle = 0;
                    classSpeed = 0;
                    classLength = 0;
                   
                    // Invalid data
                    r = Pattern.compile("[0-9]+");
                    m = r.matcher(m.group(0));
                    if(m.find()) {
                        error = Integer.parseInt(m.group(0));
                        
                    }
                    
                    // Retrive timestamp
                    r = Pattern.compile("([0-9][0-9]/[0-9][0-9]/[0-9][0-9])(\\s)+([0-9][0-9]:[0-9][0-9]:[0-9][0-9].[0-9][0-9])");
                    m = r.matcher(line);
                    if(m.find()) {
                        ts = m.group(0);
                        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yy HH:mm:ss.SS");
                        Date parsedDate = dateFormat.parse(ts);
                        //System.out.println("--"+parsedDate);
                        timestamp = new java.sql.Timestamp(parsedDate.getTime());
                    }
                    
                    detected = false;
                    
                    r = Pattern.compile("(^|)([0-9]+)($|)");
                    m = r.matcher(line);
                    if(m.find()) {
                        lane = Integer.parseInt(m.group(0));
                    }
                    System.out.println("Invalid entry Error Code : "+error+" in Lane: "+lane);
                    
                } else {
                    
                    detected = true;
                    error = 3;
                    // Valid Data
                    
                    // Retrive lane
                    r = Pattern.compile("(^|)([0-9]+)($|)");
                    m = r.matcher(line);
                    if(m.find()) {
                        lane = Integer.parseInt(m.group(0));
                    }
                    
                    // Retrive timestamp
                    r = Pattern.compile("([0-9][0-9]/[0-9][0-9]/[0-9][0-9])(\\s)+([0-9][0-9]:[0-9][0-9]:[0-9][0-9].[0-9][0-9])");
                    m = r.matcher(line);
                    if(m.find()) {
                        ts = m.group(0);
                        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yy HH:mm:ss.SS");
                        Date parsedDate = dateFormat.parse(ts);
                        //System.out.println("--"+parsedDate);
                        timestamp = new java.sql.Timestamp(parsedDate.getTime());
                    }
                    
                    // Retriving speed
                    r = Pattern.compile("(|)([0-9]+.[0-9]+)(kph)($|)");
                    m = r.matcher(line);
                    if(m.find()) {
                        r = Pattern.compile("((|)[0-9]+.[0-9]+)($|)");
                        m = r.matcher(m.group(0));
                        if(m.find()) {
                            speed = Float.parseFloat(m.group(0));
                        }
                    }
                    
                    // Retriving Axles
                    r = Pattern.compile("(|)([0-9]+)(\\s+Axles)($|)");
                    m = r.matcher(line);
                    if(m.find()) {
                        r = Pattern.compile("((|)[0-9]+)($|)");
                        m = r.matcher(m.group(0));
                        if(m.find()) {
                            numberOfAxle = Integer.parseInt(m.group(0));
                        }
                    }
                    
                    // Retriving vehicleLength

                    r = Pattern.compile("(Length)(\\s*)(=)(\\s*)([0-9]+)(\\s*cm)($|)");
                    m = r.matcher(line);
                    if(m.find()) {
                        r = Pattern.compile("((|)[0-9]+)($|)");
                        m = r.matcher(m.group(0));
                        if(m.find()) {
                            vehicleLength = Integer.parseInt(m.group(0));
                        }
                    }
                    
                    // Retiving classes for Axle

                    r = Pattern.compile("(A#)([0-9]+)($|)");
                    m = r.matcher(line);
                    if(m.find()) {
                        r = Pattern.compile("((|)[0-9]+)($|)");
                        m = r.matcher(m.group(0));
                        if(m.find()) {
                            classAxle = Integer.parseInt(m.group(0));
                        }
                    }
                    
                    // Retiving classes for Speed

                    r = Pattern.compile("(S#)([0-9]+)($|)");
                    m = r.matcher(line);
                    if(m.find()) {
                        r = Pattern.compile("((|)[0-9]+)($|)");
                        m = r.matcher(m.group(0));
                        if(m.find()) {
                            classSpeed = Integer.parseInt(m.group(0));
                        }
                    }
                    
                    // Retiving classes for Length
                    
                    r = Pattern.compile("(L#)([0-9]+)($|)");
                    m = r.matcher(line);
                    if(m.find()) {
                        r = Pattern.compile("((|)[0-9]+)($|)");
                        m = r.matcher(m.group(0));
                        if(m.find()) {
                            classLength = Integer.parseInt(m.group(0));
                        }
                    }
                    
                    // Retriving Axle Length based on number of axles
                    //r = Pattern.compile("(,)(\\s+)([0-9]+cm)(.*?)(<CR><LF>$)");
                    r= Pattern.compile("(L#[0-9]+,)(\\s+)([0-9]+cm)(.*?)($)");
                    m = r.matcher(line);
                    if(m.find()) {
                        System.out.println("Test extracted: "+m.group(0));
                        Vector<Integer> v = new Vector<Integer>();
                        r = Pattern.compile("[0-9]+");
                        m = r.matcher(m.group(0));
                        m.find();

                        while(m.find()) {
                            
                            v.add(Integer.parseInt(m.group()));
                        }
                        
                        switch(numberOfAxle){
                            case 2:
                                axleLength[0] = v.get(0);
                                break;
                            case 3:
                                axleLength[0] = v.get(0);
                                axleLength[1] = v.get(1);
                                break;
                            case 4:
                                axleLength[0] = v.get(0);
                                
                                axleLength[1] = v.get(1);
                                
                                axleLength[2] = v.get(2);
                                break;
                            case 5:
                                axleLength[0] = v.get(0);
                                
                                axleLength[1] = v.get(1);
                                
                                axleLength[2] = v.get(2);
                                
                                axleLength[3] = v.get(3);
                                break;
                            default:
                                axleLength[0] = v.get(0);
                                
                                axleLength[1] = v.get(1);
                                
                                axleLength[2] = v.get(2);
                                
                                axleLength[3] = v.get(3);
                                break;
                        }
                        
                        for(int i=0;i<4;i++){
                            if (axleLength[i]==null) {
                                axleLength[i]=0;
                            }
                        }
                    }
                    System.out.println("---------------------------------------");
                    System.out.println("Lane Number:\t\t\t"+lane);
                    System.out.println("Time Stamp:\t\t\t"+timestamp);
                    System.out.println("Speed:\t\t\t\t"+speed);
                    System.out.println("No. of Axle:\t\t\t"+numberOfAxle);
                    System.out.println("Vehicle Length:\t\t\t"+vehicleLength);
                    System.out.println("Class by axle:\t\t\t"+classAxle);
                    System.out.println("Class by speed:\t\t\t"+classSpeed);
                    System.out.println("Class by length:\t\t"+classLength);
                    System.out.println("Axle Length:\t\t\t"+axleLength[0]+"\t"+axleLength[1]+"\t"+axleLength[2]+"\t"+axleLength[3]);
                    System.out.println("---------------------------------------");
                    
                    
                }
                String scn = "ATCC006";
                //insertIntoDataDB(conn, scn, detected, error, wantedPortName, lane, timestamp, speed, numberOfAxle, vehicleLength, classAxle, classSpeed, classLength, axleLength);
                //updateServicesDB(conn, "ATCC Adapter");
                    

            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(test.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(test.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(test.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                f1.close();
            } catch (IOException ex) {
                Logger.getLogger(test.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    
    private static void insertIntoDataDB(Connection conn, String scn, boolean detected, int errorCode, String wantedPortName, int lane, Timestamp ts, 
            float speed, int numberOfAxle, int vehicleLength, int classAxle, int classSpeed, int classLength, Integer[] axleLength) {
        
        try {
            
            PreparedStatement pst = conn.prepareStatement("INSERT INTO `tis_detector_dynamic_vbv`"
                    + "(`SCN`, `DataAvailable`, `errorCode`, `Lane`, `TimeStamp`, `TowardsToll`,"
                    + "`Speed`, `NumberOfAxle`, `VehicleLength`, `ClassByAxle`, `ClassBySpeed`,"
                    + "`ClassByLength`, `AxleLength1`, `AxleLength2`, `AxleLength3`, `AxleLength4`) VALUES "
                    + "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, scn);
            pst.setBoolean(2, detected);
            pst.setByte(3, (byte)errorCode);
            pst.setByte(4, (byte)lane);
            pst.setTimestamp(5, ts);
            pst.setBoolean(6, towardsTollCheck(conn, scn, lane));
            pst.setFloat(7, speed);
            pst.setByte(8, (byte)numberOfAxle);
            pst.setShort(9, (short)vehicleLength);
            pst.setByte(10, (byte)classAxle);
            pst.setByte(11, (byte)classSpeed);
            pst.setByte(12, (byte)classLength);
            pst.setShort(13, (short)axleLength[0].intValue());
            pst.setShort(14, (short)axleLength[1].intValue());
            pst.setShort(15, (short)axleLength[2].intValue());
            pst.setShort(16, (short)axleLength[3].intValue());
            
            pst.executeUpdate();
            
            
        } catch (SQLException ex) {
            //Logger.getLogger(ATCCAdapter.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        }
    }
    
    private static boolean towardsTollCheck(Connection conn, String scn, int lane){
        try {
            boolean towardsToll = false;
            
            PreparedStatement pst = conn.prepareStatement("SELECT `TowardsToll` FROM `utmc_detector_config` WHERE `SystemCodeNumber`=? AND `LaneNumber`=?");
            pst.setString(1, scn);
            pst.setInt(2, lane);
            
            ResultSet rs = pst.executeQuery();
            
            if(rs.next()){
                towardsToll = rs.getBoolean("TowardsToll");
            }
            
            return towardsToll;
        } catch (SQLException ex) {
            //Logger.getLogger(ATCCAdapter.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Config Entry not available for SCN "+ scn + " and Lane: "+lane);
            System.out.println(ex);
            return false;
        }
    }
    
}
