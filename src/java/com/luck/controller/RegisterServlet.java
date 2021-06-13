/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.luck.controller;

import com.luck.dao.UserDao;
import com.luck.dto.User;
import com.luck.dto.Message;
import com.luck.helper.MailService;
import com.luck.helper.Picture;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author VSMPRS
 */
@MultipartConfig
@WebServlet(name = "RegisterServlet", urlPatterns = {"/Register"})
public class RegisterServlet extends HttpServlet {

     UserDao dao = new UserDao();
    private int getOTP() 
    {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);    
        return number;
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("check");
        String check = request.getParameter("check");
        if(check==null){
             Message msg = new Message("please check box");
               HttpSession s= request.getSession();
               s.setAttribute("msg1", msg);
               response.sendRedirect("register.jsp");
           
        }
        
        else{
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
            Part part = request.getPart("profile_pic");
        String profile_pic = part.getSubmittedFileName();
        
        
            
            
            MailService ms = new MailService();
            int otp = getOTP();
            ms.sendVerifyMail(email,name,otp);
            
            User user = new User(name, email, password, mobile, profile_pic);
            user.setOtp(otp);
            
            
            
            boolean status = dao.saveUser(user);
            System.out.println(status);
            
            if(status){
                 String path = request.getRealPath("/")+"picsss"+File.separator+user.getProfile_pic();
               if(Picture.saveFile(part.getInputStream(), path))
               {
                   System.out.println("aagyi picture");
               }
            response.sendRedirect("verify.jsp");
            }
            else
            {
                Message msg = new Message("Sorry! Register Again");
               HttpSession s= request.getSession();
               s.setAttribute("msg", msg);
               response.sendRedirect("register.jsp");
               
            }
        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
