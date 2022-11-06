/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse; 
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;

/**
 *
 * @author bacht
 */
public class LoginController extends HttpServlet {
    

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
         HttpSession session =request.getSession();
         if(session.getAttribute("account")!=null){
             response.sendRedirect("home");
         }
        request.getRequestDispatcher("./view/login.jsp").forward(request, response);
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
         String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String r = request.getParameter("remember");
        AccountDBContext db = new AccountDBContext();
        Account account = db.get(user, pass);
        
        if(account == null){
            response.getWriter().println("login failed!");         
        }if(account != null){
            request.getSession().setAttribute("account", account);

            Cookie username = new Cookie("user", user);
            Cookie password = new Cookie("pass",pass);
            Cookie rem = new Cookie("remember",r);
            if(r == null ){
                username.setMaxAge(0);
                password.setMaxAge(0);
                rem.setMaxAge(0);
            }else{
                username.setMaxAge(60 * 60);// 1h
                password.setMaxAge(60 * 60); // 1h
                rem.setMaxAge(60*60); // 1h
            }
            response.addCookie(username);
            response.addCookie(password);
            response.addCookie(rem);
            request.getSession().setAttribute("account", account);
            response.sendRedirect("home");
    }
 
}
}