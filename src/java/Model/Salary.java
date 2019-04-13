package Model;

public class Salary {

    private int empNo;
    private String month;
    private int year;
    private double bonus;
    private double basic;
    private double deduction;
    private double festival;
    private double ot;
    private double nopay;
    private double grossSalary;
    private double epf;
    private double total;
    
    

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getEpf() {
        return epf;
    }

    public double getBonus() {
        return bonus;
    }

    public void setBonus(double bonus) {
        this.bonus = bonus;
    }

    public double getBasic() {
        return basic;
    }

    public void setBasic(double basic) {
        this.basic = basic;
    }

    public double getDeduction() {
        return deduction;
    }

    public void setDeduction(double deduction) {
        this.deduction = deduction;
    }

    public double getFestival() {
        return festival;
    }

    public void setFestival(double festival) {
        this.festival = festival;
    }

    public void setEpf(double epf) {
        this.epf = epf;
    }

    public String getMonth() {
        return month;
    }
    private double BalanceSalary;

    public double getOt() {
        return ot;
    }

    public void setOt(double ot) {
        this.ot = ot;
    }

    public double getNopay() {
        return nopay;
    }

    public void setNopay(double nopay) {
        this.nopay = nopay;
    }

    public double getGrossSalary() {
        return grossSalary;
    }

    public void setGrossSalary(double grossSalary) {
        this.grossSalary = grossSalary;
    }

    public double getBalanceSalary() {
        return BalanceSalary;
    }

    public void setBalanceSalary(double BalanceSalary) {
        this.BalanceSalary = BalanceSalary;
    }

    public double getGrossAmount() {
        return grossAmount;
    }

    public int getEmpNo() {
        return empNo;
    }

    public void setEmpNo(int empNo) {
        this.empNo = empNo;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public void setGrossAmount(double grossAmount) {
        this.grossAmount = grossAmount;
    }

    public double getNetSalary() {
        return netSalary;
    }

    public void setNetSalary(double netSalary) {
        this.netSalary = netSalary;
    }
    private double grossAmount;
    private double netSalary;

    public void setMonth(String month) {
        this.month = month;
    }

}
