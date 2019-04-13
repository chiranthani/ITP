package service;

import Model.examstudentcls;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author rushaid
 */

public interface studentinterface {
    
    public void addStudent(examstudentcls  student);
    
    public String updateStudent(String examCode,examstudentcls  student );
    
    public  void deleteStudent(String examCode);
   
    
}
