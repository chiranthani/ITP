package service;

import Model.resultcls;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author rushaid
 */

public interface resultinterface {
    
    public void addResult(resultcls  result);
    
    public String updateResult(String resultID,resultcls  result );
    
    public  void deleteResult(String resultID);
   
    
}
