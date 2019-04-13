/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import Model.EntryTest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import util.DBConnection;

/**
 *
 * @author IT17135580
 */
public class EntryTestImp {

    public static Connection con;
    public static PreparedStatement preparedStatement;
    public static ResultSet rs;
    public static Statement st;

    public String addDetails(EntryTest e) {

        String name = e.getName();
        String address = e.getAddress();
        String nic = e.getNic();
        int no = e.getNo();
        int olNo = e.getOlNo();
        int index = e.getIndex();
        String maths = e.getMaths();
        String english = e.getEnglish();
        String lan = e.getLanguage();

        if ((maths.equals("C") || maths.equals("B") || maths.equals("A")) && (english.equals("C") || english.equals("B") || english.equals("A"))) {

            try {
                con = DBConnection.createConnection();
                String w = "insert into entrytest (name,address,NIC,phone,OL_year,indexNo,maths,english,language) values (?,?,?,?,?,?,?,?,?)";

                preparedStatement = con.prepareStatement(w);
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, address);
                preparedStatement.setString(3, nic);
                preparedStatement.setInt(4, no);
                preparedStatement.setInt(5, olNo);
                preparedStatement.setInt(6, index);
                preparedStatement.setString(7, maths);
                preparedStatement.setString(8, english);
                preparedStatement.setString(9, lan);

                preparedStatement.executeUpdate();

            } catch (SQLException eq) {
                eq.printStackTrace();

            } finally {

                try {
                    if (preparedStatement != null) {
                        preparedStatement.close();
                    }
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException eq) {
                    eq.getMessage();
                }
            }
            return "You are selected for the Entry Test";
        }
        return "Entry Test requirements are not Enough";

    }

      public boolean checkRegister(String nic) {

       String sql = "select * from student where NIC = ? ";
           
            
            try{
                con = DBConnection.createConnection();
                PreparedStatement st = con.prepareStatement(sql);
                st.setString(1, nic);
                
                
                ResultSet rs = st.executeQuery();
                
      		if(rs.next())
		{
                    return true;
		}
                
                }catch(Exception e){
                        e.printStackTrace();
		}
		return false;
		
            }

    public String searchEntryTestResult(String nic) {

        String result11 = "non";
        try {

            con = DBConnection.createConnection();
            st = con.createStatement();
            String sql1 = " select test_Result from entryTest where NIC='" + nic + "'";

            rs = st.executeQuery(sql1);
            while (rs.next()) {
                result11 = rs.getString("test_Result");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result11;

    }
    public String addTestResult(EntryTest e1, String nic) {

        if (nic != null) {

            String result = e1.getResult();

            try {
                con = DBConnection.createConnection();
                String sql = "Update entrytest set test_Result=?  where NIC='" + nic + "'";

                preparedStatement = con.prepareStatement(sql);

                preparedStatement.setString(1, result);

                int a = preparedStatement.executeUpdate();

                if (a != 0) {
                    return "Successfully Added!";
                }

            } catch (SQLException e) {
                e.getMessage();
            } finally {

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
        return "Opps.. Please enter valid data..!";
    }

}
