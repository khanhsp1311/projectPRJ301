
package model;

public class OrderDetail { // chi tiết hóa đơn: 
    
    // đi siêu thị kiểu sản phẩm thứ nhất, số lượng bao nhiêu, giá
   private int oldld ;
   private int orderId;
   private int productId;
   private double price;
   private int totalMoney;

    public OrderDetail() {
    }

    public OrderDetail(int oldld, int orderId, int productId, double price, int totalMoney) {
        this.oldld = oldld;
        this.orderId = orderId;
        this.productId = productId;
        this.price = price;
        this.totalMoney = totalMoney;
    }

    public int getOldld() {
        return oldld;
    }

    public void setOldld(int oldld) {
        this.oldld = oldld;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(int totalMoney) {
        this.totalMoney = totalMoney;
    }
   
}
