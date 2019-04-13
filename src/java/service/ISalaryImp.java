package service;

import Model.Salary;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import util.DBConnection;

public class ISalaryImp implements ISalary {

    public static Connection con;
    public static PreparedStatement preparedStatement;
    public static Statement statement;
    public static ResultSet rs;
    ArrayList<ArrayList<String>> l = new ArrayList<ArrayList<String>>();

    @Override
    public String AddBasicSalary(Salary s) {

        int empNo = s.getEmpNo();
        String month = s.getMonth();
        int year = s.getYear();
        double basic = s.getBasic();

        try {
            con = DBConnection.createConnection();
            String query = "insert into Salary (year,month,EID,basic_salary) values (?,?,?,?)";

            preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, year);
            preparedStatement.setString(2, month);
            preparedStatement.setInt(3, empNo);
            preparedStatement.setDouble(4, basic);

            int i = preparedStatement.executeUpdate();
            if (i != 0) {
                return "Successfully Added!";
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
        return "Opps.. Something went wrong there..!";
    }

    @Override
    public String addBonusSalary(int y, String type, String month, String advance, Salary sa) {

        double amount = sa.getFestival();

        if (type.equalsIgnoreCase("Manager") && advance.equalsIgnoreCase("festival")) {

            try {
                con = DBConnection.createConnection();
                String q1 = "Update salary s, employee e set s.festival=? where (e.EmpType= 'Manager') AND (s.EID = e.userID) AND ( s.year=" + y + ") AND (s.month ='" + month + "')";

                preparedStatement = con.prepareStatement(q1);
                preparedStatement.setDouble(1, amount);

                int i = preparedStatement.executeUpdate();
                if (i != 0) {
                    return "Successfully Added!";
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

        } else if (type.equalsIgnoreCase("Manager") && advance.equalsIgnoreCase("Incentive")) {
            try {
                con = DBConnection.createConnection();
                String q2 = "Update salary s,employee e set s.bonus=? where (e.EmpType= 'Manager') AND (s.EID = e.userID) AND ( s.year=" + y + ") AND ( s.month ='" + month + "')";

                preparedStatement = con.prepareStatement(q2);
                preparedStatement.setDouble(1, amount);

                int i = preparedStatement.executeUpdate();
                if (i != 0) {
                    return "Successfully Added!";
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

        } else if (type.equalsIgnoreCase("Lecturer") && advance.equalsIgnoreCase("festival")) {

            try {
                con = DBConnection.createConnection();
                String q3 = "Update salary s, employee e set s.festival=? where (e.EmpType= 'Lecturer') AND (s.EID = e.userID) AND ( s.year=" + y + ") AND ( s.month ='" + month + "')";

                preparedStatement = con.prepareStatement(q3);
                preparedStatement.setDouble(1, amount);

                int i = preparedStatement.executeUpdate();
                if (i != 0) {
                    return "Successfully Added!";
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

        } else if (type.equalsIgnoreCase("Lecturer") && advance.equalsIgnoreCase("Incentive")) {

            try {
                con = DBConnection.createConnection();
                String q3 = "Update salary s,employee e set s.bonus=? where (e.EmpType= 'Lecturer') AND (s.EID = e.userID) AND ( s.year=" + y + ") AND (s.month ='" + month + "')";

                preparedStatement = con.prepareStatement(q3);
                preparedStatement.setDouble(1, amount);

                int i = preparedStatement.executeUpdate();
                if (i != 0) {
                    return "Successfully Added!";
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

        } else if (type.equalsIgnoreCase("Non Acadamic") && advance.equalsIgnoreCase("Festival")) {

            try {
                con = DBConnection.createConnection();
                String q3 = "Update salary s,employee e set s.festival=? where (e.EmpType= 'Non-Academic') AND (s.EID = e.userID) AND ( s.year=" + y + ") AND (s.month ='" + month + "')";

                preparedStatement = con.prepareStatement(q3);
                preparedStatement.setDouble(1, amount);

                int i = preparedStatement.executeUpdate();
                if (i != 0) {
                    return "Successfully Added!";
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

        } else if (type.equalsIgnoreCase("Non Acadamic") && advance.equalsIgnoreCase("Incentive")) {

            try {
                con = DBConnection.createConnection();
                String q3 = "Update salary s,employee e set s.bonus=? where (e.EmpType= 'Non-Academic') AND ( s.year=" + y + ") AND (s.month ='" + month + "')";

                preparedStatement = con.prepareStatement(q3);
                preparedStatement.setDouble(1, amount);

                int i = preparedStatement.executeUpdate();
                if (i != 0) {
                    return "Successfully Added!";
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
        return "Opps.. Something went wrong there..!";
    }

    @Override
    public String updateSalary(int eid, Salary salary) {

        if (eid != 0) {

            String month = salary.getMonth();
            int year = salary.getYear();
            double basic = salary.getBasic();
            double bonus = salary.getBonus();
            double deduction = salary.getDeduction();
            double festival = salary.getFestival();

            try {
                con = DBConnection.createConnection();
                String sql = "Update salary set year=?,month=?,EID=?,bonus=?,deductions=?,basic_salary=?,festival=?  where EID=" + eid;

                preparedStatement = con.prepareStatement(sql);

                preparedStatement.setInt(1, year);
                preparedStatement.setString(2, month);
                preparedStatement.setInt(3, eid);
                preparedStatement.setDouble(4, bonus);
                preparedStatement.setDouble(5, deduction);
                preparedStatement.setDouble(6, basic);
                preparedStatement.setDouble(7, festival);

                int a = preparedStatement.executeUpdate();

                if (a != 0) {
                    return "Successfully updated!";
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

    @Override
    public String deleteSalary(int eid, int year, String month) {

        if (eid != 0 && year != 0 && month != null) {

            try {
                con = DBConnection.createConnection();
                String sql = "DELETE FROM Salary where (eid= " + eid + ") AND ( year=" + year + ") AND (month ='" + month + "')";

                preparedStatement = con.prepareStatement(sql);

                int q = preparedStatement.executeUpdate();
                if (q != 0) {
                    return "Successfully deleted!";
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
        return "Can't delete selected record.!";

    }

    @Override
    public void updateCalculate(int year, String month, Salary sal1, int id) {

        double ot = sal1.getOt();
        double noPay = sal1.getNopay();
        double grossSalary = sal1.getGrossSalary();
        double epf = sal1.getEpf();
        double BalanceSalary = sal1.getBalanceSalary();
        double grossAmount = sal1.getGrossAmount();
        double netSalary = sal1.getNetSalary();

        try {

            con = DBConnection.createConnection();
            String sql = "Update salary set no_pay=?,OT=?,balance_sal=?,gross_salary=?,gross_Amt=?,net_salary=?,EPF =? where (EID= " + id + ") AND ( year=" + year + ") AND (month ='" + month + "')";

            preparedStatement = con.prepareStatement(sql);

            preparedStatement.setDouble(1, noPay);
            preparedStatement.setDouble(2, ot);
            preparedStatement.setDouble(3, BalanceSalary);
            preparedStatement.setDouble(4, grossSalary);
            preparedStatement.setDouble(5, grossAmount);
            preparedStatement.setDouble(6, netSalary);
            preparedStatement.setDouble(7, epf);

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
    //return null;

    @Override
    public ArrayList<ArrayList<String>> searchPaysheet(int year, String m) {

        try {

            ArrayList row = new ArrayList();
            con = DBConnection.createConnection();
            statement = con.createStatement();
            String sql = " select *, count(EID) from salary  where ( year=" + year + ") AND (month ='" + m + "') group by EID";

            rs = statement.executeQuery(sql);
            for (int i = 0; i < Integer.parseInt(rs.getString("count(EID)")); i++) {

                for (int n = 0; n < 4; n++) {
                    row.add(rs.getString("EID"));
                    row.add(rs.getString("deductions"));
                    row.add(rs.getString("bonus"));
                    row.add(rs.getString("year"));

                    l.add(row);
                }

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

        return l;

    }

    @Override
    public void addTotal(Salary inS/* ,int y,String m*/) {

        int y = inS.getYear(); //comment
        String m = inS.getMonth();//comment
        double t = inS.getTotal();

        try {
            con = DBConnection.createConnection();
            String q12 = "insert into expenses_income (year,month,TotalSalary) values (?,?,?)";
            // String q12 = "Update expenses_income set TotalSalary=? where ( year=" + y + ") AND (month ='" + m + "')";

            preparedStatement = con.prepareStatement(q12);
            preparedStatement.setInt(1, y); //comment
            preparedStatement.setString(2, m);// comment
            preparedStatement.setDouble(3, t);

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

}
