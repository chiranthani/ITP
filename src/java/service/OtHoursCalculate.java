/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import util.DBConnection;

/**
 *
 * @author jahrin
 */
public class OtHoursCalculate {

    public static Connection con = null;
    public static Statement statement = null;
    public static ResultSet resultSet = null;

    public String ot;
    public String type;

    SimpleDateFormat format = new SimpleDateFormat("HH:mm");
    long diffMinutes;
    long diffHours;

    public String empType(int emp) {

        try {

            con = DBConnection.createConnection();
            statement = con.createStatement();

            String sql1 = "select * from employee where (eid= " + emp + ") ";

            resultSet = statement.executeQuery(sql1);

            while (resultSet.next()) {

                type = resultSet.getString("EmpType");

            }

        } catch (Exception e) {
        }

        return type;

    }

    public long otCal(int emp, int year, String month, int date, String type) throws Exception {

        try {
            con = DBConnection.createConnection();

            statement = con.createStatement();

            String sql1 = "select * from emp_attendance where (eid= " + emp + ") AND ( year=" + year + ") AND (month ='" + month + "') AND (date =" + date + ")";

            resultSet = statement.executeQuery(sql1);

            while (resultSet.next()) {

                ot = resultSet.getString("leave_time");

            }
            String Mtime = "04:30";
            String Ntime = "05:30";
            Date ot1 = format.parse(ot);
            Date Mtime1 = format.parse(Mtime);
            Date Ntime1 = format.parse(Ntime);

            if (ot1.before(Mtime1)) {
                if (type.equalsIgnoreCase("Lecturer")) {

                    long diff = ot1.getTime() - Mtime1.getTime();
                    long diffMinutes = diff / (60 * 1000) % 60;
                    long diffHours = diff / (60 * 60 * 1000) % 24;

                } else if (type.equalsIgnoreCase("Manager") /*&& ot > Mtime1*/) {

                    long diff = ot1.getTime() - Mtime1.getTime();
                    long diffMinutes = diff / (60 * 1000) % 60;
                    long diffHours = diff / (60 * 60 * 1000) % 24;

                } else if (type.equalsIgnoreCase("Non-Academic")/* && ot > Ntime1*/) {

                    long diff = ot1.getTime() - Ntime1.getTime();
                    long diffMinutes = diff / (60 * 1000) % 60;
                    long diffHours = diff / (60 * 60 * 1000) % 24;

                }
            }
        } catch (Exception e) {
        }

        return diffHours + diffMinutes;
    }
}
