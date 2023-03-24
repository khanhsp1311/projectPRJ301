/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author DELL
 */
public class Product {
    private int productId;
    private String title;
    private double price;
    private double discount;
    private String description;
    private Date created_at, updated_at;
    private String thumbnail;
    private Category smallImage;
    private int quantity;
    
    private int sum;

    public Product(int productId, String title, double price, double discount, String description, Date created_at, Date updated_at, String thumbnail, Category smallImage, int quantity, int sum) {
        this.productId = productId;
        this.title = title;
        this.price = price;
        this.discount = discount;
        this.description = description;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.thumbnail = thumbnail;
        this.smallImage = smallImage;
        this.quantity = quantity;
        this.sum = sum;
    }
    

    public Product(int productId, String title, double price, double discount, String description, Date created_at, Date updated_at, String thumbnail, Category smallImage, int quantity) {
        this.productId = productId;
        this.title = title;
        this.price = price;
        this.discount = discount;
        this.description = description;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.thumbnail = thumbnail;
        this.smallImage = smallImage;
        this.quantity = quantity;
    }
    
    

    public Product() {
    }

    public Product(int productId, String title, int price, String thumbnail, Category smallImage) {
        this.productId = productId;
        this.title = title;
        this.price = price;
        this.thumbnail = thumbnail;
        this.smallImage = smallImage;
    }

    public Product(int productId, String title, double price, double discount, String description, Date created_at, Date updated_at, String thumbnail, Category smallImage) {
        this.productId = productId;
        this.title = title;
        this.price = price;
        this.discount = discount;
        this.description = description;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.thumbnail = thumbnail;
        this.smallImage = smallImage;
    }
    
 public Product(int productId, String title, double price, double discount, String description, Date created_at, Date updated_at, String thumbnail) {
        this.productId = productId;
        this.title = title;
        this.price = price;
        this.discount = discount;
        this.description = description;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.thumbnail = thumbnail;
      
    }

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }
    
    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }    


    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public Category getSmallImage() {
        return smallImage;
    }

    public void setSmallImage(Category smallImage) {
        this.smallImage = smallImage;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", title=" + title + ", price=" + price + ", discount=" + discount + ", description=" + description + ", created_at=" + created_at + ", updated_at=" + updated_at + ", thumbnail=" + thumbnail + ", smallImage=" + smallImage + ", quantity=" + quantity + ", sum=" + sum + '}';
    }

  
    
    
}
