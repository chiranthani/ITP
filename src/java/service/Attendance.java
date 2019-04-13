/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import Model.EmpAttendance;
import Model.StuAttendance;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import util.DBConnection;

/**
 *
 * @author Ganeesha
 */
public class Attendance {

    public static Connection con;
    public static PreparedStatement preparedStatement;
    public static Statement statement;
    public static ResultSet rs;

    public void addEmployeeAtt(EmpAttendance ea) {

        int empNo = ea.getEmpNo();
        String month = ea.getMonth();
        int year = ea.getYear();
        int date = ea.getDate();
        String atime = ea.getAtime();

        try {
            con = DBConnection.createConnection();
            String query = "insert into emp_attendance (year,month,date,eid,att_time) values (?,?,?,?,?)";

            preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, year);
            preparedStatement.setString(2, month);
            preparedStatement.setInt(3, date);
            preparedStatement.setInt(4, empNo);
            preparedStatement.setString(5, atime);

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

    public void addLeaveTime(int em, int year, String month, int date, EmpAttendance a) {

        if (em != 0 && year != 0 && month != null && date != 0) {

            String Ltime = a.getLtime();
           // int otH = a.getOtHours();
            //int otM = a.getOtMin();

            try {
                con = DBConnection.createConnection();
                String sql1 = "Update emp_attendance set leave_time=? where (eid= " + em + ") AND ( year=" + year + ") AND (month ='" + month + "') AND (date =" + date + ")";

                preparedStatement = con.prepareStatement(sql1);

                preparedStatement.setString(1, Ltime);
               // preparedStatement.setInt(2, otH);
                

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
    }
    
    public void addOT(int emp,int year,String month, int date,long  o){
            try {
            con = DBConnection.createConnection();
            String q = "update emp_attendance set ot_hours=? where (eid= " + emp + ") AND ( year=" + year + ") AND (month ='" + month + "') AND (date =" + date + ")"; 

            preparedStatement = con.prepareStatement(q);
            preparedStatement.setLong(1, o);


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

    public void addEmpLeave(EmpAttendance e1) {

        int empNo = e1.getEmpNo();
        String date2 = e1.getDate2();
        String LeaveT = e1.getLType();
        float no = e1.getDays();

        try {
            con = DBConnection.createConnection();
            String q = "insert into Emp_Leave (eid,leaveDate,leaveType,noOfDays) values (?,?,?,?)";

            preparedStatement = con.prepareStatement(q);
            preparedStatement.setInt(1, empNo);
            preparedStatement.setString(2, date2);
            preparedStatement.setString(3, LeaveT);
            preparedStatement.setFloat(4, no);

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

    public void insert(int em,int year) {

        try {
            con = DBConnection.createConnection();
            String query1 = "insert into total_leave(empID,working_year) values (?,?)";

            preparedStatement = con.prepareStatement(query1);

            preparedStatement.setInt(1, em);
            preparedStatement.setInt(2, year);

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

    public void addTotal(int eid, float count, String leaveType,int year) {

        try {
            con = DBConnection.createConnection();

            if (leaveType.equalsIgnoreCase("Medical")) {

                String query1 = "update total_leave set medical=?  where (working_year=" + year + ") AND (empID =" + eid + ")";
                

                preparedStatement = con.prepareStatement(query1);
                preparedStatement.setFloat(1, count);

                preparedStatement.executeUpdate();
            } else if (leaveType.equalsIgnoreCase("Annual")) {

                String query1 = "update total_leave set annual=?  where (working_year=" + year + ") AND (empID =" + eid + ")";

                preparedStatement = con.prepareStatement(query1);
                preparedStatement.setFloat(1, count);

                preparedStatement.executeUpdate();
            } else if (leaveType.equalsIgnoreCase("Casual")) {

                String query1 = "update total_leave set casual=?  where (working_year=" + year + ") AND (empID =" + eid + ")";

                preparedStatement = con.prepareStatement(query1);
                preparedStatement.setFloat(1, count);

                preparedStatement.executeUpdate();
            }

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

    public void addStudentAttendance(StuAttendance ss) {

        int sid = ss.getSid();
        String date = ss.getDate();
        String subject = ss.getSubject();
        String status = ss.getStatus();

        try {
            con = DBConnection.createConnection();
            String query1 = "insert into stu_attendance(sid,date,subjectCode,status) values (?,?,?,?)";

            preparedStatement = con.prepareStatement(query1);
            preparedStatement.setInt(1, sid);
            preparedStatement.setString(2, date);
            preparedStatement.setString(3, subject);
            preparedStatement.setString(4, status);

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

}
