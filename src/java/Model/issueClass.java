package Model;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author rashmini
 */
public class issueClass {
    
          String Sid;
          String ISBN_num;
          String issueDate;
          String expiryDate;
          String returnDate;
          
          
          
          public String getSid(){
                  return Sid;      
          }
          
          public void setSid(String Sid){
              this.Sid =Sid;
          
          }
          
          public String getISBN_num(){
              return ISBN_num;
          }
          
          public void setISBN_num(String ISBN_num){
              this.ISBN_num = ISBN_num;
          }
          
          public String getissueDate(){
                    return issueDate;
          }
          
          public void setissueDate(String issueDate){
              
              this.issueDate = issueDate;
          }
          
          public String getexpiryDate(){
                    return expiryDate;
          }
          
          public void setexpiryDate(String expiryDate){
              
              this.expiryDate = expiryDate;
          
          }
          
          public String getreturnDate(){
                    return returnDate;
          }
          
          public void setreturnDate(String returnDate){
              
              this.returnDate = returnDate;
          
          }
    
}
