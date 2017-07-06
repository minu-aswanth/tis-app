/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package atccadapter;

import com.mysql.jdbc.StringUtils;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Properties;
import java.util.TooManyListenersException;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.comm.CommPortIdentifier;
import javax.comm.PortInUseException;
import javax.comm.SerialPort;
import javax.comm.SerialPortEvent;
import javax.comm.SerialPortEventListener;
import javax.comm.UnsupportedCommOperationException;

/**
 *
 * @author Mustafa
 */
public class ATCCAdapter implements SerialPortEventListener{

    /**
     * @param args the command line arguments
     */
    
    InputStream inputStream;
    
    public static void main(String[] args) {
        
        if((checkLicence(args[1]))){
            
            Connection conn=null;
        
            try {
                dataConnectionObject dco = new dataConnectionObject();
                conn = dco.getConnection();
                ATCCAdapter atccServer = new ATCCAdapter();
                atccServer.serialPortCommunication(conn, args[0]);

            } catch (IOException ex) {
                //Logger.getLogger(ATCCAdapter.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println(ex);
            }

            finally{
                if (conn!=null) try {
                    conn.close();
                } catch (SQLException ex) {
                    //Logger.getLogger(ATCCAdapter.class.getName()).log(Level.SEVERE, null, ex);
                    System.out.println(ex);
                }
            }
        }
    }
    
    public static boolean checkLicence(String licenceKeyPath){
        
        String command = licenceKeyPath+"checkLicence.exe ATC "+licenceKeyPath+"licenceKey.txt";
        Process p;
        
	try {
            p = Runtime.getRuntime().exec(command);
            p.waitFor();
            BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));

            String line = "";			
            if ((line = reader.readLine())!= null) {
                if("jdnosdnic".equalsIgnoreCase(line)) return true;
            }
            reader.close();
            return false;

	} catch (Exception e) {
            e.printStackTrace();
            return false;
	}
    }

    @Override
    public void serialEvent(SerialPortEvent spe) {
        switch(spe.getEventType()){
                case SerialPortEvent.OUTPUT_BUFFER_EMPTY:outputBufferEmpty(spe);break;
                case SerialPortEvent.DATA_AVAILABLE:dataAvailable(spe);break;   
            }
    }
    private void outputBufferEmpty(SerialPortEvent event) {
        System.out.println("atccadapter.ATCCAdapter.outputBufferEmpty()");
    }
    private void dataAvailable(SerialPortEvent event) {
    }
    
    private void serialPortCommunication(Connection conn, String scn) {
        try{
            Properties prop = new Properties();
            String propFileName = "resources/config.properties";
        
            InputStream inputstream;
            inputstream = getClass().getClassLoader().getResourceAsStream(propFileName);

            if (inputstream != null){ 
                prop.load(inputstream);
            } else {
                throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
            }

            /*String wantedPortName = prop.getProperty("serialPortName");
            if(wantedPortName.isEmpty()){
                System.out.println("serialPortName is not defined in the property file.");
            } else{
                wantedPortName = wantedPortName.trim();
            }*/
            
            String wantedPortName = getPortName(scn, conn);
            
            String br = prop.getProperty("Baudrate");
            if(StringUtils.isNullOrEmpty(br)){
                System.out.println("VMSBaudrate is not defined in the property file.");
            } else{
                br = br.trim();
            }
            String db = prop.getProperty("DataBits");
            if(StringUtils.isNullOrEmpty(db)){
                System.out.println("VMSDataBits is not defined in the property file.");
            } else{
                db = db.trim();
            }
            String sb = prop.getProperty("StopBits");
            if(StringUtils.isNullOrEmpty(sb)){
                System.out.println("VMSStopBits is not defined in the property file.");
            }else{
                sb = sb.trim();
            }
            String p = prop.getProperty("Parity");
            if(StringUtils.isNullOrEmpty(p)){
                System.out.println("VMSParity is not defined in the property file.");
            } else{
                p = p.trim();
            }

            if("1.5".equalsIgnoreCase(sb)){
                sb="3";     //StopBit of value 1.5 is configured as 3 in SertialPort.java
            }

            Integer parity = null;      //Integer conversion of parity is configured in SertialPort.java

            if("NONE".equalsIgnoreCase(p)){
                parity = 0;
            } else if("ODD".equalsIgnoreCase(p)){
                parity=1;
            }else if("EVEN".equalsIgnoreCase(p)){
                parity=2;
            }else if("MARK".equalsIgnoreCase(p)){
                parity=3;
            }else if("SPACE".equalsIgnoreCase(p)){
                parity=4;
            }

            Integer baudrate = Integer.parseInt(br);
            Integer dataBits = Integer.parseInt(db);
            Integer stopBits = Integer.parseInt(sb);
            
            SerialPort port = initializeSerialPort(wantedPortName, baudrate, dataBits, stopBits, parity);
            ATCCAdapter atccServer = new ATCCAdapter();

            port.addEventListener(atccServer);
            
            port.notifyOnDataAvailable(true);
            port.notifyOnOutputEmpty(true);

            readData(port, wantedPortName, conn, scn);
            
        } catch(IOException e){
            e.printStackTrace();
        } catch (TooManyListenersException ex) {
            //Logger.getLogger(ATCCAdapter.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        }
        
    }
    
    private SerialPort initializeSerialPort(String wantedPortName, Integer baudrate, Integer dataBits, Integer stopBits, Integer parity) {
        try{
            
            Enumeration portIdentifiers = CommPortIdentifier.getPortIdentifiers();
            CommPortIdentifier portID = null;
            
            while(portIdentifiers.hasMoreElements()){
                CommPortIdentifier pid = (CommPortIdentifier) portIdentifiers.nextElement();
                System.out.println(pid.getName());
                if(pid.getPortType() == CommPortIdentifier.PORT_SERIAL && pid.getName().equalsIgnoreCase(wantedPortName)){
                    portID = pid;
                    break;
                }
            }
            if (portID == null){
                System.out.println("Could not find Serial Port "+wantedPortName);
                System.exit(1);
            }
            // port identifier has been found by now and saved in portID.
            // Now to acquire the identified port.
            SerialPort port=null;
            port = (SerialPort) portID.open("HTMS_ATCC",10000); // shall wait for 10 sec to acquire the port.
            inputStream = port.getInputStream();
            port.setSerialPortParams(baudrate,dataBits,stopBits, parity); 
            
            return port;
            
        } catch (PortInUseException e){
            System.out.println("Port already in use "+e);
            System.exit(1);
            return null;
        } catch (UnsupportedCommOperationException ex) {
            //Logger.getLogger(ATCCAdapter.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
            return null;
        } catch (IOException ex) {
            //Logger.getLogger(ATCCAdapter.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
            return null;
        }
        // port has been acquired. Now we can configure it and obtain input and output streams.
        // Now to initialize the acquired Serial port
        
    }
    
    
    private void readData(SerialPort port, String wantedPortName, Connection conn, String scn) {
        BufferedReader echoStream = null;
        BufferedReader is = null;
        PrintStream os = null;
        
        try{
            
            String line=null;
            String ts=null, time=null;
            Pattern r = null;
            Matcher m = null;
            int lane = 0, classAxle=0, classSpeed=0, classLength=0, vehicleLength=0, numberOfAxle=0, error = 3;
            float speed = 0;
            Integer[] axleLength =null;
            boolean detected;
            Timestamp timestamp=null;
            
            echoStream = new BufferedReader(new InputStreamReader(port.getInputStream())); // prepare instream from connected port
            
            while(true){
                
                /*axleLength = new Integer[4];
            
                line = echoStream.readLine();
                if(line==null) {
                    break;
                }
                
                System.out.println("Line: "+line);
                
                r = Pattern.compile("^#[0-9]+:");
                m =r.matcher(line);
                if(!m.find()) {
                    System.out.println("Garbage collected successfully");
                    continue;
                }
                
                r = Pattern.compile("(SnMis)(\\s+)(#[0-9]+)");
                m = r.matcher(line);
                if(m.find()) {
                    // Invalid data
                    r = Pattern.compile("[0-9]+");
                    m = r.matcher(m.group(0));
                    if(m.find()) {
                        error = Integer.parseInt(m.group(0));
                        System.out.println("Invalid entry Error Code : "+m.group(0));
                    }
                    detected = false;
                    
                } else {
                    
                    detected = true;
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
                    //r = Pattern.compile("(#(.*?),)(\\s+)([0-9]+cm)(.*?)(|$|<CR><LF>$)");
                    r= Pattern.compile("(L#[0-9]+,)(\\s+)([0-9]+cm)(.*?)($)");
                    m = r.matcher(line);
                    if(m.find()) {
                        //System.out.println("Test extracted: "+m.group(0));
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
                        v = null;
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
                
                insertIntoDataDB(conn, scn, detected, error, wantedPortName, lane, timestamp, speed, numberOfAxle, vehicleLength, classAxle, classSpeed, classLength, axleLength);
                updateServicesDB(conn, "ATCC Adapter");*/
                
                axleLength = new Integer[4];
                line = echoStream.readLine();
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
                
                /*int lane = 0, classAxle=0, classSpeed=0, classLength=0, vehicleLength=0, numberOfAxle=0, error = 3;
                float speed = 0;
                Integer[] axleLength =null;
                boolean detected;
                Timestamp timestamp=null;*/
                
                if(axleLength[0]!=null){
                    insertIntoDataDB(conn, scn, detected, error, wantedPortName, lane, timestamp, speed, numberOfAxle, vehicleLength, classAxle, classSpeed, classLength, axleLength);
                    updateServicesDB(conn, "ATCC Adapter");
                }
                
                
            }
            
        }catch(IOException e){
            System.out.println("Can't open input streams: write only. " + e);
            echoStream = null;
        } catch (Exception ex) {
            //Logger.getLogger(ATCCAdapter.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        }
        
        try{
            if(is!=null)is.close();
            if(echoStream!=null) echoStream.close();
            if(os!=null) os.close();
            if(port!=null) port.close();
        } catch(IOException ex){
            System.out.println("Error while closing InputStream Connection"+ex);
        }
        
    }

    private void insertIntoDataDB(Connection conn, String scn, boolean detected, int errorCode, String wantedPortName, int lane, Timestamp ts, 
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

    private String getPortName(String scn, Connection conn) {
        try {
            PreparedStatement pst = conn.prepareStatement("SELECT Port FROM utmc_detector_static WHERE SystemCodeNumber=?");
            pst.setString(1, scn);
            
            ResultSet rs = pst.executeQuery();
            String port = null;
            if(rs.next()){
                port = rs.getString("Port");
            }
            return port;
            
        } catch (SQLException ex) {
            //Logger.getLogger(ATCCAdapter.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
            return null;
        }
        
    }

    private boolean towardsTollCheck(Connection conn, String scn, int lane){
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
    
    
    private static void updateServicesDB(Connection conn, String service_name) {
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
            if(pst!=null)try {
                pst.close();
            } catch (SQLException ex) {
                //Logger.getLogger(ATCCAdapter.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println(ex);
            }
        }
    }

    
    
}
