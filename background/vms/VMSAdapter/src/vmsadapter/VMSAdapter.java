/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vmsadapter;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import javax.imageio.ImageIO;

/**
 *
 * @author Parag Raipuria
 */
public class VMSAdapter {

    /**
     * @param args the command line arguments
     * @throws java.io.IOException
     * @throws java.sql.SQLException
     */
    
    //public final static String folder = "F:/Parag/VMS/";
    //public final static String imageFolder = "F:/Parag/VMS/images/";
    public final static String folder = "F:/HTMS_VMS/";
    public final static String imageFolder = "F:/HTMS_VMS/images/";
            
    public static void main(String[] args) throws IOException, SQLException, InterruptedException {
        
        if(checkLicence(args[0])){
            dataConnectionObject dco = new dataConnectionObject();
        
            Connection conn = dco.getConnection();
            PreparedStatement pst = null;
            ResultSet rs = null;
            PreparedStatement pst1 = null;
            ResultSet rs1 = null;
            PreparedStatement pst2 = null;
            ResultSet rs2 = null;
            PreparedStatement pst3 = null;
            ResultSet rs3 = null;
            PreparedStatement pst4 = null;

            try{

                pst = conn.prepareStatement("SELECT `SystemCodeNumber`,`IPAddress` FROM `utmc_vms_static`");
                rs = pst.executeQuery();

                while(rs.next()){

                    String[][] slideArrayNew = new String[2][15];
                    String[][] slideArrayExisting = new String[2][15];

                    CompleteMessage msgNew = new CompleteMessage();
                    CompleteMessage msgExisting = new CompleteMessage();

                    String scn = rs.getString("SystemCodeNumber");
                    String ip = rs.getString("IPAddress");

                    pst1 = conn.prepareStatement("SELECT `MessageID`,`slide`,`time` FROM `utmc_vms_message_list_support_static` WHERE `SystemCodeNumber`=?");
                    pst1.setString(1, scn);
                    rs1 = pst1.executeQuery();

                    while(rs1.next()){
                        if(rs1.getString("slide")!=null){
                            slideArrayNew[0][Integer.parseInt(rs1.getString("slide"))] = rs1.getString("MessageID");
                            slideArrayNew[1][Integer.parseInt(rs1.getString("slide"))] = rs1.getString("time");
                        }
                    }

                    pst2 = conn.prepareStatement("SELECT `MsgId`,`slide`,`time` FROM `utmc_vms_dynamic` WHERE `SystemCodeNumber`=?");
                    pst2.setString(1, scn);
                    rs2 = pst2.executeQuery();

                    while(rs2.next()){
                        if(rs2.getString("slide")!=null){
                            slideArrayExisting[0][Integer.parseInt(rs2.getString("slide"))] = rs2.getString("MsgId");
                            slideArrayExisting[1][Integer.parseInt(rs2.getString("slide"))] = rs2.getString("time");
                        }
                    }

                    for (int i=1;i<15;i++){

                        if(slideArrayNew[0][i] != null){

                            if(slideArrayExisting[0][i] != null){

                                if(!slideArrayNew[0][i].equalsIgnoreCase(slideArrayExisting[0][i])){

                                    msgNew.setMessageID(slideArrayNew[0][i]);
                                    msgNew.setSlide(String.valueOf(i));
                                    msgNew.setTime(slideArrayNew[1][i]);

                                    System.out.println("1");
                                    System.out.println("SCN is:"+scn);
                                    System.out.println("New Message:"+msgNew.getMessageID());
                                    System.out.println("New Slide:"+msgNew.getSlide());
                                    System.out.println("Existing Message:"+slideArrayExisting[0][i]);
                                    System.out.println("Existing Slide:"+i);

                                    getMsgFromMsgID(conn,pst3,rs3,msgNew);
                                    convertTextToBmp(scn,msgNew);
                                    executeVMSCmd(scn, msgNew);
                                    if(sendFileThroughEthernet(ip,scn,msgNew)){
                                        updateDatabase(conn,pst4,scn,msgNew);
                                    };
                                }

                            } else{

                                msgNew.setMessageID(slideArrayNew[0][i]);
                                msgNew.setSlide(String.valueOf(i));
                                msgNew.setTime(slideArrayNew[1][i]);

                                System.out.println("2");
                                System.out.println("SCN is:"+scn);
                                System.out.println("New Message:"+msgNew.getMessageID());
                                System.out.println("New Slide:"+msgNew.getSlide());
                                System.out.println("Existing Message:"+slideArrayExisting[0][i]);
                                System.out.println("Existing Slide:"+i);

                                getMsgFromMsgID(conn,pst3,rs3,msgNew);
                                convertTextToBmp(scn,msgNew);
                                executeVMSCmd(scn, msgNew);
                                if(sendFileThroughEthernet(ip,scn,msgNew)){
                                    updateDatabase(conn,pst4,scn,msgNew);
                                };
                            }

                        } else{
                            if(slideArrayExisting[0][i] != null){

                                msgExisting.setMessageID(slideArrayExisting[0][i]);
                                msgExisting.setSlide(String.valueOf(i));
                                msgExisting.setTime(slideArrayExisting[1][i]);

                                System.out.println("3");
                                System.out.println("SCN is:"+scn);
                                System.out.println("New Message:"+msgNew.getMessageID());
                                System.out.println("New Slide:"+msgNew.getSlide());
                                System.out.println("Existing Message:"+slideArrayExisting[0][i]);
                                System.out.println("Existing Slide:"+i);

                                if(removeMessageInVMS(scn,ip,msgExisting)){
                                    deleteFromDatabase(conn, pst4, scn, msgExisting);
                                }
                            }    
                        }   
                    }
                }

                updateServicesDB(conn,"VMS Adapter");

            }catch (SQLException ex){
                System.out.println(ex);
            }

            finally{
                if(conn!=null)conn.close();
                if(pst!=null)pst.close();
                if(rs!=null)rs.close();
                if(pst1!=null)pst1.close();
                if(rs1!=null)rs1.close();
                if(pst2!=null)pst2.close();
                if(rs2!=null)rs2.close();
                if(pst3!=null)pst3.close();
                if(rs3!=null)rs3.close();
                if(pst4!=null)pst4.close();
            }
        } else {
            System.out.println("Licence Key error. Please contact Tech Support.");
        }
        
        
    }
    
    public static boolean checkLicence(String licenceKeyPath){
        
        String command = licenceKeyPath+"/checkLicence.exe VMS "+licenceKeyPath+"/licenceKey.txt";
        Process p;
        
	try {
            p = Runtime.getRuntime().exec(command);
            p.waitFor();
            BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));

            String line = "";			
            if ((line = reader.readLine())!= null) {
                if("jkcvndjsfoiasjdj".equalsIgnoreCase(line)) return true;
            }
            reader.close();
            return false;

	} catch (Exception e) {
            e.printStackTrace();
            return false;
	}
    }
    
    private static void getMsgFromMsgID(Connection conn, PreparedStatement pst, ResultSet rs, CompleteMessage msgNew) throws SQLException {
        
        pst = conn.prepareStatement("SELECT `topLineText`,`midLineText`,`botLineText`,`fontSize` FROM `utmc_vms_messages_support_static` WHERE `MessageID`=? AND active=1");
        pst.setString(1, msgNew.getMessageID());
            
        rs = pst.executeQuery();
            
        if(rs.next()){
            if(rs.getString("topLineText") != null){
                msgNew.setTopLine(rs.getString("topLineText"));
            } else{
                msgNew.setTopLine(".");
            }
            if(rs.getString("midLineText") != null){
                msgNew.setMidLine(rs.getString("midLineText"));
            } else{
                msgNew.setMidLine(".");
            }
            if(rs.getString("botLineText") != null){
                msgNew.setBotLine(rs.getString("botLineText"));
            } else{
                msgNew.setBotLine(".");
            }
            msgNew.setFontSize(rs.getInt("fontSize"));
        }
        
    }
    
    private static void convertTextToBmp(String scn, CompleteMessage msgNew) throws IOException {
        
        BufferedImage image = new BufferedImage(240,72, BufferedImage.TYPE_BYTE_BINARY);
        Font font = new Font(Font.SANS_SERIF, Font.CENTER_BASELINE, msgNew.getFontSize());
        Graphics2D g2d = image.createGraphics();
        g2d.setColor(Color.white);
        g2d.fillRect(0, 0, 240, 72);
        g2d.setColor(Color.black);
        g2d.setFont(font);
        g2d.drawString(msgNew.getTopLine(),getXCordinate(msgNew.getTopLine(),msgNew.getFontSize()),getYCordinate(msgNew.getFontSize()));
        g2d.drawString(msgNew.getMidLine(),getXCordinate(msgNew.getMidLine(),msgNew.getFontSize()),getYCordinate(msgNew.getFontSize())+24);
        g2d.drawString(msgNew.getBotLine(),getXCordinate(msgNew.getBotLine(),msgNew.getFontSize()),getYCordinate(msgNew.getFontSize())+48);
        g2d.dispose();
        System.out.println("Creating bmp file:"+imageFolder+scn+"_"+msgNew.getSlide()+".bmp");
        ImageIO.write(image,"BMP",new File(imageFolder+scn+"_"+msgNew.getSlide()+".bmp"));
        
    }
    
    private static int getXCordinate(String msgNew, Integer fontSize){
        System.out.println(msgNew);
        Double xCordinate = (120-msgNew.length()*fontSize*(0.6))/2;
        return xCordinate.intValue();
    }
    
    private static int getYCordinate(Integer fontSize){
        Double yCordinate = ((24-fontSize*(0.75))/2)+(fontSize*(0.75));
        return yCordinate.intValue();
    }
    
    private static void executeVMSCmd(String scn, CompleteMessage message) throws IOException {
        Process process = new ProcessBuilder(folder+"VMSCmd.exe",imageFolder+scn+"_"+message.getSlide()+".bmp",message.getSlide(),message.getTime()).start();
        InputStream is = process.getInputStream();
        InputStreamReader isr = new InputStreamReader(is);
        BufferedReader br = new BufferedReader(isr);
        String line;

        while ((line = br.readLine()) != null) {
          System.out.println(line);
        }
    }

    private static boolean sendFileThroughEthernet(String ip,String scn,CompleteMessage message) throws IOException, InterruptedException {
        
        System.out.println("Trying to connect to VMS Socket with IP:"+ip);
        
        if(runPingCommand(ip)){
            
            Socket socket = new Socket(ip,8001);
        
            if(!socket.isConnected())System.out.println("Socket Connection Not established");
            else System.out.println("Socket Connection established : "+socket.getInetAddress());

            File myfile = new File(imageFolder+scn+"_"+message.getSlide()+".dat");       //local file path.
            
            if(!myfile.exists()) System.out.println("File Not Existing.");
            else System.out.println("File Existing.");
            
            byte[] byteArray = new byte[1024];

            FileInputStream fis = new FileInputStream(myfile);
            BufferedInputStream bis = new BufferedInputStream(fis);
            OutputStream os = socket.getOutputStream();
            int trxBytes =0;
            while((trxBytes = bis.read(byteArray, 0, byteArray.length)) !=-1){           
                os.write(byteArray, 0, byteArray.length);
                System.out.println("Transfering bytes : "+trxBytes );
            }
            os.flush();
            bis.close();
            
            InputStream is = socket.getInputStream();
            InputStreamReader isr = new InputStreamReader(is);
            BufferedReader br = new BufferedReader(isr);
            String revert = br.readLine();
            System.out.println("Message received from the server : " +revert);
            
            
            BufferedOutputStream bos = new BufferedOutputStream(socket.getOutputStream());
            OutputStreamWriter osw = new OutputStreamWriter(bos, "US-ASCII");
            System.out.println("Transferring command |C|1|255| to VMS device.");
            osw.write("|C|1|255|");
            osw.flush();
            
            InputStream is2 = socket.getInputStream();
            InputStreamReader isr2 = new InputStreamReader(is2);
            BufferedReader br2 = new BufferedReader(isr2);
            String revert2 = br2.readLine();
            System.out.println("Message received from the server : " +revert2);
            
            System.out.println("File Transfered...");
            
            return true;
            
        } else{
            System.out.println("Device with ip "+ip+" if offline. Skipping it.");
            return false;
        }
        
    }
    
    private static boolean removeMessageInVMS(String scn, String ip, CompleteMessage message) throws IOException, InterruptedException {
        
        if(runPingCommand(ip)){
            
            
            Socket socket = new Socket(ip,8001);
        
            if(!socket.isConnected()) System.out.println("Socket Connection Not established");
            else System.out.println("Socket Connection established : "+socket.getInetAddress());

            BufferedOutputStream bos = new BufferedOutputStream(socket.getOutputStream());
            OutputStreamWriter osw = new OutputStreamWriter(bos, "US-ASCII");
            System.out.println("Deleting message from "+scn+" and from Message Index "+message.getSlide());
            osw.write("|C|2|"+message.getSlide()+"|");
            osw.flush();
            
            /*BufferedOutputStream bos2 = new BufferedOutputStream(socket.getOutputStream());
            OutputStreamWriter osw2 = new OutputStreamWriter(bos2, "US-ASCII");
            System.out.println("Transferring command |C|1|255| to VMS device.");
            osw2.write("|C|1|255|");
            osw2.flush();
            
            InputStream is2 = socket.getInputStream();
            InputStreamReader isr2 = new InputStreamReader(is2);
            BufferedReader br2 = new BufferedReader(isr2);
            String revert2 = br2.readLine();
            System.out.println("Message received from the server : " +revert2);*/
            
            socket.close();
            
            return true;
            
        } else{
            System.out.println("Device with ip "+ip+" if offline. Skipping it.");
            return false;
        }
        
    }
    
    public static boolean runPingCommand(String ip) throws IOException {
        
        String command = "ping -n 1 ";
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

    private static void updateDatabase(Connection conn, PreparedStatement pst, String scn, CompleteMessage msgNew) throws SQLException {
        
        String msg = msgNew.getTopLine().concat(" ".concat(msgNew.getMidLine().concat(" ".concat(msgNew.getBotLine()))));
        
        pst = conn.prepareStatement("INSERT INTO `utmc_vms_dynamic`(`SystemCodeNumber`,`MsgId`,`MsgTxt`,`LastUpdated`,`slide`, `time`) VALUES (?,?,?,now(),?,?)");
        pst.setString(1, scn);
        pst.setString(2, msgNew.getMessageID());
        pst.setString(3, msg);
        pst.setString(4, msgNew.getSlide());
        pst.setString(5, msgNew.getTime());
            
        pst.executeUpdate();
        
    }
            
    private static void deleteFromDatabase(Connection conn, PreparedStatement pst, String scn, CompleteMessage msgNew) throws SQLException {
        
        pst = conn.prepareStatement("DELETE FROM `utmc_vms_dynamic` WHERE `SystemCodeNumber`=? AND `slide`=?");
        pst.setString(1, scn);
        pst.setString(2, msgNew.getSlide());
            
        pst.executeUpdate();
        
    }
    
    public static class CompleteMessage{
        private String topLine = null;
        private String midLine = null;
        private String botLine = null;
        private int fontSize;
        private String messageID = null;
        private String slide = null;
        private String time = null;

        public String getMessageID() {
            return messageID;
        }

        public void setMessageID(String messageID) {
            this.messageID = messageID;
        }

        public String getSlide() {
            return slide;
        }

        public void setSlide(String slide) {
            this.slide = slide;
        }

        public String getTime() {
            return time;
        }

        public void setTime(String time) {
            this.time = time;
        }
        
        public int getFontSize() {
            return fontSize;
        }

        public void setFontSize(int fontSize) {
            this.fontSize = fontSize;
        }

        public String getTopLine() {
            return topLine;
        }

        public void setTopLine(String topLine) {
            this.topLine = topLine;
        }

        public String getMidLine() {
            return midLine;
        }

        public void setMidLine(String midLine) {
            this.midLine = midLine;
        }

        public String getBotLine() {
            return botLine;
        }

        public void setBotLine(String botLine) {
            this.botLine = botLine;
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