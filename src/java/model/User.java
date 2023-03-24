/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author DELL
 */
public class User {
    private int userId;
    private String fullname;
    private String email;
    private String phone_number;
    private String address;
    private String password;
    private Date created_at;
    private int roleID;
    private Date updated_at;
    private int deleted;

    public User() {
    }

    public User(int userId, String fullname, String email, String phone_number, String address, String password, Date created_at, int roleID, Date updated_at, int deleted) {
        this.userId = userId;
        this.fullname = fullname;
        this.email = email;
        this.phone_number = phone_number;
        this.address = address;
        this.password = password;
        this.created_at = created_at;
        this.roleID = roleID;
        this.updated_at = updated_at;
        this.deleted = deleted;
    }
    
     public User( String fullname, String email, String phone_number, String address, String password, Date created_at, int roleID, Date updated_at, int deleted) {
      
        this.fullname = fullname;
        this.email = email;
        this.phone_number = phone_number;
        this.address = address;
        this.password = password;
        this.created_at = created_at;
        this.roleID = roleID;
        this.updated_at = updated_at;
        this.deleted = deleted;
     }
     
     
     public User( String fullname, String email, String phone_number, String address, String password, int roleID) {
      
        this.fullname = fullname;
        this.email = email;
        this.phone_number = phone_number;
        this.address = address;
        this.password = password;
        this.roleID = roleID;
    }
        
   
     public User(int userId, String fullname, String email, String phone_number, String address, String password, int roleID) {
      this.userId=userId;
        this.fullname = fullname;
        this.email = email;
        this.phone_number = phone_number;
        this.address = address;
        this.password = password;
        this.roleID = roleID;
    }
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

   
    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }
    
    
}
