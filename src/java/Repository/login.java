/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Repository;

import Config.DBConnection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Nirash
 */
public class login {
    
    private String password;
    private String username;
    
	public login(String username, String password) {
		this.username = username;
		this.password = password;
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
    
    
    
    
    
    
    
}