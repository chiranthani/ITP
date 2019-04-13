package service;

import Model.issueClass;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DBConnection;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author rashmini
 */
public class issueAdd implements issueinterface {

    public Connection con;
    public static PreparedStatement preparedStatement;

    @Override
    public void addissue(issueClass is) {

        String Sid = is.getSid();
        String ISBN_num = is.getISBN_num();
        String issueDate = is.getissueDate();
        String expiryDate = is.getexpiryDate();

        try {

            con = DBConnection.createConnection();
            String query;
            query = "insert into issueresource (sid,ISBN_num,issueDate,expiryDate) values (?,?,?,?) ";

            preparedStatement = con.prepareStatement(query);

            preparedStatement.setString(1, Sid);
            preparedStatement.setString(2, ISBN_num);
            preparedStatement.setString(3, issueDate);
            preparedStatement.setString(4, expiryDate);

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

    @Override
    public String updateissue(String Sid, String returnDate,String ISBN_num,String issueDate) {

        if (Sid != null) {

            try {
                con = DBConnection.createConnection();

                String query = "Update issueresource set  returnDate=? where (sid ='" + Sid + "') AND (ISBN_num='" + ISBN_num + "') AND (issueDate ='" + issueDate + "')";
                preparedStatement = con.prepareStatement(query);

                preparedStatement.setString(1, returnDate);

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
        return Sid;

    }

    @Override
    public void deleteissue(String Sid) {

        if (Sid != null) {

            try {
                con = DBConnection.createConnection();

                String query = "delete from issueResource where  sid = '" + Sid + "'";

                preparedStatement = con.prepareStatement(query);

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
    
    
      @Override
    public void updateAvailability(int available,String ISBN_num ) {
        
         if (ISBN_num != null) {

            try {
                con = DBConnection.createConnection();

                String query = "Update libraryresources set Availability=? where ISBN_num='" + ISBN_num + "'";
                preparedStatement = con.prepareStatement(query);

                preparedStatement.setInt(1,available);

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

}
