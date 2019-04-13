package Controller.Employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Hiruni Dep
 */
public class Employee {

    private String Fname, ID, Add, gender, bdate, mStatus;
    private String email, mobo, hm, djoin;
    private String etype, quli, Wexp;

    private String subject;

    public int id;
    private DBConnection db = new DBConnection();
    private Connection newCon = null;

    public static PreparedStatement preparedStatement;
    public static Statement statement = null;
    public static ResultSet resultSet = null;

    public Employee(String Fname, String ID, String Add, String gender, String bdate, String mStatus, String email, String mobo, String hm, String djoin, String etype, String quli, String Wexp, String subject) {
        this.Fname = Fname;
        this.ID = ID;
        this.Add = Add;
        this.gender = gender;
        this.bdate = bdate;
        this.mStatus = mStatus;
        this.email = email;
        this.mobo = mobo;
        this.hm = hm;
        this.djoin = djoin;
        this.etype = etype;
        this.quli = quli;
        this.Wexp = Wexp;
        this.subject = subject;
    }

    public Employee() {
    }

    public boolean isInserted() throws ClassNotFoundException, SQLException {

        if (db.isConnected()) {
            newCon = DBConnection.getCon();

            Statement stmt = newCon.createStatement();
            String query = "INSERT INTO Employee (FullName,NIC,Address,Gender,BDate,MaStatus,Email,Mobile,Home,DateJoined,EmpType,EduQulification,Experience,subject) VALUES ('" + Fname + "', '" + ID + "', '" + Add + "', '" + gender + "', '" + bdate + "', '" + mStatus + "', '" + email + "', '" + mobo + "', '" + hm + "', '" + djoin + "', '" + etype + "', '" + quli + "', '" + Wexp + "','" + subject + "') ";

            int result = stmt.executeUpdate(query);

            if (result > 0) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public int getID(String nic) throws ClassNotFoundException, SQLException {

        if (db.isConnected()) {
            newCon = DBConnection.getCon();

            Statement stmt = newCon.createStatement();

            String s = "select userID FROM employee where NIC ='" + nic + "'";

            resultSet = stmt.executeQuery(s);

            while (resultSet.next()) {
                id = Integer.parseInt(resultSet.getString("userID"));

            }
        }

        return id;

    }

    public boolean checkRegister(String nic) throws ClassNotFoundException, SQLException {

        String q = "select * from employee where NIC = ? ";

        if (db.isConnected()) {
            newCon = DBConnection.getCon();

            PreparedStatement st = newCon.prepareStatement(q);
           

            st.setString(1, nic);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return true;
            }           

        }
        return false;
    }

    public String searchResult(String nic) throws ClassNotFoundException, SQLException {

        String result1 = "non";

        if (db.isConnected()) {
            newCon = DBConnection.getCon();

            Statement stmt = newCon.createStatement();

            String s = "select interviewStatus FROM emp_interview where NIC ='" + nic + "'";

            resultSet = stmt.executeQuery(s);

            while (resultSet.next()) {
                result1 = resultSet.getString("interviewStatus");

            }

        }
        return result1;
    }

}
