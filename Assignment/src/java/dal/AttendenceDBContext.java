/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Student;
import model.Attendance;
import model.Session;

/**
 *
 * @author sonnt
 */
public class AttendenceDBContext extends DBContext<Attendance> {

    public ArrayList<Attendance> getAttendancesBySession(int sesid) {
        ArrayList<Attendance> atts = new ArrayList<>();
        try {
            String sql = "SELECT s.stuid,s.stuname,\n"
                    + "	  ISNULL(a.status,0) as [status]\n"
                    + "	  ,ISNULL(a.description,'') as [description],\n"
                    + "	   ISNULL(a.att_datetime,GETDATE()) as att_datetime\n"
                    + "	  FROM [Session] ses INNER JOIN [Group] g ON g.gid = ses.gid\n"
                    + "   INNER JOIN Group_Student gs ON g.gid = gs.gid\n"
                    + "	  INNER JOIN Student s ON s.stuid = gs.stuid\n"
                    + "	  LEFT JOIN Attendance a ON a.sesid = ses.sesid AND s.stuid = a.stuid\n"
                    + "	  WHERE ses.sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Student s = new Student();
                Session ses = new Session();
                s.setId(rs.getInt("stuid"));
                s.setName(rs.getString("stuname"));
                att.setStudent(s);
                ses.setId(sesid);
                att.setSession(ses);
                att.setStatus(rs.getBoolean("status"));
                att.setDescription(rs.getString("description"));
                att.setDatetime(rs.getTimestamp("att_datetime"));
                atts.add(att);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AttendenceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }

}
