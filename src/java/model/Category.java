/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class Category {
    private int categoryId;
    private String name, galerySmall;

    public Category() {
    }

    public Category(int categoryId, String name, String galerySmall) {
        this.categoryId = categoryId;
        this.name = name;
        this.galerySmall = galerySmall;
    }

   

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGalerySmall() {
        return galerySmall;
    }

    public void setGalerySmall(String galerySmall) {
        this.galerySmall = galerySmall;
    }
    

    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", name=" + name + '}';
    }
    
    
}
