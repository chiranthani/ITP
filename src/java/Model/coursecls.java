package Model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author jahrin
 */
public class coursecls {
    
   private  String fullname;
   private  String coursecode;
   private  String date;
   private  String subject;
   private  String duration;
   private String fee;
   private String description;
   
    
    /**
     *
     * @return
     */
    public String getName(){
        return fullname;
    
    }
    
    public void setName(String fullname){
        this.fullname= fullname;
    }
    
    public  String getcourseCode(){
         return coursecode;  
    }
    
    public void setCourseCode(String coursecode){
        this.coursecode = coursecode;
    }
    
    public String  getDate(){
        return date;
    }
    
    public void setDate(String date){
       this.date = date;
    }
    
    public String getsubject(){
      return subject;
    }
    public void setSubject(String subject){
           this.subject = subject;
    }
    
    
    public String  getDuration(){
       return duration;
       
    }
    public void setDuration(String duration  ){
       this.duration = duration;
    }
    
    
    public   String getFee(){
     return fee;
  }
    
    public void setFee(String fee){
        this.fee = fee;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

        
  
    
  
}
