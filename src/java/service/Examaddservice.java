package service;

import util.DBConnection;
import Model.examcls;
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
public class Examaddservice implements examiinterface {

    public Connection con;
    public static PreparedStatement preparedStatement;

    @Override
    public void addExam(examcls exam) {

        String examCodec = exam.getexamCode();
        String batchc = exam.getbatch();
        String examTypec = exam.getexamType();
        String datec = exam.getexamDate();
        String timec = exam.getexamTime();
        String durationc = exam.getduration();
        String codec = exam.getsubjectCode();

        try {

            con = DBConnection.createConnection();
            String query = "insert into `exam`(examCode,batch,examType,examDate,examTime,duration,subjectCode)" + " values (?,?,?,?,?,?,?) ";

            preparedStatement = con.prepareStatement(query);

            preparedStatement.setString(1, examCodec);
            preparedStatement.setString(2, batchc);
            preparedStatement.setString(3, examTypec);
            preparedStatement.setString(4, datec);
            preparedStatement.setString(5, timec);
            preparedStatement.setString(6, durationc);
            preparedStatement.setString(7, codec);

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
    public String updateExam(String examCode, examcls exam) {

        if (examCode != null) {

            String examCodec = exam.getexamCode();
            String batchc = exam.getbatch();
            String examTypec = exam.getexamType();
            String datec = exam.getexamDate();
            String timec = exam.getexamTime();
            String durationc = exam.getduration();
            String codec = exam.getsubjectCode();

            try {
                con = DBConnection.createConnection();

                String query = "Update `exam` set examCode=?,batch=?,examType=?,examDate=?,examTime=?,duration=?,subjectCode=?  where examCode='" + examCodec + "'";

                preparedStatement = con.prepareStatement(query);

                preparedStatement.setString(1, examCodec);
                preparedStatement.setString(2, batchc);
                preparedStatement.setString(3, examTypec);
                preparedStatement.setString(4, datec);
                preparedStatement.setString(5, timec);
                preparedStatement.setString(6, durationc);
                preparedStatement.setString(7, codec);

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
        return examCode;

    }

    @Override
    public void deleteExam(String examCode) {
        if (examCode != null) {

            try {
                con = DBConnection.createConnection();

                String query = "delete from `exam` where examCode='" + examCode + "' ";

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
