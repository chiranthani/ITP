/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Model;

/**
 *
 * @author Ganeesha
 */
public class EmpAttendance {
    
    private int empNo;
    private int year;
    private String month;
    private int date;
    private String Atime,Ltime;
    private int otHours,otMin;

    public String getLType() {
        return LType;
    }

    public void setLType(String LType) {
        this.LType = LType;
    }

    public float getDays() {
        return days;
    }

    public void setDays(float days) {
        this.days = days;
    }

    public String getDate2() {
        return date2;
    }

    public void setDate2(String date2) {
        this.date2 = date2;
    }
    private String LType;
    private float days;
    private String date2;
    
    public String getLtime() {
        return Ltime;
    }

    public void setLtime(String Ltime) {
        this.Ltime = Ltime;
    }

    public int getOtHours() {
        return otHours;
    }

    public void setOtHours(int otHours) {
        this.otHours = otHours;
    }

    public int getOtMin() {
        return otMin;
    }

    public void setOtMin(int otMin) {
        this.otMin = otMin;
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

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public int getDate() {
        return date;
    }

    public void setDate(int date) {
        this.date = date;
    }

    public String getAtime() {
        return Atime;
    }

    public void setAtime(String Atime) {
        this.Atime = Atime;
    }
    
    
    
}
