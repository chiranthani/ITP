/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.sql.rowset.CachedRowSet;

/**
 *
 * @author Nirash
 */
public class DBConnection {

    private static Connection conn;

    public DBConnection() throws ClassNotFoundException, SQLException {
        if (conn == null) {

            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/i_ms_new", "root", "");

        }

    }

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/i_ms_new", "root", "");
        } catch (Exception e) {
            System.out.println("Error:" + e);
        }

        return conn;
    }

    public boolean setData(String sql) throws SQLException {

        boolean isExecuted = false;
        if (conn != null) {
            Statement st = conn.createStatement();
            st.executeUpdate(sql);//any update insert update delete this command works
            isExecuted = true;//if executed
        }
        return isExecuted;//true or false value wiill get passed

    }

    public ResultSet getData(String sql) throws SQLException {
        ResultSet resultSet = null;
        if (conn != null) {
            if (conn != null) {
                Statement st = conn.createStatement();
                resultSet = st.executeQuery(sql);
            }
        }
        return resultSet;
    }

    public boolean isConnected() {
        boolean isConnected = false;
        if (conn != null) {
            isConnected = true;

        }

        return isConnected;
    }

}
