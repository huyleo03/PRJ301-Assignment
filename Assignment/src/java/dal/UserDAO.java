/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author HELLO
 */
public class UserDAO extends DBContext {

    public User get(User model) {
        try {
            String sql = "SELECT username FROM [User]\n"
                    + "WHERE username = ? AND [password] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getUsername());
            stm.setString(2, model.getPassword());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUsername(model.getUsername());
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User insert(User c) {
        String sql = "INSERT INTO [User]\n"
                + "           ([userName]\n"
                + "           ,[password])\n"
                + "     VALUES\n"
                + "           (?,?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getUsername());
            st.setString(2, c.getPassword());
            st.executeUpdate();;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return c;
    }

    public boolean checkExistUsername(String username) {
        String sql = "SELECT * FROM dbo.[User] WHERE userName = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
//    public static void main(String[] args) {
//        User user = new User("giahuy123", "123456");
//        UserDAO dal = new UserDAO();
//        dal.insert(user);
//
//    }
}
