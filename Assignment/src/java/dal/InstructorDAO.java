/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Instructor;

/**
 *
 * @author HELLO
 */
public class InstructorDAO extends DBContext {

    public Instructor insert(Instructor c) {
        String sql = "INSERT INTO [Instructor]\n"
                + "           ([iname])\n"
                + "     VALUES\n"
                + "           (?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getName());
            st.executeUpdate();;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return c;
    }

    public Instructor getByUsername(String username) {
        String sql = "SELECT * FROM Instructor WHERE iname = ?";
        Instructor instructor = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                instructor = new Instructor();
                instructor.setId(rs.getInt("iid"));
                instructor.setName(rs.getString("iname"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return instructor;
    }
//    public static void main(String[] args) {
//        Instructor ins = new Instructor();
//        InstructorDAO inst = new InstructorDAO();
//        ins = inst.getByUsername("sonnt");
//        int iid = ins.getId();
//        System.out.println(iid);
//    }

}
