/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.AttendanceReport;
import model.IBaseModel;

/**
 *
 * @author HELLO
 */
public class AttendanceReportDBContext extends DBContext {

    public List<AttendanceReport> getAttendanceReport(int groupId) {
        List<AttendanceReport> reports = new ArrayList<>();
        String sql = "SELECT\n"
                + "  s.stuid,\n"
                + "  s.stuname,\n"
                + "  se.sesid, \n"
                + "  se.date,\n"
                + "  CASE WHEN a.status = 1 THEN 'Attend' ELSE 'Absence' END AS attendance_status,\n"
                + "  COUNT(CASE WHEN a.status = 1 THEN 1 END) AS total_present,\n"
                + "  COUNT(CASE WHEN a.status = 0 THEN 1 END) AS total_absent\n"
                + "FROM Student s\n"
                + "INNER JOIN Group_Student gs ON s.stuid = gs.stuid  \n"
                + "INNER JOIN Session se ON se.gid = gs.gid\n"
                + "LEFT JOIN Attendance a ON s.stuid = a.stuid AND se.sesid = a.sesid\n"
                + "WHERE gs.gid = ?\n"
                + "GROUP BY s.stuid, s.stuname, se.sesid, se.date, a.status  \n"
                + "ORDER BY s.stuid, se.date, se.sesid";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, groupId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                AttendanceReport report = new AttendanceReport();
                report.setStudentId(rs.getInt("stuid"));
                report.setStudentName(rs.getString("stuname"));
                report.setSessionId(rs.getInt("sesid"));
                report.setDate(rs.getDate("date"));
                report.setStatus(rs.getString("attendance_status"));
                report.setTotalPresent(rs.getInt("total_present"));
                report.setTotalAbsent(rs.getInt("total_absent"));
                reports.add(report);
            }
        } catch (SQLException e) {
        }
        return reports;
    }
}
