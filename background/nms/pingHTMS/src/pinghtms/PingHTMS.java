package pinghtms;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Parag Raipuria
 */
public class PingHTMS {
    
    private static Integer timeDifference = null;

    public static void main(String[] args) throws IOException, SQLException {
        
        if(checkLicence(args[0])){
            
            dataConnectionObject dco = new dataConnectionObject();

            Connection conn = dco.getConnection();

            getIPAddress("vms",conn);
            getIPAddress("meteorological",conn);
            getIPAddress("detector",conn);
            getIPAddress("cctv",conn);
            //getIPAddress("ecb");

            pingOtherIPs(conn);

            updateServicesDB(conn, "NMS");

            if(conn!=null)conn.close();
            
        } else {
            System.out.println("Licence Key error. Please contact Tech Support.");
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
                //System.out.println(line);
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
                Logger.getLogger(PingHTMS.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public static void getIPAddress(String module,Connection conn) throws IOException, SQLException{
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try{
            
            pst = conn.prepareStatement("Select SystemCodeNumber, IPAddress from utmc_"+module+"_static");
            
            rs = pst.executeQuery();
            
            String ip = null;
            String scn = null;
            
            while(rs.next()){
                
                ip = rs.getString("IPAddress");
                scn= rs.getString("SystemCodeNumber");
                
                if(!ip.isEmpty()){
                    
                    boolean pingResponse = runSystemCommand(ip);
                    
                    PreparedStatement pst1 = conn.prepareStatement("INSERT INTO `tis_"+module+"_fault`(`SystemCodeNumber`, `LastUpdated`, `online`,`time`) VALUES (?,now(),?,?)");
                    pst1.setString(1, scn);
                    
                    if(!pingResponse){
                        //pst1.setString(2, off);
                        pst1.setBoolean(2, false);
                        if(lastStatusOnline(module,scn,conn)){
                            pst1.setInt(3, timeDifference);
                            pst1.executeUpdate();
                            sendemail(scn,module,conn);
                        }
                        
                    } else {
                        //pst1.setString(2, on);
                        pst1.setBoolean(2, true);
                        if(lastStatusOffline(module, scn, conn)){
                            pst1.setInt(3, timeDifference);
                            pst1.executeUpdate();
                            sendOnlineEmail(scn, module, conn);
                        }
                    }
                }            
            }
            
        }catch (SQLException ex){
            
            Logger.getLogger(PingHTMS.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
        
        
    }

    public static boolean runSystemCommand(String ip) throws IOException {
        
        String command = "ping -c 1 ";
        //String command = c;
        command = command.concat(ip);

        
        StringBuffer output = new StringBuffer();

	Process p;
        
	try {
            p = Runtime.getRuntime().exec(command);
            p.waitFor();
            BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));

            String line = "";			
            while ((line = reader.readLine())!= null) {
                output.append(line + "\n");
            }

	} catch (Exception e) {
            e.printStackTrace();
	}

        
	if (output.toString().toLowerCase().contains("unreachable") || output.toString().toLowerCase().contains("timed out")|| output.toString().toLowerCase().contains("unknown")){
            return false;
        }
        
        return true;

    }

    private static void pingOtherIPs(Connection conn) throws IOException, SQLException {
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try{
            
            pst = conn.prepareStatement("Select IPAddress from nms_ip_address");
            
            rs = pst.executeQuery();
            
            String ip = null;
            //String off = "Device offline";
            //String on = "Device online";
            
            while(rs.next()){
                
                ip = rs.getString("IPAddress");
                
                if(!ip.isEmpty()){
                    boolean pingResponse = runSystemCommand(ip);
                    
                    PreparedStatement pst1 = conn.prepareStatement("INSERT INTO `nms_ip_fault`(`IPAddress`, `online`, `LastUpdated`,`time`) VALUES (?,?,now(),?)");
                    pst1.setString(1, ip);
                    
                    if(!pingResponse){
                        //pst1.setString(2, off);
                        pst1.setBoolean(2, false);
                        if(lastStatusOnlineOther(ip, conn)){
                            pst1.setInt(3, timeDifference);
                            pst1.executeUpdate();
                        }
                        
                    } else {
                        //pst1.setString(2, on);
                        pst1.setBoolean(2, true);
                        if(lastStatusOfflineOther(ip, conn)){
                            pst1.setInt(3, timeDifference);
                            pst1.executeUpdate();
                        }
                        
                    }
                }            
            }
            
        }catch (SQLException ex){
            
            Logger.getLogger(PingHTMS.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
        
        
        
    }

    private static void sendemail(String scn, String module,Connection conn) throws SQLException {
        
        if (module.equalsIgnoreCase("detector"))module = "ATCC";
        else if(module.equalsIgnoreCase("meteorological"))module = "MET";
        
        PreparedStatement pst = conn.prepareStatement("SELECT MAX(ID) from `tis_maintenance_sr`");
        ResultSet rs = pst.executeQuery();
        
        int maxID = 0;
        
        while(rs.next()){

            maxID = rs.getInt("MAX(ID)");
            
            int srID = maxID +1;
            String appendString = null;
            
            if(srID > 0){
                appendString = "0000000";
                if(srID>9){
                    appendString = "000000";
                    if(srID>99){
                        appendString = "00000";
                        if(srID>999){
                            appendString = "0000";
                            if(srID>9999){
                                appendString = "000";
                                if(srID>99999){
                                    appendString = "00";
                                    if(srID>999999){
                                        appendString="0";
                                        if(srID>9999999){
                                            appendString="";
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            String sr = "SR"+appendString+String.valueOf(srID);
            
            PreparedStatement pst2 = conn.prepareStatement("INSERT INTO `tis_maintenance_sr`"
                    + "(`sr_number`, `module`, `device`, `subject`, `details`, `user_created`, `created_date`, `status`) "
                    + "VALUES (?,?,?,?,?,?,now(),?)");
            pst2.setString(1,sr);
            pst2.setString(2, module.toUpperCase());
            pst2.setString(3, scn);
            pst2.setString(4, "Device offline");
            pst2.setString(5, "Device is offline.");
            pst2.setString(6, "System");
            pst2.setString(7, "Open");
            
            pst2.executeUpdate();
            
            String timeStamp = new SimpleDateFormat("dd.MM.yyyy HH.mm.ss").format(new Date());
            
            String emailSubject = sr+": New Service Request has been created in HTMS for the device "+scn;
            String emailBody = "Hi,<br><br>New Service Request has been created with below details:"
                    + "<br><br><table border='1'><tr><td>SR Number</td><td>"+sr+"</td></tr><tr><td>Module</td><td>"+module+"</td></tr>"
                    + "<tr><td>Device</td><td>"+scn+"</td></tr><tr><td>Created by</td><td>System</td></tr>"
                    + "<tr><td>Subject</td><td>Device Offline</td></tr><tr><td>Details</td><td>Device is offline.</td></tr>"
                    + "<tr><td>Time Stamp</td><td>"+timeStamp+"</td></tr></table><br><br>";
            
            PreparedStatement pst3 = conn.prepareStatement("SELECT COUNT(A.email) from user_login A, roles B, mapping_user C "
                    + "where A.id=C.user_id and C.role_id=B.id and B.modules=?");
            pst3.setString(1, module);
            ResultSet rs1 = pst3.executeQuery();
            
            int count = 0;
            if(rs1.next()){
                count = rs1.getInt("COUNT(A.email)");
            }
            
            PreparedStatement pst4 = conn.prepareStatement("select A.email from user_login A, roles B, mapping_user C "
                    + "where A.id=C.user_id and C.role_id=B.id and B.modules=?");
            pst4.setString(1, module);
            ResultSet rs2 = pst4.executeQuery();
            
            String[] emailAddresses = new String[count];
            int count1 = 0;
            
            while(rs2.next()){
                emailAddresses[count1]=(rs2.getString("email"));
                count1++;
            }
            
            generateEmail(emailAddresses,emailSubject,emailBody);
            
        }
        
    }

    private static void generateEmail(String[] emailAddresses, String emailSubject, String emailBody) {
        
        /*String email = Arrays.toString(emailAddresses);
        System.out.println(email);
        email = email.substring(1,email.length()-1);
        System.out.println(email);*/
        
        if(emailAddresses.length>0){
            String host="smtp.gmail.com";
            final String user="htms.root@gmail.com";//change accordingly
            final String password="htmsroot";//change accordingly

            //String to=emailId;//change accordingly
            //Get the session object
            Properties props = new Properties();
            props.put("mail.smtp.host",host);
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class",
            "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");

            Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user,password);
                }
            });

            //Compose the message
            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(user));
                
                for (int i=0;i<emailAddresses.length;i++){
                    message.addRecipient(Message.RecipientType.TO,new InternetAddress(emailAddresses[i]));
                }
                //message.addRecipient(Message.RecipientType.TO,new InternetAddress(email));
                message.setSubject(emailSubject);
                message.setContent(emailBody,"text/html");

                //send the message

                Transport.send(message);

                System.out.println("message sent successfully...");

            } catch (MessagingException e) {
                e.printStackTrace();
            }
        }
       
    }

    private static boolean lastStatusOnline(String module, String scn, Connection conn) throws SQLException {
        
        PreparedStatement pst = conn.prepareStatement("SELECT `online`,`LastUpdated` FROM `tis_"+module+"_fault` WHERE `SystemCodeNumber`=? order by `LastUpdated` desc limit 1");
        pst.setString(1,scn);
        
        ResultSet rs = pst.executeQuery();
        
        boolean lastStatus = false;
        Timestamp ts = null;
        
        if(rs.next()){
            lastStatus = rs.getBoolean("online");
            ts = rs.getTimestamp("LastUpdated");
        }
        
        long currTime = System.currentTimeMillis();
        long previousTime = ts.getTime();
        
        timeDifference = Math.toIntExact((currTime-previousTime)/60000);
        
        if(lastStatus)return true;
        else return false;
        
    }
    
    private static boolean lastStatusOffline(String module, String scn, Connection conn) throws SQLException {
        
        PreparedStatement pst = conn.prepareStatement("SELECT `online`,`LastUpdated` FROM `tis_"+module+"_fault` WHERE `SystemCodeNumber`=? order by `LastUpdated` desc limit 1");
        pst.setString(1,scn);
        
        ResultSet rs = pst.executeQuery();
        
        boolean lastStatus = false;
        Timestamp ts = null;
        
        if(rs.next()){
            lastStatus = rs.getBoolean("online");
            ts = rs.getTimestamp("LastUpdated");
        }
        
        long currTime = System.currentTimeMillis();
        long previousTime = ts.getTime();
        
        timeDifference = Math.toIntExact((currTime-previousTime)/60000);
        
        if(!lastStatus)return true;
        else return false;
        
    }
    
    private static void sendOnlineEmail(String scn, String module,Connection conn) throws SQLException {
        
        if (module.equalsIgnoreCase("detector"))module = "ATCC";
        else if(module.equalsIgnoreCase("meteorological"))module = "MET";
        
        String timeStamp = new SimpleDateFormat("dd.MM.yyyy HH.mm.ss").format(new Date());
        
        String emailSubject = scn+": Device is now online.";
        String emailBody = "Hi,<br><br>Device with below details is now again online."
                + "<br><br><table border='1'><tr><td>Module</td><td>"+module+"</td></tr>"
                + "<tr><td>Device</td><td>"+scn+"</td></tr>"
                + "<tr><td>Time Stamp</td><td>"+timeStamp+"</td></tr></table><br><br>";

        PreparedStatement pst3 = conn.prepareStatement("SELECT COUNT(A.email) from user_login A, roles B, mapping_user C "
                + "where A.id=C.user_id and C.role_id=B.id and B.modules=?");
        pst3.setString(1, module);
        ResultSet rs1 = pst3.executeQuery();

        int count = 0;
        if(rs1.next()){
            count = rs1.getInt("COUNT(A.email)");
        }

        PreparedStatement pst4 = conn.prepareStatement("select A.email from user_login A, roles B, mapping_user C "
                + "where A.id=C.user_id and C.role_id=B.id and B.modules=?");
        pst4.setString(1, module);
        ResultSet rs2 = pst4.executeQuery();

        String[] emailAddresses = new String[count];
        int count1 = 0;

        while(rs2.next()){
            emailAddresses[count1]=(rs2.getString("email"));
            count1++;
        }

        generateEmail(emailAddresses,emailSubject,emailBody);
        
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

    private static boolean lastStatusOnlineOther(String ip, Connection conn) throws SQLException {
        
        PreparedStatement pst = conn.prepareStatement("SELECT `online`,`LastUpdated` FROM `nms_ip_fault` WHERE `IPAddress`=? order by `LastUpdated` desc limit 1");
        pst.setString(1,ip);
        
        ResultSet rs = pst.executeQuery();
        
        boolean lastStatus = false;
        Timestamp ts = null;
        
        if(rs.next()){
            lastStatus = rs.getBoolean("online");
            ts = rs.getTimestamp("LastUpdated");
        }
        
        long currTime = System.currentTimeMillis();
        long previousTime = ts.getTime();
        
        timeDifference = Math.toIntExact((currTime-previousTime)/60000);
        
        if(lastStatus)return true;
        else return false;
        
    }

    private static boolean lastStatusOfflineOther(String ip, Connection conn) throws SQLException {
        
        PreparedStatement pst = conn.prepareStatement("SELECT `online`,`LastUpdated` FROM `nms_ip_fault` WHERE `IPAddress`=? order by `LastUpdated` desc limit 1");
        pst.setString(1,ip);
        
        ResultSet rs = pst.executeQuery();
        
        boolean lastStatus = false;
        Timestamp ts = null;
        
        if(rs.next()){
            lastStatus = rs.getBoolean("online");
            ts = rs.getTimestamp("LastUpdated");
        }
        
        long currTime = System.currentTimeMillis();
        long previousTime = ts.getTime();
        
        timeDifference = Math.toIntExact((currTime-previousTime)/60000);
        
        if(!lastStatus)return true;
        else return false;
        
    }
    
}
