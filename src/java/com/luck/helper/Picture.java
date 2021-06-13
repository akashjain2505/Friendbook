/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.luck.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 *
 * @author VSMPRS
 */
public class Picture {
    
    
    public static boolean saveFile(InputStream is ,String path){
    
        boolean f = false;
        try{
        
            byte b[] = new byte[is.available()];
            is.read(b);
            
            File file = new File(path);
            
            
            try (FileOutputStream fos = new FileOutputStream(file)) {
                fos.write(b);
                
                fos.flush();
            }
            f = true;
        }catch(IOException ex)
        {
        System.err.println("Update User Errro : "+ex.getMessage());
        }
        return f;
    }
    
}
