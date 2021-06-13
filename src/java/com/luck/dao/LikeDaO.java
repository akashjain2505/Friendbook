
package com.luck.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class LikeDaO {
    public boolean insertLike(int sender, int post){
        
        
    try{
         Connection cnn = DBConnection.getConnection();
            PreparedStatement likePS = cnn.prepareStatement("insert into "
                    + "postlike(sender,post) "
                    + "value(?,?)");
            likePS.setInt(1, sender);
            likePS.setInt(2, post);
           
            
            likePS.executeUpdate();
           
            cnn.close();
    return true;
    }catch(Exception ex){
     System.err.println("like Errro : "+ex.getMessage());
     return false;
    }
    }
    
    public int countLike(int post){
    int count=0;
    
    try{
         Connection cnn = DBConnection.getConnection();
            PreparedStatement CPS = cnn.prepareStatement("select count(*) from postlike where post=?");
                   
           
           CPS.setInt(1, post);
           
            ResultSet set = CPS.executeQuery();
            if(set.next()){
            count = set.getInt("count(*)");
            }
           
          
            cnn.close();
    
    }catch(Exception ex){
     System.err.println("count Errro : "+ex.getMessage());
    }
    
    
    return count;
    }
    
     public boolean isLike(int sender, int post){
        
        boolean f= false;
    try{
         Connection cnn = DBConnection.getConnection();
            PreparedStatement isPS = cnn.prepareStatement("select * from postlike where sender=? and post=?"); 
                              
            isPS.setInt(1, sender);
            isPS.setInt(2, post);
           
            
           ResultSet set = isPS.executeQuery();
           if(set.next())
           {
           f= true;
           }
           
            cnn.close();
    
    }catch(Exception ex){
     System.err.println("like Errro : "+ex.getMessage());
    }
    return f;
    }
    
      public boolean deleteLike(int sender, int post){
        
        boolean f= false;
    try{
         Connection cnn = DBConnection.getConnection();
            PreparedStatement DPS = cnn.prepareStatement("delete from postlike where sender =? and post=?");
                   
            DPS.setInt(1, sender);
            DPS.setInt(2, post);
           
            
            DPS.executeUpdate();
            f=true;
            cnn.close();
    
    }catch(Exception ex){
     System.err.println("delete like Errro : "+ex.getMessage());
    }
    return f;
    }
    
}
