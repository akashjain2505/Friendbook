
package com.luck.dao;
import com.luck.dto.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
//import jdk.nashorn.internal.ir.Symbol;


public class UserDao {
    
     public boolean saveUser(User user)
    {
        try 
        {
            Connection cnn = DBConnection.getConnection();
            if(cnn==null)System.out.println("nhiiiiiiiiiii");
            else System.out.println("yessss");
            PreparedStatement saveUserPS = cnn.prepareStatement("insert into "
                    + "user(name,email,password,mobile,profile_pic,otp) "
                    + "value(?,?,?,?,?,?)");
            saveUserPS.setString(1,user.getName());
            saveUserPS.setString(2,user.getEmail());
            saveUserPS.setString(3,user.getPassword());
             saveUserPS.setString(4,user.getMobile());
            saveUserPS.setString(5,user.getProfile_pic());
            saveUserPS.setInt(6, user.getOtp());
            
            saveUserPS.executeUpdate();
            cnn.close();
            return true;
            
        } catch (Exception ex) 
        {
            System.err.println("Save User Errro : "+ex.getMessage());
            return false;
        }        
    }
     
      public boolean verifyUser(String email, String otp) 
      {
         
        try 
        {
            Connection cnn = DBConnection.getConnection();
            PreparedStatement ps = cnn.prepareStatement("update user set is_Verify=1 where email=? and otp=?");
            ps.setString(1, email);
            ps.setInt(2, Integer.parseInt(otp));
            
            
             ps.executeUpdate();
             
                   
            cnn.close();
            return true;
       
            
        } catch (Exception ex) 
        {
            System.err.println("verify password : "+ex.getMessage());
            return false;
        }
    
      }
            
       public User checkUser(String mail,String password)
    {
        User user = null;
        try {
            Connection cnn = DBConnection.getConnection();
            
            String query = "select * from user where email=? and password=?";
            PreparedStatement loginPS = cnn.prepareStatement(query);
            loginPS.setString(1, mail);
            loginPS.setString(2, password);
            
            ResultSet rs = loginPS.executeQuery();
            
            if(rs.next())
            {
                int user_id = rs.getInt("user_id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String mobile = rs.getString("mobile");
                 String profile_pic = rs.getString("profile_pic");
              
                int is_Verify = rs.getInt("is_Verify");
                
                user = new User(user_id, name, email,mobile , profile_pic, is_Verify);
            }
            
            cnn.close();
            
        } catch (Exception ex) 
        {
            System.err.println("Login Err : "+ex.getMessage());
        }
        return user;
    }
    
        public boolean updateUser(User usr) 
    {
        try 
        {
            Connection cnn = DBConnection.getConnection();
            PreparedStatement saveUserPS = cnn.prepareStatement("update user set name=?,mobile=?,password=? where user_id=?");
            saveUserPS.setString(1,usr.getName());
            saveUserPS.setString(2,usr.getMobile());
            saveUserPS.setString(3,usr.getPassword());
            saveUserPS.setInt(4, usr.getUser_id());
                        
            saveUserPS.executeUpdate();
            cnn.close();
            
            
            return true;
            
        } catch (Exception ex) 
        {
            System.err.println("Update User Errro : "+ex.getMessage());
            return false;
        }        
    }
       public boolean changeUser(int userid,String profile_pic) 
    {
        try 
        {
            Connection cnn = DBConnection.getConnection();
            PreparedStatement saveUserPS = cnn.prepareStatement("update user set profile_pic=? where user_id=?");
            
            saveUserPS.setString(1,profile_pic);
            saveUserPS.setInt(2, userid);
                        
            saveUserPS.executeUpdate();
            cnn.close();
            
            
            return true;
            
        } catch (Exception ex) 
        {
            System.err.println("Update User Errro : "+ex.getMessage());
            return false;
        }        
    }  
       
       public  User getUserByID(int user_id){
       User user = null;
        try {
            Connection cnn = DBConnection.getConnection();
            
            String query = "select * from user where user_id=?";
            PreparedStatement loginPS = cnn.prepareStatement(query);
            loginPS.setInt(1, user_id);
            
            
            ResultSet rs = loginPS.executeQuery();
            
            if(rs.next())
            {
                int userid = rs.getInt("user_id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String mobile = rs.getString("mobile");
                 String profile_pic = rs.getString("profile_pic");
              
                int is_Verify = rs.getInt("is_Verify");
                
                user = new User(user_id, name, email, mobile, profile_pic, is_Verify);
            }
            
            cnn.close();
            
        } catch (Exception ex) 
        {
            System.err.println("Login Err : "+ex.getMessage());
        }
        return user;
       
       }
       public boolean updateMail(User usr) 
    {
        try 
        {
            Connection cnn = DBConnection.getConnection();
            PreparedStatement saveUserPS = cnn.prepareStatement("update user set email=?,is_Verify=0,otp=? where user_id=?");
            saveUserPS.setString(1,usr.getEmail());
           saveUserPS.setInt(2, usr.getOtp());
            saveUserPS.setInt(3, usr.getUser_id());
                        
            saveUserPS.executeUpdate();
            cnn.close();
            
            
            return true;
            
        } catch (Exception ex) 
        {
            System.err.println("Update email Errro : "+ex.getMessage());
            return false;
        }        
    }
        
}
