/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.luck.controller;

import com.luck.dao.UserDao;
import com.luck.dto.User;
import com.luck.helper.MailService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author VSMPRS
 */
@WebServlet(name = "CemailServlet", urlPatterns = {"/Cemail"})
public class CemailServlet extends HttpServlet {

     private int getOTP() 
    {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);    
        return number;
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         User user = (User)request.getSession().getAttribute("loginuser");
            
            int userid = user.getUser_id();
            String email = request.getParameter("email");
            
            
            MailService ms = new MailService();
            int otp = getOTP();
            ms.sendVerifyMail(email,user.getName(),otp);
            
            User us = new User(userid, email);
            us.setOtp(otp);
             
              UserDao dao = new UserDao();
            boolean status = dao.updateMail(us);
            
            if(status)
            {
                user.setEmail(email);
               user.setIs_Verify(0);
               user.setOtp(otp);
               
                HttpSession s = request.getSession();
                s.removeAttribute("loginuser");
                response.sendRedirect("verify.jsp");
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
