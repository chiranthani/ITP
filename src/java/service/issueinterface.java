package service;

import Model.issueClass;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author rashmini
 */
public interface issueinterface {

    public void addissue(issueClass ic);

    public String updateissue(String Sid, String ic, String ISBN_num, String issueDate);

    public void deleteissue(String Sid);

    public void updateAvailability(int available, String ISBN_num);

}
