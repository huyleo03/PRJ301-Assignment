/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
        String sql = "SELECT s.stuid, s.stuname, "
                + "COUNT(CASE WHEN a.status = 1 THEN 1 END) AS total_present, "
                + "COUNT(CASE WHEN a.status = 0 THEN 1 END) AS total_absent "
                + "FROM Student s "
                + "INNER JOIN Group_Student gs ON s.stuid = gs.stuid "
                + "LEFT JOIN Attendance a ON s.stuid = a.stuid "
                + "INNER JOIN Session se ON a.sesid = se.sesid "
                + "WHERE gs.gid = ? AND se.gid = ? "
                + "GROUP BY s.stuid, s.stuname";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, groupId);
            st.setInt(2, groupId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                AttendanceReport report = new AttendanceReport();
                report.setStudentId(rs.getInt("stuid"));
                report.setStudentName(rs.getString("stuname"));
                report.setTotalPresent(rs.getInt("total_present"));
                report.setTotalAbsent(rs.getInt("total_absent"));
                reports.add(report);
            }
        } catch (Exception e) {
        }
        return reports;
    }
}
