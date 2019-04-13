
import Config.DBConnection;



public class Update {
    
    public String updateStudent(String name, String dob){
    String msg = null;
    try{
    DBConnection conn = new DBConnection();
            
    boolean isExecuted = conn.setData("UPDATE INTO student(studentName, dob) VALUES('"+ name +"', '"+ dob +"')");
    if(isExecuted){
    msg = "STUDENT Succesfully Updated";
    }else
    {
        msg = "Student data querry not succesfull";
    }
    }
    catch(Exception e){
    e.printStackTrace();
    msg = "There Is an error in the message";
    
    }       
    
    
    return msg;
    
}
    
    public String updateStudentLoginDetails(String username, String password){
    String msg =  null;
    
    return msg;
    }
    
    
    
}