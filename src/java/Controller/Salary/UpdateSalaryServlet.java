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
@WebServlet(name = "UpdateSalaryServlet", urlPatterns = {"/UpdateSalaryServlet"})
public class UpdateSalaryServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");

        Salary s1 = new Salary();

        int empNo = Integer.parseInt(request.getParameter("empNo"));
        String month = request.getParameter("month");
        int year = Integer.parseInt(request.getParameter("year"));
        double basic = Double.parseDouble(request.getParameter("basic"));
        double bonus = Double.parseDouble(request.getParameter("bonus"));
        double deduction = Double.parseDouble(request.getParameter("deduction"));
        double festival = Double.parseDouble(request.getParameter("festival"));

        s1.setMonth(month);
        s1.setYear(year);
        s1.setBasic(basic);
        s1.setBonus(bonus);
        s1.setDeduction(deduction);
        s1.setFestival(festival);

        ISalary isal = new ISalaryImp();
        String updated = isal.updateSalary(empNo, s1);

        if (updated.equals("Successfully updated!")) {

          /*  SalaryCalculate Scal = new SalaryCalculate();

           // double ot = Scal.CalOtSalary(empNo, month, year);
            double nopay = Scal.nopay();
            double grossSalary = Scal.grossSalary();
            double epf = Scal.epf();
            double BalanceSalary = Scal.BalanceSalary();
            double grossAmount = Scal.grossAmount();
            double netSalary = Scal.netSalary();

            Salary sa = new Salary();

          //  sa.setOt(ot);
            sa.setNopay(nopay);
            sa.setGrossSalary(grossSalary);
            sa.setEpf(epf);
            sa.setBalanceSalary(BalanceSalary);
            sa.setGrossAmount(grossAmount);
            sa.setNetSalary(netSalary);

            ISalary iSal1 = new ISalaryImp();

           // iSal1.updateCalculate(empNo, year, month, sa);
*/
            request.setAttribute("sucMsg", updated);
            request.setAttribute("empNo", empNo);
            request.setAttribute("month", month);
            request.setAttribute("year", year);
            
            
            request.getRequestDispatcher("/AddBonusSalary.jsp").forward(request, response);
        } else {
            request.setAttribute("errMsg", updated);
                          //  out.println("<script type=\ "text/javascript\">");
            // out.print("alert(" + ")");
            request.getRequestDispatcher("/AddBonusSalary.jsp").forward(request, response);
        }

    }

}
