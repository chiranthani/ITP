package service;

import Model.Student;

public interface IStudentService {

	public void registerStudent(Student stu);
	
	public void secondStep(Student ss,int id);
        
        public int getID(String nic);
        
        public void createAccount(Student s1);
        
        public void deleteStudent(String userID);

        public boolean loginCheck(String sid, String pass,String utype);

        public int getSessionID(String sid, String pass,String utype);
	
	public String updateStudent(String userID,Student st);

       public void addFeedback(Student student);
	
}
