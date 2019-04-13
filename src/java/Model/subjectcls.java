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
public class subjectcls {
    
          String subcode;
          String subname;
          String coursecode;
          
          
          public String getSubjectCode(){
                  return subcode;      
          }
          
          public void setSubjectCode(String subcode){
              this.subcode =subcode;
          
          }
          
          public String getSubjectName(){
              return subname;
          }
          
          public void setSubjectName(String subname){
              this.subname = subname;
          }
          
          public String getCoursecode(){
                    return coursecode;
          }
          
          public void setCoursecode(String coursecode){
              
              this.coursecode = coursecode;
          
          }
    
}
