package Model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author rushaid
 */
public class examstudentcls {
    
    String examCode;
    String[] attending;
 
    /**
     *
     * @return
     */
    public String getexamCode(){
        return examCode;
    }
    
    public void setExamCode(String examCode){
        this.examCode= examCode;
    }
    
     public String[] getStudentsArray(){
        return attending;
    }
    

    public void setStudents(String[] attending) {
        this.attending = attending;
    }
}