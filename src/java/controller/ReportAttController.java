/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AttandanceDBContext;
import dal.GroupDBConntext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.Attandance;
import model.Group;
import model.Role;
import model.Session;
import model.Student;

/**
 *
 * @author bacht
 */
public class ReportAttController extends HttpServlet {

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
            if (role.getId() == 2) {
                int gid;
                try {
                    gid = Integer.parseInt(request.getParameter("gid"));
                    GroupDBConntext groupDB = new GroupDBConntext();
                    Group group = groupDB.get(gid);
                    ArrayList<Student> students = group.getStudents();
                    ArrayList<Session> sess = group.getSessions();
                    AttandanceDBContext attDB = new AttandanceDBContext();

                    for (int i = 0; i < sess.size(); i++) {
                        ArrayList<Attandance> atts = attDB.getAttsBySessionId(sess.get(i).getId());
                        sess.get(i).setAttandances(atts);
                    }

                    request.setAttribute("group", group);
                    request.setAttribute("sess", sess);
                    request.setAttribute("size", sess.size());
                    request.setAttribute("students", students);
                    String mess = "";
                    switch (gid) {
                        case 1:
                            mess = "PRJ301-01";
                            break;
                        case 2:
                            mess = "PRJ301-02";
                            break;
                        case 3:
                            mess = "PRJ301-03";
                            break;
                        default:
                            mess = "PRO192-01";
                            break;
                    }
                    request.setAttribute("gid", gid);
                    request.setAttribute("mess", mess);
                } catch (Exception e) {
                }

                request.getRequestDispatcher("view/reportatt.jsp").forward(request, response);
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
    }

}
