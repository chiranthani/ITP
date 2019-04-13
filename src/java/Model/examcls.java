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
public class examcls {
    
    String examCode;
    String batch;
    String examType;
    String examDate;
    String examTime;
    String duration;
    String subjectCode;
  
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
    
    public  String getbatch(){
         return batch;  
    }
    
    public void setBatch(String batch){
        this.batch = batch;
    }
    
    public String  getexamType(){
        return examType;
    }
    
    public void setExamType(String examType){
       this.examType = examType;
    }
    
    public String getexamDate(){
      return examDate;
    }
    public void setExamDate(String examDate){
      this.examDate = examDate;
    }
    
    public String getexamTime(){
      return examTime;
    }
    public void setExamTime(String examTime){
      this.examTime = examTime;
    }
    
    public String  getduration(){
       return duration;
       
    }
    public void setDuration(String duration  ){
       this.duration = duration;
    }
    
    public String getsubjectCode(){
       return subjectCode;
    }
    
    public void setSubjectCode(String subjectCode){
       this.subjectCode = subjectCode;
    }
    
  
}
