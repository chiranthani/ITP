/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package QAnswerRepository;

import CommonMethods.DBConnection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.management.RuntimeErrorException;

/**
 *
 * @author Nirash
 */
public class QaRepository {
    
    public String saveStudent(String name, String dob){
    String msg = null;
    try{
    DBConnection conn = new DBConnection();
            
    boolean isExecuted = conn.setData("INSERT INTO student(studentName, dob) VALUES('"+ name +"', '"+ dob +"')");
    if(isExecuted){
    msg = "STUDENT Succesfully Registered";
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
     
    public String saveStudentLoginDetails(String username, String password){
    String msg =  null;
    
    return msg;
    }

    
    

    
    
    
    
    public ResultSet login(String username, String password) throws ClassNotFoundException, SQLException{
    ResultSet user = null;
    DBConnection db = new DBConnection();
    
    ResultSet data = db.getData("SELECT * FROM login WHERE username='"+ username + "'" + "AND password='" + password + "'");
    
    if (data != null && data.next() && data.isFirst()==data.isLast())
   
    
    
    {
    user = data;
    
    }else if(data != null && data.next() && data.isFirst() !=data.isLast()){
    user = null;
    throw new RuntimeException("Database Contains Multiple Records");
    
    }
    
    
    
    
    
    else{
    user = null;
    throw new RuntimeException("Cannot Find User"); //because the problem comes when it runs
    }
        
    return user;
    
    
    
    
    
    
    
    
    
    
    
    
}
    
    
  
    
//    public ResultSet view(String studentName) throws ClassNotFoundException, SQLException{
//    ResultSet user = null;
//    DBConnection db = new DBConnection();
//    
//    ResultSet data = db.getData("SELECT * FROM student WHERE StudentName='"+ studentName +"'");
//    
////    if(data != null data.next()){
////    String A = data.
////    }
//    
//    }
    
    
    
    public ResultSet getAllQuestions(){
    ResultSet allQuestions = null;
    try{
    DBConnection connection = new DBConnection();
    allQuestions = connection.getData("SELECT * FROM question");
    }
    catch(Exception e){
    throw new RuntimeException("Exception occured while reciving all questions");
    }
    
    return allQuestions;
    }
    
    
    
    //**********************
    
    //How to CHeck Errors
    
    //***********
    
    
//    public static void main(String[] args) throws SQLException {
//        ResultSet rs = new StudentRepository().getAllStudents();
//        
//        
//       // System.out.println(new StudentRepository().getAllStudents()); 
//        while(rs.next()){
//            System.out.println(rs.getString("StudentName"));
//        }
//        
//    }
//    
   
    
    //idStudent is FROM DB
    
    
    public void DeleteQuestionByID(int ID) throws RuntimeException,Exception{
    
    try{
    
        DBConnection connection = new DBConnection();
        connection.setData("DELETE FROM question where id_question="+ID);
        
    }catch(Exception e){
    
    throw new RuntimeException("Couldnt remove the student using id_question ID"+e);
    }
        
    }
   
    
    
    public void updateQuestionById(int id, String name) throws RuntimeException, Exception{
    
    try {
    DBConnection connection = new DBConnection();
    connection.setData("UPDATE question SET question='"+name+"' WHERE id_question="+id);
    
    }
    catch(Exception e){
    
        throw new RuntimeException("Couldn't Update Question by id",e);
    }
    
    }
    
    
    
    public ResultSet getQuestionById(int id) throws RuntimeException, Exception{
    ResultSet data = null;
    
    try{
    DBConnection connection = new DBConnection();
    data = connection.getData("SELECT * FROM question WHERE id_question="+ id);
    }
    catch(Exception e){
    throw new RuntimeException("Cannot Retrive student details by"+ "question id",e);
    }
    return data;
    }
    
    

    
    
}