/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import model.Cart;
import model.User;
import model.Item;

public class OrderDAO extends DBContext {

    // mình chỉ cần làm chức năng khi nó add to cart là thêm vào giỏ hàng (buyitem thì mình sẽ cho nó vào giỏ)
    // jsp addtocart gọi đến buy servlet rồi sang my eshort .jsp
    public void addOrder(User u, Cart cart) {
        LocalDate curDate = java.time.LocalDate.now(); // hóa đơn ngày hiện tại
        String date = curDate.toString();
        try {
            //add vào bảng Order
            // add cái mà người ta mua hàng: ngày, mã kh, tổng tiền
            String sql = "insert into [Orders] (userId, fullname,email,phone_number,address,order_date,totalMoney)"
                    + "values(?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u.getUserId());
            st.setString(2, u.getFullname());
            st.setString(3, u.getEmail());
            st.setString(4, u.getPhone_number());
            st.setString(5, u.getAddress());
            st.setString(6, date);
            st.setDouble(7, cart.getTotalMoney());
            st.executeUpdate();
            //lấy ra id của Order vừa add
            String sql1 = "select top 1 orderId from [Orders] order by orderId desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            //add vào bảng Order detail: bảng hóa đơn luôn:
            // chia bảng để ko bị dư thừa dữ liệu
            if (rs.next()) {
                int oid = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    // orderline là bảng chi tiết
                    String sql2 = "insert into [Order_Details] (orderId, productId, price,quantity,totalmoney)\n"
                            + "values(?,?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getProductId());
                     st2.setDouble(3, i.getPrice());
                    st2.setInt(4, i.getQuantity());
                   
                    st2.setDouble(5, cart.getTotalMoney());
                    st2.executeUpdate();
                }
            }
            //update so luong trong bang Product sau khi ban
            String sql3 = "update Products set quantity = quantity - ? "
                    + "where productId = ?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getProductId());
                st3.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
