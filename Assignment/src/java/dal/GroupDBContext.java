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
import model.Group;
import model.Subject;

/**
 *
 * @author HELLO
 */
public class GroupDBContext extends DBContext {

    public int getGroupIdByName(String groupName) {
        int groupId = -1;
        String sql = "SELECT gid FROM [Group] WHERE gname = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, groupName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                groupId = rs.getInt("gid");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return groupId;
    }

    public int getGroupIdByUsername(String username) {
        int groupId = -1;
        String sql = "SELECT g.gId\n"
                + "FROM [Group] g\n"
                + "JOIN [User] u ON g.sup_iis = u.id\n"
                + "WHERE u.username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                groupId = rs.getInt("gid");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return groupId;
    }

    public List<Group> getClassesTaughtByInstructor(int instructorId) {
        List<Group> classesTaught = new ArrayList<>();
        String sql = "SELECT gid, gname, subid FROM [Group] WHERE sup_iis = ?"; // Sử dụng dấu ngoặc vuông
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, instructorId);
            rs = st.executeQuery();
            while (rs.next()) {
                Group group = new Group();
                group.setId(rs.getInt("gid"));
                group.setName(rs.getString("gname"));
                Subject subject = new Subject();
                subject.setId(rs.getInt("subid"));
                group.setSubject(subject);
                classesTaught.add(group);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng ResultSet và PreparedStatement nếu chúng không null
            if (rs != null) try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (st != null) try {
                st.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return classesTaught;
    }
    

//    public static void main(String[] args) {
//        GroupDBContext db = new GroupDBContext();
//        List list = db.getClassesTaughtByInstructor(1);
//        System.out.println(list);
//
//    }
}
