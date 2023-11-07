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
import model.Subject;

/**
 *
 * @author HELLO
 */
public class SubjectDAO extends DBContext {

    public List<String> getSubjectNamesByInstructorId(int instructorId) {

        List<String> subjectNames = new ArrayList<>();

        String sql = "SELECT s.subname "
                + "FROM [Group] g JOIN Subject s ON g.subid = s.subid "
                + "WHERE g.sup_iis = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, instructorId);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String subjectName = rs.getString("subname");
                subjectNames.add(subjectName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return subjectNames;
    }

    public String getSubjectName(int subId) {

        String subjectName = "";

        String sql = "SELECT subname FROM Subject WHERE subid = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                subjectName = rs.getString("subname");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return subjectName;
    }

    public List<Subject> getSubjectAndGroupName(int instructorId) {

        List<Subject> subjects = new ArrayList<>();

        String sql = "SELECT s.subname, g.gname "
                + "FROM [Group] g JOIN Subject s ON g.subid = s.subid "
                + "WHERE g.sup_iis = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, instructorId);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                Subject sub = new Subject();

                sub.setName(rs.getString("subname"));
                sub.setName(rs.getString("gname"));

                subjects.add(sub);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return subjects;

    }

}
