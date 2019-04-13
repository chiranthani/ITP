/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package study;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Nirash
 */
public class MyConnection {

    static Connection con;

    public static Boolean isConnected() {
        if (getConnection() != null) {
            return true;
        }
        return false;
    }

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/email_validation", "root", "");
        } catch (Exception e) {
            System.out.println("Error:" + e);
        }

        return con;
    }

}
