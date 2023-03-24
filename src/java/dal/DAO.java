/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Galery;
import model.Product;
import model.User;

public class DAO extends DBContext {

    public List<Category> getAll() {

        List<Category> list = new ArrayList<>();
        String sql = "select * from dbo.Categories";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryId(rs.getInt("categoryId"));
                c.setName(rs.getString("name"));
                list.add(c);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> Statistic() {
        List<Product> list = new ArrayList<>();
        // đầu tiên là dùng lệnh sql
        String sql = "select categoryId, sum(quantity) as sumquantity from products\n"
                + "group by categoryId";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                Category c = getCategoryById(rs.getInt("categoryId"));
                p.setSmallImage(c);
                p.setQuantity(rs.getInt("sumquantity"));
                list.add(p);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Product> Statistic2(Date date1, Date date2) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.productId, count(ord.productId) as [SumProducts], p.title as name from order_details ord join orders o on ord.orderId = o.orderId join Products p on p.productId = ord.ProductId\n"
                + " where 1=1";
        
        if (date1 != null) {
            sql += " and o.order_date  >= '" + date1 + "'";
        }
        if (date2 != null) {
            sql += " and o.order_date  <= '" + date2 + "'";
        }

        sql += " group by ord.ProductId, p.title, p.productId";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setProductId(rs.getInt("productId"));
                p.setTitle(rs.getString("name"));
                p.setSum(rs.getInt("SumProducts"));
                list.add(p);
            }
        } catch (Exception e) {
        }
        
        return list;

    }

    public Category getCategoryById(int id) {
        String sql = "select * from categories where categoryId = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);                           // chú ý sửa chỗ này
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Category c = new Category();
                c.setCategoryId(rs.getInt("categoryId"));
                c.setName(rs.getString("name"));
                c.setGalerySmall(rs.getString("smallImage"));
                return c;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public User getUserById(String email) {
        String sql = "select * from [User] where email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);                           // chú ý sửa chỗ này
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("userId"));
                u.setFullname(rs.getString("fullName"));
                u.setEmail(rs.getString("email"));
                u.setPhone_number(rs.getString("Phone_number"));
                u.setAddress(rs.getString("address"));
                u.setPassword(rs.getString("password"));
                u.setRoleID(rs.getInt("roleID"));
                u.setDeleted(rs.getInt("deleted"));
                return u;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public User getUserById(int id) { // id này là của category id bên trong sản phầm products
        String sql = "select * from [User] where userID = ?"; // chú ý sửa chỗ này

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);                           // chú ý sửa chỗ này
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setFullname(rs.getString("fullname"));
                u.setEmail(rs.getString("email"));
                u.setPhone_number(rs.getString("phone_number"));
                u.setAddress(rs.getString("address"));
                u.setPassword(rs.getString("password"));
                return u;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Product getProductById(int id) { // id này là của category id bên trong sản phầm products
        String sql = "select * from Products where productId = ?"; // chú ý sửa chỗ này

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);                           // chú ý sửa chỗ này
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
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
                Category c = getCategoryById(rs.getInt("categoryId"));
                p.setSmallImage(c);
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        DAO d = new DAO();
        String date = "1152022";
        Date date1 = Date.valueOf("date");
        
        List<Product> list = d.Statistic2(date1,null);
        for (Product product : list) {
            System.out.println(product.getSum());
            System.out.println(product.getTitle());
        }

    }

    public List<Product> getElementByCId(int cid, int id_product) {
        String sql = "select * from products where 1 = 1";
        if (cid != 0) {
            sql += " and categoryId = " + cid;
        }
        if (id_product != 0) {
            sql += " and productId = " + id_product;
        }
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("productId"));
                p.setDiscount(rs.getDouble("discount"));
                p.setDescription(rs.getString("description"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setQuantity(rs.getInt("quantity"));
                // lay bang id cua product
                // lấy ra cái tên thương hiệu của sản phẩm đấy
                Category c = getCategoryById(rs.getInt("categoryId"));
                p.setSmallImage(c);

                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getListByPage(List<Product> list, int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public User login(String email, String password) { // day la kiem tra xem co so dien thoai trung ko: tuc la phone_number la khoa
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

    public User login3(String email, String password) { // day la kiem tra xem co so dien thoai trung ko: tuc la phone_number la khoa
        String sql = "select * from [User] where email = ? "
                + "and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
//               return new User(rs.getInt("userId"), rs.getString("fullname"),email , rs.getString("phone_number"), rs.getString("address"), rs.getString("password"), rs.getDate("created_at"), rs.getInt("roleId"),rs.getDate("updated_at"), rs.getInt("deleted"));
                return new User(rs.getInt("userId"), rs.getString("fullname"), rs.getString("email"), rs.getString("phone_number"), rs.getString("address"), rs.getString("password"), rs.getInt("roleID"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public User login2(String email, String phone_number) { // day la kiem tra xem co so dien thoai trung ko: tuc la phone_number la khoa
        String sql = "select * from [User] where email = ? or phone_number = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, phone_number);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
//               return new User(rs.getInt("userId"), rs.getString("fullname"),email , rs.getString("phone_number"), rs.getString("address"), rs.getString("password"), rs.getDate("created_at"), rs.getInt("roleId"),rs.getDate("updated_at"), rs.getInt("deleted"));
                return new User(rs.getString("fullname"), rs.getString("email"), rs.getString("phone_number"), rs.getString("address"), rs.getString("password"), rs.getInt("roleID"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void insert(User u) {
        String sql = " insert into [User] (fullname,Email,Phone_number,[address],[password], roleID)"
                + " values(?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getFullname());
            st.setString(2, u.getEmail());
            st.setString(3, u.getPhone_number());
            st.setString(4, u.getAddress());
            st.setString(5, u.getPassword());
            st.setInt(6, u.getRoleID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insert(Product p) {
        String sql = " insert into [Products] (categoryId, title, price,discount,thumbnail,description,created_at,updated_at)"
                + " values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, p.getSmallImage().getCategoryId());
            st.setString(2, p.getTitle());
            st.setDouble(3, p.getPrice());
            st.setDouble(4, p.getDiscount());
            st.setString(5, p.getThumbnail());
            st.setString(6, p.getDescription());
            st.setDate(7, p.getCreated_at());
            st.setDate(8, p.getUpdated_at());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

//   
    public List<Product> search(String description, double price1, double price2, int cid, int ar) {
        String sql = "select * from products where 1 = 1";
//        select*from products where name like '%iphone%'
        if (description != null && !description.equals("")) { // tức là nhập vào giá trị. if kiểm tra
            sql += " and title like '%" + description + "%'";
        }
//select*from products where price >= 16000 and price <= 19000
        if (price1 != 0) {
            sql += " and price >= " + price1;
        }
        if (price2 != 0) {
            sql += " and price <= " + price2;
        }
        if (cid != 0) {
            sql += " and categoryId = " + cid;
        }
        // neu tang dan thi ar = 1
        if (ar == 1) {
            sql += " ORDER BY price ASC";
        }
        if (ar == 0) {
            sql += " ORDER BY price DESC";
        }
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("productId"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getDouble("price"));
                p.setDiscount(rs.getDouble("discount"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setDescription(rs.getString("description"));
                p.setCreated_at(rs.getDate("created_at"));
                p.setUpdated_at(rs.getDate("updated_at"));
                Category c = getCategoryById(rs.getInt("categoryId"));
                p.setSmallImage(c);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // viết lệnh lấy tất cả ảnh nhỏ của id sản phẩm đấy
    public List<Galery> getElementByGalery(int productId) {
        String sql = "select * from galery where 1 = 1";
        if (productId != 0) {
            sql += " and productId = " + productId;
        }
        List<Galery> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Galery g = new Galery();
                g.setGaleryId(rs.getInt("galeryId"));
                g.setProductId(rs.getInt("productId"));
                g.setThumbnail(rs.getString("thumbnail"));
                list.add(g);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void delete(int id) {
        String sql = "delete from products where productId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            // set cho cái ?
            st.setInt(1, id);  // cho cái ? thứ 1
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void update(Product p) {
        String sql = "update Products set title = ?, price = ?, discount = ?, thumbnail = ?, description = ?, created_at = ?, updated_at = ? where productId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, c.getName());
//            st.setString(2, c.getDescribe());
//            st.setInt(3,c.getId());
            st.setString(1, p.getTitle());
            st.setDouble(2, p.getPrice());
            st.setDouble(3, p.getDiscount());
            st.setString(4, p.getThumbnail());
            st.setString(5, p.getDescription());
            st.setDate(6, p.getCreated_at());
            st.setDate(7, p.getUpdated_at());
            st.setInt(8, p.getProductId());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
