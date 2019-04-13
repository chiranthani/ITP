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
public class libraryClass {
    
   private String ISBN_num;
   private String name;
   private String authorName;
   private float price;
   private float edition;
   private String subject;

    public String getISBN_num() {
        return ISBN_num;
    }

    public void setISBN_num(String ISBN_num) {
        this.ISBN_num = ISBN_num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getEdition() {
        return edition;
    }

    public void setEdition(float edition) {
        this.edition = edition;
    }

   
    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

   
  
}
