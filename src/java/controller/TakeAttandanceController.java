/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AttandanceDBContext;
import dal.SessionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.Attandance;
import model.Role;
import model.Session;
import model.Student;

/**
 *
 * @author bacht
 */
public class TakeAttandanceController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        if (a == null) {
            response.sendRedirect("login");
        }
        ArrayList<Role> roles = (ArrayList<Role>) session.getAttribute("roles");
        for (Role role : roles) {
            if (role.getId() == 1) {
                int sesid;
                try {
                    sesid = Integer.parseInt(request.getParameter("id"));
                    AttandanceDBContext attDB = new AttandanceDBContext();
                    ArrayList<Attandance> atts = attDB.getAttsBySessionId(sesid);
                    request.setAttribute("atts", atts);

                    SessionDBContext sesDB = new SessionDBContext();
                    Session ses = sesDB.get(sesid);
                    request.setAttribute("ses", ses);
                } catch (Exception e) {
                }
                request.getRequestDispatcher("view/takeattandance.jsp").forward(request, response);
            } else {
                response.getWriter().println("Access denid!!");
            }
        }
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
        Session ses = new Session();
        ses.setId(Integer.parseInt(request.getParameter("sesid")));

        String[] stdids = request.getParameterValues("stdid");
        for (String stdid : stdids) {
            Attandance a = new Attandance();
            Student s = new Student();
            a.setStudent(s);
            a.setSession(ses);
            s.setId(Integer.parseInt(stdid));
            a.setPresent(request.getParameter("present" + stdid).equals("present"));
            a.setDescription(request.getParameter("description" + stdid));
            ses.getAttandances().add(a);
        }

        SessionDBContext db = new SessionDBContext();
        db.updateAttandance(ses);
        response.sendRedirect("takeattandance?id=" + ses.getId());
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold
}
