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
import model.StudentAttendance;

/**
 *
 * @author HELLO
 */
public class AttendanceReportDBContext extends DBContext {

    public List<StudentAttendance> getAttendanceReport(int groupId) {
        List<StudentAttendance> reportList = new ArrayList<>();
        String sql = "SELECT "
                + "    s.stuid, "
                + "    s.stuname, "
                + "    SUM(CASE WHEN a.status = 1 THEN 1 ELSE 0 END) AS total_present, "
                + "    SUM(CASE WHEN a.status = 0 THEN 1 ELSE 0 END) AS total_absent, "
                + "    STRING_AGG(CAST(se.sesid AS VARCHAR(MAX)), ', ') WITHIN GROUP (ORDER BY se.sesid) AS session_ids, "
                + "    STRING_AGG(CASE WHEN a.status = 0 THEN CAST(se.sesid AS VARCHAR(MAX)) ELSE NULL END, ', ') WITHIN GROUP (ORDER BY se.sesid) AS absentSessionIds, "
                + "    (100.0 * SUM(CASE WHEN a.status = 0 THEN 1 ELSE 0 END) / COUNT(se.sesid)) AS absence_rate "
                + "FROM "
                + "    Student s "
                + "JOIN "
                + "    Group_Student gs ON s.stuid = gs.stuid "
                + "JOIN "
                + "    Session se ON gs.gid = se.gid "
                + "LEFT JOIN "
                + "    Attendance a ON s.stuid = a.stuid AND se.sesid = a.sesid "
                + "WHERE "
                + "    gs.gid = ? "
                + "GROUP BY "
                + "    s.stuid, s.stuname";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, groupId);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                StudentAttendance attendance = new StudentAttendance();
                attendance.setStudentId(rs.getInt("stuid"));
                attendance.setStudentName(rs.getString("stuname"));
                attendance.setTotalPresent(rs.getInt("total_present"));
                attendance.setTotalAbsent(rs.getInt("total_absent"));
                attendance.setSessionIds(rs.getString("session_ids"));
                attendance.setAbsentSessionIds(rs.getString("absentSessionIds"));
                // Set the absenceRate from the ResultSet
                attendance.setAbsenceRate(rs.getDouble("absence_rate"));
                reportList.add(attendance);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reportList;
    }

}
