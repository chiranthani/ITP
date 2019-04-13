package service;

import Model.subjectcls;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author jahrin
 */
public interface subjectinterface {
    
      public void addsubject(subjectcls sub);
    
      public String  updatesubject(String subcode, subjectcls sub);
      
      public void deletesubject(String subcode);
    
    
}
