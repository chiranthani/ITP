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
public class AddInterviewResult {
    private String ID,na,et,rst;
    private DBConnection db = new DBConnection();
    private Connection newCon = null;

    public AddInterviewResult(String ID, String na, String et, String rst) {
        this.ID = ID;
        this.na = na;
        this.et = et;
        this.rst = rst;
    }
    
    public boolean isInserted() throws ClassNotFoundException, SQLException {
    
        if (db.isConnected()){
            newCon = DBConnection.getCon();
            
            Statement st = newCon.createStatement();
            String sql = "INSERT INTO emp_interview (NIC,name,EmpType,interviewStatus) VALUES ('" +ID+ "', '" +na+ "', '" +et+ "', '" +rst+ "')";
            
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

