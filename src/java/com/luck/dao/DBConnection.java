
package com.luck.dao;



   

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection 
{
    public static Connection getConnection() throws ClassNotFoundException, SQLException, IllegalAccessException, InstantiationException
    {
        Class.forName("com.mysql.jdbc.Driver");
       
       
        Connection cnn = DriverManager.getConnection("jdbc:mysql://localhost:3306/friendbook","root","");
        if(cnn==null){
            System.out.println("nhi aaya");
        }
        return cnn;
    }
}


