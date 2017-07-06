/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ruleengine;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mustafa
 */
public class RuleEngine {

    public static void logMessage(String scn, String action, String device, String message) throws SQLException, IOException{
        
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        PreparedStatement pst1 = null;
        ResultSet rs1 = null;
        dataConnectionObject dco = new dataConnectionObject();
        
        conn = dco.getConnection();
        
        try{
            
            pst1 = conn.prepareStatement("SELECT * FROM `utmc_freeflow_alert_dynamic` WHERE "
                    + "`SystemCodeNumber`=? AND `ActionStatus`=? AND `Device`=? AND `Description`=?");
            
            pst1.setString(1, scn);
            pst1.setString(2, action);
            pst1.setString(3, device);
            pst1.setString(4, message);
            
            rs1 = pst1.executeQuery();
            
            if(!rs1.next()){
                
                pst = conn.prepareStatement("INSERT INTO utmc_freeflow_alert_dynamic "
                    + "(SystemCodeNumber,ActionStatus,Device,Description,LastUpdated) VALUES(?,?,?,?,now())");
                pst.setString(1, scn);
                pst.setString(2, action);
                pst.setString(3, device);
                pst.setString(4, message);

                pst.executeUpdate();
                
            }
            
            
        } catch(SQLException sqe){
            System.out.println("Error while inserting LogMessage query in utmc_freeflow_alert_dynamic: "+sqe);
        }
        
        finally{
            if(conn!=null)conn.close();
            if(pst!=null)pst.close();
            if(rs!=null)rs.close();
        }
        
    }

    private static void sendToVMS(String device, String slide, String command) throws IOException, SQLException {
        
        Connection conn = null;
        PreparedStatement pst = null;
        PreparedStatement pst1 = null;
        PreparedStatement pst2 = null;
        ResultSet rs = null;
        ResultSet rs2 = null;
        dataConnectionObject dco = new dataConnectionObject();
        
        conn = dco.getConnection();
        
        try{
            pst = conn.prepareStatement("SELECT MessageID from `utmc_vms_messages_support_static` WHERE MessageText=? AND active=1");
            pst.setString(1, command);
            
            rs = pst.executeQuery();
            
            while(rs.next()){
                String msgID = rs.getString("MessageID");
                
                pst2 = conn.prepareStatement("SELECT * FROM `utmc_vms_message_list_support_static` WHERE "
                        + "`SystemCodeNumber`=? AND `slide`=?");
                pst2.setString(1, device);
                //pst2.setString(2, msgID);
                pst2.setString(2, slide);
                
                rs2 = pst2.executeQuery();
                
                if(rs2.next()){
                    
                    pst1 = conn.prepareStatement("UPDATE `utmc_vms_message_list_support_static` SET "
                            + "`MessageID`=?, `UpdationTime`= now() WHERE `SystemCodeNumber`=? AND `slide`=? and active=1");
                    pst1.setString(1, msgID);
                    pst1.setString(2, device);
                    pst1.setString(3, slide);
                    
                    pst1.executeUpdate();
                    
                } else{
                    //pst1 = conn.prepareStatement("INSERT INTO `utmc_vms_message_list_support_static`(`SystemCodeNumber`, `MessageID`, "
                        //+ "`slide`, `time`) VALUES (?,?,?,?)");
                    pst1 = conn.prepareStatement("INSERT INTO `utmc_vms_message_list_support_static`(`active`, `SystemCodeNumber`, "
                            + "`MessageID`, `slide`, `time`, `creationUser`, `CreationTime`, `UpdationTime`) VALUES"
                            + "(1,?,?,?,?,'Rule Engine',now(),now())");
                
                    pst1.setString(1, device);
                    pst1.setString(2, msgID);
                    pst1.setString(3, slide);
                    pst1.setInt(4, 20);

                    pst1.executeUpdate();
                }
            }
            
        } catch(SQLException sqe){
            System.out.println("Error while inserting LogMessage query in utmc_vms_message_list_support_static: "+sqe);
        }
        
        finally{
            if(conn!=null)conn.close();
            if(pst!=null)pst.close();
            if(rs!=null)rs.close();
        }
    }
    
    public static class LiveValues{
        private Timestamp lastupdated = null;
        private Double varName = null;

        public Timestamp getLastupdated() {
            return lastupdated;
        }

        public void setLastupdated(Timestamp lastupdated) {
            this.lastupdated = lastupdated;
        }

        public Double getVarName() {
            return varName;
        }

        public void setVarName(Double varName) {
            this.varName = varName;
        } 
    }
    
    public static LiveValues getLiveValue(String module, String scn, String varName) throws SQLException, IOException{
        
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        dataConnectionObject dco = new dataConnectionObject();
        LiveValues lValue = new LiveValues();
        
        conn = dco.getConnection();
        
        try{
            pst = conn.prepareStatement("SELECT MAX(LastUpdated) FROM utmc_"+module+"_dynamic WHERE SystemCodeNumber = ?");
            pst.setString(1, scn);
            
            rs = pst.executeQuery();
            
            while(rs.next()){
                Timestamp ts = rs.getTimestamp("MAX(LastUpdated)");
                
                pst = conn.prepareStatement("SELECT "+varName+" FROM utmc_"+module+"_dynamic where SystemCodeNumber = ? and LastUpdated = ?");
                pst.setString(1, scn);
                pst.setTimestamp(2, ts);
                
                rs = pst.executeQuery();
                
                while(rs.next()){
                    
                    Double var = rs.getDouble(varName);
                    
                    lValue.setVarName(var);
                    lValue.setLastupdated(ts);
                    
                }
            }
            
        } catch(SQLException sqe){
            System.out.println("Error while getting LiveValue from the dynamic table : "+sqe);
        }
        
        finally{
            if(conn!=null)conn.close();
            if(pst!=null)pst.close();
            if(rs!=null)rs.close();
        }
        
        return lValue;
        
    }
    
    public static class ProfileValues{
        private Double lowerBound = null;
        private Double upperBound = null;

        public Double getLowerBound() {
            return lowerBound;
        }

        public void setLowerBound(Double lowerBound) {
            this.lowerBound = lowerBound;
        }

        public Double getUpperBound() {
            return upperBound;
        }

        public void setUpperBound(Double upperBound) {
            this.upperBound = upperBound;
        }

    }
    
    public static ProfileValues getProfileValue(String module, String scn, String var, 
            String prifileID, Timestamp lastUpdated) throws SQLException, IOException, ParseException{
        
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        dataConnectionObject dco = new dataConnectionObject();
        ProfileValues pv = new ProfileValues();
        
        conn = dco.getConnection();
        
        Calendar calendar = Calendar.getInstance();
	int dow = calendar.get(Calendar.DAY_OF_WEEK);
        
        /*SimpleDateFormat input = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date d = input.parse(lastUpdated.toString());*/
        
        String timeStr = lastUpdated.toString().substring(11);

        /*SimpleDateFormat output = new SimpleDateFormat("hh:mm:ss");
        String timeStr = output.format(d);*/
        
        //SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //sdfTime.setTimeZone(java.util.TimeZone.getTimeZone("IST"));
        
        //Date date = sdfTime.parse(lastUpdated.toString());
        //String timeStr = sdfTime.format(date);
        
        StringBuffer sb = new StringBuffer();
        
        sb.append("SELECT "+var+"Lb, "+var+"Ub FROM utmc_"+module+"_profile_data WHERE SystemCodeNumber = ?  AND ");
        
        switch(dow){
            case 1: sb.append("FromTimeSun < ? AND ToTimeSun > ?"); break;
            case 2: sb.append("FromTimeMon < ? AND ToTimeMon > ?"); break;
            case 3: sb.append("FromTimeTue < ? AND ToTimeTue > ?"); break;
            case 4: sb.append("FromTimeWed < ? AND ToTimeWed > ?"); break;
            case 5: sb.append("FromTimeThu < ? AND ToTimeThu > ?"); break;
            case 6: sb.append("FromTimeFri < ? AND ToTimeFri > ?"); break;
            case 7: sb.append("FromTimeSat < ? AND ToTimeSat > ?"); break;
        }
        
        try{
            pst = conn.prepareStatement(sb.toString());
            pst.setString(1, scn);
            pst.setString(2, timeStr);
            pst.setString(3, timeStr);
            
            rs = pst.executeQuery();
            
            while(rs.next()){
                    
                    Double lb = rs.getDouble(var.concat("Lb"));
                    Double ub = rs.getDouble(var.concat("Ub"));
                    
                    pv.setLowerBound(lb);
                    pv.setUpperBound(ub);
                    
                }
            
        } catch(SQLException sqe){
            System.out.println("Error while getting Profile Data: "+sqe);
        }
        
        finally{
            if(conn!=null)conn.close();
            if(pst!=null)pst.close();
            if(rs!=null)rs.close();
        }
        
        return pv;
        
    }
    
    public static class Rule{
        
        private Integer flag = null;
        private String scn = null;
        private String varName = null;

        public Integer getFlag() {
            return flag;
        }

        public void setFlag(Integer flag) {
            this.flag = flag;
        }

        public String getScn() {
            return scn;
        }

        public void setScn(String scn) {
            this.scn = scn;
        }

        public String getVarName() {
            return varName;
        }

        public void setVarName(String varName) {
            this.varName = varName;
        }
        
    }
    
    public static Rule checkRule(byte ruleID) throws SQLException, IOException, ParseException{
        
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        dataConnectionObject dco = new dataConnectionObject();
        Rule rl = new Rule();
        rl.setFlag(1);
        
        conn = dco.getConnection();
        
        try{
            String obj = null;
            String scn = null;
            String varName = null;
            String profileId = null;
            //String logic = null;
            Integer threshold = null;
            
            pst = conn.prepareStatement("select ObjectName, SystemCodeNumber, VariableName, ProfileId, Threshold from re_rules where RuleId = ?");
            pst.setByte(1, ruleID);
            
            rs = pst.executeQuery();
            
            while(rs.next()){
                
                obj = rs.getString("objectName");
                scn = rs.getString("SystemCodeNumber");
                varName = rs.getString("VariableName");
                profileId = rs.getString("ProfileId");
                //logic = rs.getString("Logic");
                threshold = rs.getInt("Threshold");
                
                if(obj.equalsIgnoreCase("MET")){
                    obj = "meteorological";
                }else if(obj.equalsIgnoreCase("ATCC")){
                    obj = "detector";
                }
                
                LiveValues lv = getLiveValue(obj, scn, varName);
                
                ProfileValues pv = getProfileValue(obj, scn, varName, profileId, lv.getLastupdated());
                
                int match = 0;
                
                if(threshold<0){
                    match = (lv.getVarName()<pv.getLowerBound())?1:0;
                }else if(threshold>0){
                    match = (lv.getVarName()>pv.getUpperBound())?1:0;
                } else if(threshold==0){
                    match = (lv.getVarName()<pv.getUpperBound() && lv.getVarName()>pv.getLowerBound())?1:0;
                }
                //Integer i = rl.getFlag();
                /*if(logic.startsWith("1")){
                    i = i*match;
                } else if(logic.startsWith("0")) {
                    i=i+match;
                }*/
                rl.setFlag(match);
            }
            
            /*if (logic.startsWith("1")){
                rl.setFlag((rl.getFlag().equals(1))?1:0);
            }else{
                rl.setFlag((rl.getFlag().compareTo(1)>0)?1:0);
            }*/
            
            rl.setScn(scn);
            rl.setVarName(varName);
            
        } catch(SQLException sqe){
            System.out.println("Error while Checking rule in re_rules table: "+sqe);
        }
        
        finally{
            if(conn!=null)conn.close();
            if(pst!=null)pst.close();
            if(rs!=null)rs.close();
        }
        return rl;
        
    }
    
    public static void doAction(byte ruleId, String scn, String varName) throws SQLException, IOException{
        
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        dataConnectionObject dco = new dataConnectionObject();
        
        conn = dco.getConnection();
        
        try{
            pst = conn.prepareStatement("select Command,Action,Device,slide from re_actions where RuleId = ?");
            pst.setByte(1, ruleId);
            
            rs = pst.executeQuery();
            
            while(rs.next()){
                String command = rs.getString("Command");
                String action = rs.getString("Action");
                String device = rs.getString("Device");
                String slide = rs.getString("slide");
                
                logMessage(scn,action,device,command);
                sendToVMS(device,slide,command);
            }
        }catch(SQLException sqe){
            System.out.println("Error while searching message in re_actions table: "+sqe);
        }
        
        finally{
            if(conn!=null)conn.close();
            if(pst!=null)pst.close();
            if(rs!=null)rs.close();
        }
        
    }
    
    
    
    public static void main(String[] args) throws IOException, SQLException, ParseException {
        
        if(checkLicence(args[0])){
            Connection conn = null;
            PreparedStatement pst = null;
            ResultSet rs = null;
            dataConnectionObject dco = new dataConnectionObject();
            //LiveValues lValue = new LiveValues();
            StringBuffer sb;

            Calendar calendar = Calendar.getInstance();
            int dow = calendar.get(Calendar.DAY_OF_WEEK);
            //LocalDateTime curTime = LocalDateTime.now();

            conn = dco.getConnection();

            try{
                sb = new StringBuffer();
                sb.append("select distinct A.RuleId from re_rules A, rules B where A.RuleId=B.RuleID AND ");

                switch (dow) {
                    case 1 : sb.append("CURTIME() > B.FromTimeSun and CURTIME() < B.ToTimeSun"); break;
                    case 2 : sb.append("CURTIME() > B.FromTimeMon and CURTIME() < B.ToTimeMon"); break;
                    case 3 : sb.append("CURTIME() > B.FromTimeTue and CURTIME() < B.ToTimeTue"); break;
                    case 4 : sb.append("CURTIME() > B.FromTimeWed and CURTIME() < B.ToTimeWed"); break;
                    case 5 : sb.append("CURTIME() > B.FromTimeThu and CURTIME() < B.ToTimeThu"); break;
                    case 6 : sb.append("CURTIME() > B.FromTimeFri and CURTIME() < B.ToTimeFri"); break;
                    case 7 : sb.append("CURTIME() > B.FromTimeSat and CURTIME() < B.ToTimeSat"); break;
                }
                pst = conn.prepareStatement(sb.toString());

                rs = pst.executeQuery();

                while(rs.next()){
                    Byte ruleId = rs.getByte("RuleId");

                    Rule rule = checkRule(ruleId);

                    if(rule.getFlag()==1){
                        doAction(ruleId, rule.getScn(), rule.getVarName());
                    }

                }

                updateServicesDB(conn, "Rule Engine");



            } catch(SQLException sqe){
                System.out.println("Error while searching Rule_ID in re_rules table: "+sqe);
            }

            finally{
                if(conn!=null)conn.close();
                if(pst!=null)pst.close();
                if(rs!=null)rs.close();
            }
        } else{
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
                Logger.getLogger(RuleEngine.class.getName()).log(Level.SEVERE, null, ex);
            }
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
