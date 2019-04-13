package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Model.Student;
import java.sql.ResultSet;
import java.sql.Statement;
import util.DBConnection;

public class IStudentServiceImp implements IStudentService {

    int id,id1;
    public static Connection con;
    public static PreparedStatement preparedStatement;
    public static Statement statement = null;
    public static ResultSet resultSet = null;

    @Override
    public void registerStudent(Student stu) {

        String fullname = stu.getFullName();
        String gender = stu.getGender();
        String dob = stu.getDob();
        String address = stu.getAddress();
        String nic = stu.getNic();
        String email = stu.getEmail();
        String contactNo = stu.getContactNo();
        String date = stu.getRegDate();
        String course = stu.getCourse();

        try {
            con = DBConnection.createConnection();
            String query = "insert into student (userID,fullname,gender,dob,address,NIC,regDate,email,contactNum,courseCode) "
                    + "values (NULL,?,?,?,?,?,?,?,?,?)";

            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, fullname);
            preparedStatement.setString(2, gender);
            preparedStatement.setString(3, dob);
            preparedStatement.setString(4, address);
            preparedStatement.setString(5, nic);
            preparedStatement.setString(6, date);
            preparedStatement.setString(7, email);
            preparedStatement.setString(8, contactNo);
            preparedStatement.setString(9, course);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.getMessage();

        } finally {

            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (con != null) {
                    con.close();
                }

            } catch (SQLException e) {
                e.getMessage();
            }
        }
    }

    @Override
    public int getID(String nic) {

        try {

            con = DBConnection.createConnection();
            statement = con.createStatement();

            String s = "select userID FROM student where NIC ='" + nic + "'";

            resultSet = statement.executeQuery(s);

            while (resultSet.next()) {
                id = Integer.parseInt(resultSet.getString("userID"));

            }
        } catch (Exception e) {
        }

        return id;

    }

    @Override
    public void secondStep(Student ss, int id) {

        if (id != 0) {

            String pname = ss.getPname();
            int pcontactno = ss.getPtelphone();
            String occupation =ss.getPoccupation();
            String wpaddress = ss.getWplace();

            try {
                con = DBConnection.createConnection();
                String query1 = "update student set parentName=? ,parentOC=?,p_WorkingPlace=?,w_Telephone=? where userID=" + id;

                preparedStatement = con.prepareStatement(query1);
                preparedStatement.setString(1, pname);
                preparedStatement.setString(2, occupation);
                preparedStatement.setString(3, wpaddress);
                preparedStatement.setInt(4, pcontactno);

                preparedStatement.executeUpdate();

            } catch (SQLException e) {
                e.printStackTrace();

            } finally {

                try {
                    if (preparedStatement != null) {
                        preparedStatement.close();
                    }
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException e) {
                    e.getMessage();
                }
            }

        }

    }

    @Override
    public void createAccount(Student s1) {

        String uType = s1.getuType();
        String userID = s1.getUserId();
        String username = s1.getUsername();
        String password = s1.getPassword();
        try {
            con = DBConnection.createConnection();
            String query = "insert into login (userID,userName,userType,password) values (?,?,?,?) ";

            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, userID);
            preparedStatement.setString(2, username);
            preparedStatement.setString(3, uType);
            preparedStatement.setString(4, password);
            
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.getMessage();

        } finally {

            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (con != null) {
                    con.close();
                }

            } catch (SQLException e) {
                e.getMessage();
            }
        }
    }
    
    public void deleteStudent(String userID){  		
			if (userID != null) {
	
			try{ 
				con = DBConnection.createConnection();
				String sql1="DELETE FROM student WHERE userID='"+userID+"'";
				
				preparedStatement = con.prepareStatement(sql1);
				preparedStatement.executeUpdate();				
				
			} catch (SQLException e) {
					e.getMessage();
				} finally {
			
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (con != null) {
						con.close();
					}
				} catch (SQLException e) {
					 e.getMessage();
				}
			}
		}
      
      }
        public boolean loginCheck(String sid, String pass, String utype){
            
            String sql = "select * from login where userName= ? AND password = ? AND userType=?";
           
            
            try{
                con = DBConnection.createConnection();
                PreparedStatement st = con.prepareStatement(sql);
                st.setString(1, sid);
                st.setString(2, pass);
                st.setString(3, utype);
                
                ResultSet rs = st.executeQuery();
                
      		if(rs.next())
		{
                    return true;
		}
                
                }catch(Exception e){
                        e.printStackTrace();
		}
		return false;
		
            }
        
    public int getSessionID(String uname, String pass , String utype){
        		
		
		
		try
		{
			con = DBConnection.createConnection();	
			statement=con.createStatement();
			String sql1 =" select userID  from login where ( userName='" + uname + "') AND (password ='" + pass + "') AND (userType ='" + utype + "') ";
			
			resultSet = statement.executeQuery(sql1);
			while(resultSet.next()) {
				id1 = Integer.parseInt(resultSet.getString("userID"));
			}
		
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return id1;
        }
    public String updateStudent(String user, Student c) {
		
		Connection con = null;
		PreparedStatement statement = null;

		
		if(user != null) {
			
			String fullName = c.getFullName();
			String  address = c.getAddress();
			String contactNumber = c.getContactNo();
			String email = c.getEmail();
                        String pname = c.getPname();
                        String wpaddress = c.getWplace();
                        int pcontactno = c.getPtelphone();
			
			
			try {
				
				con = DBConnection.createConnection();
				String sq = "update student set userID=?, fullname=?,address=?,email=?,contactNum=?,parentName=?,p_WorkingPlace=?,w_Telephone=? where userID='"+user+"'";
			
				statement = con.prepareStatement(sq);
				statement.setString(1, user);
				statement.setString(2, fullName);
				statement.setString(3, address);
				statement.setString(4, email);
				statement.setString(5, contactNumber);
                                statement.setString(6, pname);
                                statement.setString(7, wpaddress);
                                statement.setInt(8, pcontactno);
				
				statement.executeUpdate();
			
			
			}			
			
		 catch (SQLException e) {
			e.getMessage();
		} finally {
	
		try {
			if (statement != null) {
				statement.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			 e.getMessage();
		}
		}
	}

		return user;
	}

     public void addFeedback(Student student) {
            
                String id =student.getUserId();
                String course = student.getCourse();
                String description = student.getFeedDescription();
                String date = student.getRegDate();

                try{
                    con=DBConnection.createConnection();
                    String query7 = "insert into studentfeedback(feedbackID,userID,course,description,Date) values(NULL,?,?,?,?)";

                    preparedStatement = con.prepareStatement(query7);
                    
                    preparedStatement.setString(1, id);
                    preparedStatement.setString(2, course);
                    preparedStatement.setString(3,description);
                    preparedStatement.setString(4,date);

                    preparedStatement.executeUpdate();
                }
                catch(SQLException e){
                        e.getMessage();
                }
                finally{
                    try{
                        if(preparedStatement != null){
                            preparedStatement.close();
                        }
                        if(con != null){
                            con.close();
                        }
                    }catch(SQLException e){
                            e.getMessage();
                        }
                }
    }    
}
