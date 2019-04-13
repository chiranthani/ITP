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
public class TimeTable {
    private String period,date,sub;
    private String h, lec;
    
    private DBConnection db = new DBConnection();
    private Connection newCon = null;
    
    public TimeTable (String period, String date, String sub, String h, String lec ){
        this.period = period;
        this. date = date;
        this.sub = sub;
        this.h = h;
        this.lec = lec;
    }
    
    public boolean isInserted()throws ClassNotFoundException, SQLException {
    
        if (db.isConnected()) {
            newCon = DBConnection.getCon();
            
            Statement st = newCon.createStatement();
            String query = "INSERT INTO Lecture_time (timePeriod, day, subject, hallNum, LectrerName) VALUES ('"+period+"', '"+date+"', '"+sub+"', '"+h+"', '"+lec+"') ";
            
            int result = st.executeUpdate(query);
            
            if(result > 0)
                return true;
            else
                return false;
        }
        else
            return false;
    }
}
