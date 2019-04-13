package service;

import Model.libraryClass;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author rashmini
 */

public interface libraryinterface {
    
    public void  addLibrary(libraryClass lib, int available );
    
    public String  updateLibrary(String ISBN_num,libraryClass  lib );
    
    public  void deleteLibrary(String ISBN_num);
   
   
    
}