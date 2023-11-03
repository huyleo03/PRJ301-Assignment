/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Group;
import model.User;
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
            if(rs.next()){
                groupId = rs.getInt("gid");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return groupId;
    }
    public static void main(String[] args) {
        GroupDBContext db = new GroupDBContext();
        int id = db.getGroupIdByUsername("sonnt");
        System.out.println(id);
        
}
    }