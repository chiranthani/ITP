package service;

import Model.coursecls;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import util.DBConnection;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author jahrin
 */
public class Courseaddservice implements courseinterface {

    public Connection con;
    public static PreparedStatement preparedStatement;
    public static Statement statement = null;
    public static ResultSet resultSet = null;
    String result = "non";

    @Override
    public void addCourse(coursecls course) {

        String fullname = course.getName();
        String duration = course.getDuration();
        String fee = course.getFee();
        String subject = course.getsubject();
        String coursecode = course.getcourseCode();
        String date = course.getDate();
        String description = course.getDescription();

        try {

            con = DBConnection.createConnection();
            String query = "insert into course ( courseCode,courseName,startDate,noOfSubject,courseFee,duration,description)" + " values (?,?,?,?,?,?,?) ";

            preparedStatement = con.prepareStatement(query);

            preparedStatement.setString(1, coursecode);
            preparedStatement.setString(2, fullname);
            preparedStatement.setString(3, date);
            preparedStatement.setString(4, subject);
            preparedStatement.setString(5, fee);
            preparedStatement.setString(6, duration);
            preparedStatement.setString(7, description);

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
    public String updateCourse(String coursecode, coursecls course) {

        if (coursecode != null) {

            String fullname = course.getName();
            String duration = course.getDuration();
            String fee = course.getFee();
            String subject = course.getsubject();
            String date = course.getDate();
            String description = course.getDescription();

            try {
                con = DBConnection.createConnection();

                String query = "Update course set  courseCode=?,courseName=?,startDate=?,noOfSubject=?,courseFee=?,duration=?,description=?  where courseCode= '" + coursecode + "'";

                preparedStatement = con.prepareStatement(query);

                preparedStatement.setString(1, coursecode);
                preparedStatement.setString(2, fullname);
                preparedStatement.setString(3, date);
                preparedStatement.setString(4, subject);
                preparedStatement.setString(5, fee);
                preparedStatement.setString(6, duration);
                preparedStatement.setString(7, description);
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
        return coursecode;

    }

    @Override
    public void deleteCourse(String coursecode) {
        if (coursecode != null) {

            try {
                con = DBConnection.createConnection();

                String query = "delete  from course where  courseCode = '" + coursecode + "'";

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

    public String Check(String code) {

        try {

            con = DBConnection.createConnection();
            statement = con.createStatement();

            String sql = "select courseCode from course where courseName LIKE '%" + code + "%'";

            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                result = resultSet.getString("courseCode");

            }
        } catch (Exception e) {
        }

        return result;

    }
}
