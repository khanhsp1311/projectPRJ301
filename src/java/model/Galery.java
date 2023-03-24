/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class Galery {
    private int galeryId;
    private int productId;
    private String thumbnail;

    public Galery(int galeryId, int productId, String thumbnail) {
        this.galeryId = galeryId;
        this.productId = productId;
        this.thumbnail = thumbnail;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public Galery() {
    }

    public Galery(int galeryId, int productId) {
        this.galeryId = galeryId;
        this.productId = productId;
    }

    public int getGaleryId() {
        return galeryId;
    }

    public void setGaleryId(int galeryId) {
        this.galeryId = galeryId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

 
    
    
}
