/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Employee;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author jahrin
 */
public class EmployeeAccount {
    private int uID;
    private String type,user,pass;
    
    private DBConnection db = new DBConnection();
    private Connection newCon = null;

    public EmployeeAccount(int uID, String type, String user, String pass) {
        this.uID = uID;
        this.type = type;
        this.user = user;
        this.pass = pass;
    }
 
    public boolean isInserted() throws ClassNotFoundException, SQLException {
    
        if (db.isConnected()){
            newCon = DBConnection.getCon();
            
            Statement st = newCon.createStatement();
            String sql = "INSERT INTO login (userType,userName, userID, password) VALUES ('" +type+ "', '" +user+ "', '" +uID+ "', '" +pass+ "')";
            
            int result = st.executeUpdate(sql);
            
            if(result > 0) {
                return true;
            }else
                return false;
        }
        else
            return false;
    }
}
