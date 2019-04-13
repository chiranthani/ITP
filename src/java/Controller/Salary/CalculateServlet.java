/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Salary;

import Model.Salary;
//import java.io.PrintWriter;
import java.io.IOException;
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
@WebServlet(name = "CalculateServlet", urlPatterns = {"/CalculateServlet"})
public class CalculateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

// PrintWriter out = response.getWriter();
        int y = Integer.parseInt(request.getParameter("year"));
        String month = request.getParameter("month");

        SalaryCalculate Scal = new SalaryCalculate();
        Salary s1 = new Salary();
        ISalary iSalary2 = new ISalaryImp();

        int no = Scal.empCount(month, y);
        //   out.print(no);

        //    int ArrayID[] = null;
        int ArrayID[] = Scal.id(month, y, no);

        /*  for (int i = 0; i < no; i++) {
         out.println(ArrayID[i]);
         }*/
        for (int i = 0; i < no; i++) {

            double ot = Scal.CalOtSalary(month, y, ArrayID[i]);
            double nopay = Scal.nopay(ArrayID[i]);
            double grossSalary = Scal.grossSalary();
            double epf = Scal.epf();
            double BalanceSalary = Scal.BalanceSalary();
            double grossAmount = Scal.grossAmount();
            double netSalary = Scal.netSalary();

            s1.setOt(ot);
            s1.setNopay(nopay);
            s1.setGrossSalary(grossSalary);
            s1.setEpf(epf);
            s1.setBalanceSalary(BalanceSalary);
            s1.setGrossAmount(grossAmount);
            s1.setNetSalary(netSalary);

            iSalary2.updateCalculate(y, month, s1, ArrayID[i]);
        }
        SalaryCalculate Sca = new SalaryCalculate();

        double total = Sca.monthlyTotalSalary(month, y);

        s1.setTotal(total);
        s1.setMonth(month);//comment
        s1.setYear(y);// comment

        //need update or insert ( PLEASE CHECK )
        iSalary2.addTotal(s1/*,y,month*/);

        request.setAttribute("year", y);
        request.setAttribute("month", month);

        request.getRequestDispatcher("/Paysheet.jsp").forward(request, response);
    }
}
