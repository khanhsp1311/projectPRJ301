/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;

/**
 *
 * @author DELL
 */
public class CustomerDAO extends DBContext{
    public User getAccount(String email, String password){ // user là tên email
       String sql = "select * from [User] where email = ? "
                + "and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
//               return new User(rs.getInt("userId"), rs.getString("fullname"),email , rs.getString("phone_number"), rs.getString("address"), rs.getString("password"), rs.getDate("created_at"), rs.getInt("roleId"),rs.getDate("updated_at"), rs.getInt("deleted"));
                return new User(rs.getString("fullname"), rs.getString("email"), rs.getString("phone_number"), rs.getString("address"), rs.getString("password"), rs.getInt("roleID"));
            }
        } catch (Exception e) {
        }
        return null;
    }
}
