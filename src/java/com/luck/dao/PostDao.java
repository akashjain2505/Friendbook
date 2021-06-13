/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.luck.dao;

import com.luck.dto.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author VSMPRS
 */
public class PostDao {
    
    public boolean savePost(int uid,String caption,String pic)
    {
        try 
        {
            Connection cnn = DBConnection.getConnection();
            PreparedStatement saveUserPS = cnn.prepareStatement("insert into "
                    + "post(sender,caption,pic) "
                    + "value(?,?,?)");
            saveUserPS.setInt(1,uid);
            saveUserPS.setString(2,caption);
             saveUserPS.setString(3,pic);
           
            
            saveUserPS.executeUpdate();
            cnn.close();
            return true;
            
        } catch (Exception ex) 
        {
            System.err.println("Save User Errro : "+ex.getMessage());
            return false;
        }        
    }
    
    public List<Post> getAllPosts(){
    
        List<Post> list = new ArrayList<>();
        
          try 
        {
            Connection cnn = DBConnection.getConnection();
            PreparedStatement PS = cnn.prepareStatement("Select * from post order by sendDate desc");
                   
          
            
            ResultSet rs = PS.executeQuery();
            
            while(rs.next()){
             int post_id = rs.getInt("post_id");
             int sender = rs.getInt("sender");
             String sendDate= rs.getString("sendDate");
                String caption = rs.getString("caption");
                 String pic = rs.getString("pic");
                
                 Post po = new Post(post_id, sender, sendDate, caption, pic);
                 list.add(po);
            
            }
            
            cnn.close();
         
            
        } catch (Exception ex) 
        {
            System.err.println("Post Display Errro : "+ex.getMessage());
           
        }        
        
        return list;
    }
    
     public List<Post> getMyPost(int sender){
    
        List<Post> list = new ArrayList<>();
        
          try 
        {
            Connection cnn = DBConnection.getConnection();
            PreparedStatement PS = cnn.prepareStatement("Select * from post where sender=? order by sendDate desc ");
                   
          PS.setInt(1, sender);
            
            ResultSet rs = PS.executeQuery();
            
            while(rs.next()){
             int post_id = rs.getInt("post_id");
             
             String sendDate= rs.getString("sendDate");
                String caption = rs.getString("caption");
                 String pic = rs.getString("pic");
                
                 Post po = new Post(post_id, sender, sendDate, caption, pic);
                 list.add(po);
            
            }
            
            cnn.close();
         
            
        } catch (Exception ex) 
        {
            System.err.println("Post Display Errro : "+ex.getMessage());
           
        }        
        
        return list;
    }
    
}
