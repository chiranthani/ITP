/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Salary;

import Model.Salary;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.ISalary;
import service.ISalaryImp;
import service.SalaryCalculate;

/**
 *
 * @author IT17135580
 */
@WebServlet(name = "AddSalaryServlet", urlPatterns = {"/AddSalaryServlet"})
public class AddSalaryServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int emp = Integer.parseInt(request.getParameter("empNo"));
        int y = Integer.parseInt(request.getParameter("year"));
        String month = request.getParameter("month");
        double basic = Double.parseDouble(request.getParameter("basic"));
        double bonus = Double.parseDouble(request.getParameter("bonus"));
        double deduction = Double.parseDouble(request.getParameter("deduction"));
        double festival = Double.parseDouble(request.getParameter("festival"));

        Salary s = new Salary();

        s.setEmpNo(emp);
        s.setMonth(month);
        s.setYear(y);
        s.setBonus(bonus);
        s.setDeduction(deduction);
        s.setBasic(basic);
        s.setFestival(festival);

        ISalary iSalary = new ISalaryImp();
       // String added = iSalary.addSalary(s);
/*
        if (added.equals("Successfully Added!")) {

            SalaryCalculate Scal = new SalaryCalculate();
            double ot = Scal.CalOtSalary(emp, month, y);
            double nopay = Scal.nopay();
            double grossSalary = Scal.grossSalary();
            double epf = Scal.epf();
            double BalanceSalary = Scal.BalanceSalary();
            double grossAmount = Scal.grossAmount();
            double netSalary = Scal.netSalary();

            Salary s1 = new Salary();
            s1.setOt(ot);
            s1.setNopay(nopay);
            s1.setGrossSalary(grossSalary);
            s1.setEpf(epf);
            s1.setBalanceSalary(BalanceSalary);
            s1.setGrossAmount(grossAmount);
            s1.setNetSalary(netSalary);

            ISalary iSalary1 = new ISalaryImp();
            iSalary1.updateCalculate(emp, y, month, s1);

            request.setAttribute("sucMessage", added);
            request.getRequestDispatcher("/AddSalary.jsp").forward(request, response);
        } else {
            request.setAttribute("errMessage", added);
                          //  out.println("<script type=\ "text/javascript\">");
            // out.print("alert(" + ")");
            request.getRequestDispatcher("/AddSalary.jsp").forward(request, response);
        }*/
    }

}
