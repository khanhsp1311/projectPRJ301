/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

public class Cart { // ném item sản phẩm vào giỏ hàng

    // nó sẽ chứa danh sách các sản phẩm được ném vào
    private List<Item> items; // đây là danh sách

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    // kiểm tra, hoặc lấy
    private Item getItemById(int id) { // lấy sản phẩm trong giỏ hảng
        for (Item i : items) { // id của sản phẩm
            if (i.getProduct().getProductId() == id) {
                return i;
            }
        }
        return null;
    }

    public int getQuantityById(int id) { // lấy được số lượng trong item
        return getItemById(id).getQuantity();
    }

    // thêm vào giỏ
    public void addItem(Item t) { // có một item đc thêm vào giỏ
        // có trong cart rồi
        if (getItemById(t.getProduct().getProductId()) != null) {
            Item i = getItemById(t.getProduct().getProductId()); // lấy từ giỏ hàng ra: 
            i.setQuantity(i.getQuantity() + t.getQuantity());//cộng dồn
        } else {
            items.add(t); // chưa có
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public double getTotalMoney(){
        double t = 0;
        for (Item i : items) {
            t += i.getQuantity()* i.getPrice();
        }
        return t;
    }
}
