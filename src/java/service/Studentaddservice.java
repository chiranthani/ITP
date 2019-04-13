package service;

import util.DBConnection;
import Model.examstudentcls;
import static java.lang.System.out;
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
public class Studentaddservice implements studentinterface {

    public Connection con;
    public static PreparedStatement ps;

    @Override
    public void addStudent(examstudentcls student) {

        String examCode = student.getexamCode();
        String[] id = student.getStudentsArray();

        try {
            con = DBConnection.createConnection();
            PreparedStatement drop = con.prepareStatement("DELETE FROM `student_exam` WHERE examCode=?");
            drop.setString(1, examCode);
            int a=drop.executeUpdate();
            if (a == 0) {
                String query = "insert into `student_exam`(examCode,studentID)" + " values (?,?)";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, examCode);

                //hold execution status
                int exec = 0;

                for (int i = 0; i < id.length; i++) {
                    ps.setString(2, id[i]);
                    exec = ps.executeUpdate();

                    if (exec < 1) {
                        //if update failed exit from loop
                        break;
                    }
                }
                //after loop ends, check if entries were added
                if (exec > 0) {
                    out.print("success");
                } else {
                    out.print("failes");
                }
            } else {
                out.print("failed");
            }

        } catch (SQLException e) {

            e.printStackTrace();
        } finally {

            try {
                if (ps != null) {
                    ps.close();
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
    public String updateStudent(String examCode, examstudentcls  student ) {

        if (examCode != null) {

             String examCodec = student.getexamCode();
             String[] id = student.getStudentsArray();

            try {
                con = DBConnection.createConnection();

                String query = "Update `student_exam` set examCode=?,studentID=?  where examCode='" + examCodec + "'";

                ps = con.prepareStatement(query);
                ps.setString(1, examCode);

                for (int i = 0; i <= id.length; i++) {

                    ps.setString(i, id[i]);
                }
                ps.executeQuery();

            } catch (SQLException e) {
                e.getMessage();
            } finally {

                try {
                    if (ps != null) {
                        ps.close();
                    }
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException e) {
                    e.getMessage();
                }
            }
        }
        return examCode
                ;
    }

    @Override
    public void deleteStudent(String examCode) {
        if (examCode != null) {

            try {
                con = DBConnection.createConnection();

                String query = "delete from `result` where examCode='" + examCode + "'";

                ps = con.prepareStatement(query);

                ps.executeUpdate();

            } catch (SQLException e) {
                e.getMessage();
            } finally {

                try {
                    if (ps != null) {
                        ps.close();
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
