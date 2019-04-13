package service;

import Model.Salary;
import java.util.ArrayList;

public interface ISalary {

    public String AddBasicSalary(Salary s);

    public String addBonusSalary(int y, String type, String month, String advance, Salary sa);

    public String updateSalary(int eid, Salary salary);

    public String deleteSalary(int eid, int year, String month);

    public void updateCalculate(int year, String month, Salary sal1, int id);

    public void addTotal(Salary sa/*,int year,String month*/);

    public ArrayList<ArrayList<String>> searchPaysheet(int year, String m);
}
