package service;

import util.DBConnection;
import Model.resultcls;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author rushaid
 */
public class Resultaddservice implements resultinterface {

    public Connection con;
    public static PreparedStatement preparedStatement;

    @Override
    public void addResult(resultcls result) {

        String studentID = result.getstudentID();
        String id = result.getsubject_name();
        String marks = result.getmarks();

        try {

            con = DBConnection.createConnection();
            String query = "insert into `result`(studentID,Subject_name,marks)" + " values (?,?,?)";

            preparedStatement = con.prepareStatement(query);

            preparedStatement.setString(1, studentID);
            preparedStatement.setString(2, id);
            preparedStatement.setString(3, marks);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {

            e.printStackTrace();
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

    @Override
    public String updateResult(String resultID, resultcls result) {

        if (resultID != null) {

            String studentID = result.getstudentID();
            String id = result.getsubject_name();
            String marks = result.getmarks();

            try {
                con = DBConnection.createConnection();

                String query = "Update `result` set studentID=?,Subject_name=?,marks=?  where studentID='" + studentID + "'";

                preparedStatement = con.prepareStatement(query);

                preparedStatement.setString(1, studentID);
                preparedStatement.setString(2, id);
                preparedStatement.setString(3, marks);

                preparedStatement.executeUpdate();

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
        return resultID;
    }

    @Override
    public void deleteResult(String studentID) {
        if (studentID != null) {

            try {
                con = DBConnection.createConnection();

                String query = "delete from `result` where studentID='" + studentID + "'";

                preparedStatement = con.prepareStatement(query);

                preparedStatement.executeUpdate();

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
    }

}
