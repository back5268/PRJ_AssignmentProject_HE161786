/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attandance;
import model.Session;
import model.Student;

/**
 *
 * @author bacht
 */
public class AttandanceDBContext extends DBContext<Attandance> {
    
    public ArrayList<Attandance> getAttsBySessionId(int sesid) {
        ArrayList<Attandance> atts = new ArrayList<>();
        try {
            String sql = "SELECT std.stdid,std.stdname\n"
                    + "	,ses.sesid\n"
                    + "	,ISNULL(a.present,0) present,ISNULL(a.[description],'') [description]\n"
                    + "			FROM [Session] ses\n"
                    + "			INNER JOIN [Group] g ON ses.gid = g.gid\n"
                    + "			INNER JOIN Student_Group sg ON g.gid = sg.gid\n"
                    + "			INNER JOIN Student std ON std.stdid = sg.stdid\n"
                    + "			LEFT JOIN Attandance a ON a.sesid = ses.sesid AND std.stdid = a.stdid\n"
                    + "WHERE ses.sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Attandance att = new Attandance();
                Student s = new Student();
                att.setStudent(s);
                Session ses = new Session();
                att.setSession(ses);
                att.setPresent(rs.getBoolean("present"));
                att.setDescription(rs.getString("description"));
                s.setId(rs.getInt("stdid"));
                s.setName(rs.getString("stdname"));
                ses.setId(sesid);
                atts.add(att);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttandanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }
    
    @Override
    public void insert(Attandance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Attandance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Attandance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Attandance get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Attandance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
