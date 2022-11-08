/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AttandanceDBContext;
import dal.GroupDBConntext;
import dal.SessionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import model.Attandance;
import model.Group;
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
            
            Map<Integer, Double> map = new HashMap<>();
            for (Student student : students) {
                double ab = 0;
                double count_absent = 0;
                double count_slost = 0;
                for (int i = 1; i < sess.size(); i++) {
                    ArrayList<Attandance> atts = attDB.getAttsBySessionId(sess.get(i).getId());
                    sess.get(i).setAttandances(atts);
                    for (Attandance att : atts) {
                        count_slost++;
                        if (att.isPresent() == false) {
                            count_absent++;
                        }
                    }
                }
                ab = Math.round(count_absent / count_slost * 100);
                map.put(student.getId(), ab);
            }
            
            request.setAttribute("group", group);
            request.setAttribute("map", map);
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
