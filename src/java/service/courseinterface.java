package service;

import Model.coursecls;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author jahrin
 */
public interface courseinterface {

    public void addCourse(coursecls course);

    public String updateCourse(String coursecode, coursecls course);

    public void deleteCourse(String coursecode);

    public String Check(String code);
}
