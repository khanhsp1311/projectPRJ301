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
import model.Category;
import model.Product;



   public class ProductDAO extends DBContext{
    public List<Product> getAll(){ // lấy tất cả sản phẩm
        List<Product> list=new ArrayList<>();
        String sql="select * from Product";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setProductId(rs.getInt("productId"));
                p.setDiscount(rs.getDouble("discount"));
                p.setDescription(rs.getString("description"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setCreated_at(rs.getDate("created_at"));
                p.setUpdated_at(rs.getDate("updated_at"));
                // lay bang id cua product
                // lấy ra cái tên thương hiệu của sản phẩm đấy
//                Category c = getCategoryById(rs.getInt("categoryId"));
//                p.setSmallImage();
                list.add(p);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
}


