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
import model.GrSub;

/**
 *
 * @author HELLO
 */
public class GrSubDAO extends DBContext{

    public List<GrSub> getAll(int instructorId) {
        List<GrSub> list = new ArrayList<>();
        String sql = "SELECT g.gid, s.subname ,g.gname\n"
                + "FROM [Group] g\n"
                + "JOIN Subject s ON g.subid = s.subid\n"
                + "WHERE g.sup_iis = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, instructorId);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                GrSub c = new GrSub(rs.getInt("gid"),rs.getString("subname"),rs.getString("gname"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
//    public static void main(String[] args) {
//        GrSubDAO db = new GrSubDAO();
//        List<GrSub> list = db.getAll(1);
//        System.out.println(list.get(0).getSubname());
//}
    }