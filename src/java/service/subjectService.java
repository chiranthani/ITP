package service;





import Model.subjectcls;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DBConnection;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author jahrin
 */
public class subjectService implements subjectinterface{
       
         public  Connection con;
        public static PreparedStatement preparedStatement;
    
    
    @Override
    public void addsubject(subjectcls subject) {
        
             String subcode = subject.getSubjectCode();
            String subname  = subject.getSubjectName();
            String coursecode =subject.getCoursecode();
        
                
        
                   
                   
                   try{
                       
                       con = DBConnection.createConnection();
                       String query;
                 query = "insert into subject ( subCode,subName,courseCode)" + " values (?,?,?) ";
                       
                         preparedStatement = con.prepareStatement(query);


			preparedStatement.setString(1,subcode);
			preparedStatement.setString(2,subname);
			preparedStatement.setString(3,coursecode);
		
		
			
			
			preparedStatement.executeUpdate();
                   }
                   
                    catch(SQLException e){
                        
                    	
				e.printStackTrace();
			}
                   
			 finally {
		
				 try {
					 if (preparedStatement != null) {
						 preparedStatement.close();
					 }
					 	if (con != null) {
					 		con.close();
					 	}
				  }
                                  
                                 catch (SQLException e) {
					 e.getMessage();
				 }
				 
				
		}
        
        
        
    }

    @Override
    public String updatesubject(String subcode, subjectcls sub) {
        
         if(subcode != null){
              
            
            String subname  = sub.getSubjectName();
            String coursecode =sub.getCoursecode();
          
                 	try
			{
				con = DBConnection.createConnection();
		
		String query="Update subject set  subCode=?,subName=?,courseCode=?  where subCode= '" +subcode + "'"; 

	    preparedStatement = con.prepareStatement(query);

                        preparedStatement.setString(1,subcode);
			preparedStatement.setString(2,subname);
			preparedStatement.setString(3,coursecode);
		
			
							
				preparedStatement.executeUpdate();				
				
			} catch (SQLException e) {
					e.getMessage();
				}
                 
                   finally {
			
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (con != null) {
						con.close();
					}
				}
                                
                                catch (SQLException e) {
					 e.getMessage();
				}
			}
                 
                 
                 
          
          }
            return subcode;

        
        
        
          }

    @Override
    public void deletesubject(String subcode) {
        
               	if (subcode != null ) {
			
			
			
			try{ 
				con = DBConnection.createConnection();
                                
			String query="delete  from subject where  subCode = '" +subcode+"'";
				
				preparedStatement = con.prepareStatement(query);
				
			
				preparedStatement.executeUpdate();				
				
			} 
                        
                        catch (SQLException e) {
					e.getMessage();
				} 
                          
    
    
                       finally {
			
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (con != null) {
						con.close();
					}
				} catch (SQLException e) {
					 e.getMessage();
				}
			
				}
			}
		}
    
       
    }
    

