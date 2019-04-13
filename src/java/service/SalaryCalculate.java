/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import util.DBConnection;

/**
 *
 * @author Ganeesha
 */
public class SalaryCalculate {

    public double otSalary, EPF, grossSalary, netSalary, grossAmt, balanceSalary, noPay = 0, totalSalary = 0;
    private double deduction = 0, basic = 0, Incentive = 0, festival = 0, medi, casual, annual, hourlyRate;
    private int otHours;
    public int count;
    //int a[] = new int[count];
    public static Connection con = null;
    public static Statement statement = null;
    public static ResultSet resultSet = null;

    public int empCount(String month, int year) {

        try {

            con = DBConnection.createConnection();
            statement = con.createStatement();

            String s = "select count(EID) FROM salary where ( year=" + year + ") AND (month ='" + month + "')";

            resultSet = statement.executeQuery(s);

            while (resultSet.next()) {
                count = Integer.parseInt(resultSet.getString("count(EID)"));
                // count = new int[n];
            }
        } catch (Exception e) {
        }

        return count;

    }

    public int[] id(String month, int year, int no) {

        try {
            // ArrayList list = new ArrayList();
            // int i = 0;
            con = DBConnection.createConnection();
            statement = con.createStatement();

            String s = "select EID FROM salary where ( year=" + year + ") AND (month ='" + month + "')";

            resultSet = statement.executeQuery(s);
            int a[] = new int[no];
            int i = 0;
            while (resultSet.next()) {
                //for (int i = 0; i < aq; i++) {
                //    list.add(Integer.parseInt(resultSet.getString("EID")));
                a[i] = Integer.parseInt(resultSet.getString("EID"));
                //  ArrayList l = new ArrayList();
                //  l.add(list);
                //}
                i++;
            }

            return a;
        } catch (Exception e) {
            e.getMessage();
            //out.print(ex);

        }
        return null;

    }

    public double CalOtSalary(String month, int year, int id) {

        try {
            con = DBConnection.createConnection();
            statement = con.createStatement();

            String s = "select sum(ea.ot_hours) FROM emp_attendance ea, employee e where (e.userID = ea.eid) AND (ea.uerID=" + id + " ) AND ( ea.year=" + year + ") AND (ea.month ='" + month + "')";

            resultSet = statement.executeQuery(s);

            while (resultSet.next()) {

                otHours = Integer.parseInt(resultSet.getString("sum(ea.ot_hours)"));
            }
        } catch (Exception e) {
        }
        /* try {
            con = DBConnection.createConnection();
            statement = con.createStatement();

            String s = "select sum(ea.ot_min) FROM emp_attendance ea, employee e where (e.userID = ea.eid) AND (ea.uerID=" + id + " ) AND ( ea.year=" + year + ") AND (ea.month ='" + month + "')";

            resultSet = statement.executeQuery(s);

            while (resultSet.next()) {

                otMin = Integer.parseInt(resultSet.getString("sum(ea.ot_min)"));
            }
        } catch (Exception e) {

        }*/

        try {
            con = DBConnection.createConnection();
            statement = con.createStatement();

            String s1 = "select * FROM salary s, employee e where (s.EID=" + id + " ) AND (s.year=" + year + ") AND (s.month ='" + month + "')";

            resultSet = statement.executeQuery(s1);

            while (resultSet.next()) {

                basic = Double.parseDouble(resultSet.getString("s.basic_salary"));
                Incentive = Double.parseDouble(resultSet.getString("s.bonus"));
                deduction = Double.parseDouble(resultSet.getString("s.deductions"));
                festival = Double.parseDouble(resultSet.getString("s.festival"));

                //normal hourly rate = basic /no of days(per month) /hours(perday)
                hourlyRate = basic / 30.0 / 8.0;

                /*if(date == weekday & Saturday  )
                        1.5
                 */
                otSalary = (otHours) * hourlyRate * 1.5;

            }

        } catch (Exception e) {
        }

        return otSalary;
    }

    public double nopay(int id) {
        double noPayDays = 0.0;

        LeaveCount l = new LeaveCount();

        int c = l.checkWorkingMonth(id);
        int y = (c + 12) / 12;

        try {

            con = DBConnection.createConnection();
            statement = con.createStatement();

            String s = "select medical,annual,casual FROM total_leave where (empID=" + id + ")AND (working_year =" + y + ")";

            resultSet = statement.executeQuery(s);

            while (resultSet.next()) {
                medi = Integer.parseInt(resultSet.getString("medical"));
                annual = Integer.parseInt(resultSet.getString("annual"));
                casual = Integer.parseInt(resultSet.getString("casual"));
            }

            double t = medi + annual + casual;
            if (t == 0) {
                return noPay;

            }
            //medical = 14 , casual= 7, annual = 14 // total leaves
            noPayDays = t - 35;
            noPay = noPayDays * basic / 30.0;

        } catch (Exception e) {
        }

        return noPay;
    }

    public double grossSalary() {

        grossSalary = (basic + Incentive);

        return grossSalary;
    }

    public double epf() {
        EPF = basic * 0.08;
        return EPF;
    }

    public double BalanceSalary() {

        balanceSalary = grossSalary - (noPay + deduction + EPF);

        return balanceSalary;

    }

    public double grossAmount() {

        grossAmt = balanceSalary + otSalary;

        return grossAmt;
    }

    public double netSalary() {

        netSalary = grossAmt + festival;

        return netSalary;
    }

    //get total monthly salary for expense
    public double monthlyTotalSalary(String m, int y) {

        try {
            con = DBConnection.createConnection();
            statement = con.createStatement();

            String s111 = "select sum(net_salary) FROM salary where (year=" + y + ") AND (month ='" + m + "')";

            resultSet = statement.executeQuery(s111);

            while (resultSet.next()) {

                totalSalary = Double.parseDouble(resultSet.getString("sum(net_salary)"));

            }

        } catch (Exception e) {
        }

        return totalSalary;
    }
}
