package service;

import Model.examcls;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author rushaid
 */

public interface examiinterface {
    
    public void addExam(examcls  exam );
    
    public String updateExam(String examCode,examcls  exam );
    
    public  void deleteExam(String examCode);
   
    
}
