/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import util.DBConnection;

/**
 *
 * @author jahrin
 */
public class LeaveCount {

    public float medical = 0;
    public float annual;
    public float casual;
    public int count;
    public static Connection con = null;
    public static Statement statement = null;
    public static ResultSet resultSet = null;

    public int checkWorkingMonth(int emp) {
        try {

            con = DBConnection.createConnection();
            statement = con.createStatement();

            String s = "select count(month) FROM salary where EID=" + emp;

            resultSet = statement.executeQuery(s);

            while (resultSet.next()) {
                count = Integer.parseInt(resultSet.getString("count(month)"));

            }

        } catch (Exception e) {
        }

        return count;

    }

    public boolean checkCurrentYear(int emp, int y) {
        String sql = "select * from total_leave where empID= ? AND working_year = ?";

        try {
            con = DBConnection.createConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, emp);
            st.setInt(2, y);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }

    public float calMedicalLeave(int emp, float no, int year) {

        try {

            con = DBConnection.createConnection();
            statement = con.createStatement();

            String s = "select medical FROM total_leave where (working_year=" + year + ") AND (empID =" + emp + ")";

            resultSet = statement.executeQuery(s);

            while (resultSet.next()) {
                medical = Float.parseFloat(resultSet.getString("medical"));

            }

            medical = medical + no;
        } catch (Exception e) {
        }

        return medical;

    }

    public float calAnnualLeave(int emp, float no, int year) {

        try {

            con = DBConnection.createConnection();
            statement = con.createStatement();

            String s = "select annual FROM total_leave where (working_year=" + year + ") AND (empID =" + emp + ")";

            resultSet = statement.executeQuery(s);

            while (resultSet.next()) {
                annual = Float.parseFloat(resultSet.getString("annual"));

            }

            annual += no;
        } catch (Exception e) {
        }
        return annual;

    }

    public float calCasualLeave(int emp, float no, int year) {

        try {

            con = DBConnection.createConnection();
            statement = con.createStatement();

            String s = "select casual FROM total_leave where (working_year=" + year + ") AND (empID =" + emp + ")";

            resultSet = statement.executeQuery(s);

            while (resultSet.next()) {
                casual = Float.parseFloat(resultSet.getString("casual"));

            }

            casual += no;
        } catch (Exception e) {
        }
        return casual;

    }

}
