/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.io.Serializable;

/**
 *
 * @author Dell
 */
public class UserDTO implements Serializable{

    private String userID;
    private String password;
    private String fullName;
    private String gender;
    private String roleID;
    private String email;
    private String phoneNumber;
    private String bank;
    private String address;

    public UserDTO() {
        userID = "";
        password = "";
        fullName = "";
        gender = "";
        roleID = "";
        email = "";
        phoneNumber = "";
        bank = "";
        address = "";
    }

    public UserDTO(String userID, String email, String phoneNumber) {
        this.userID = userID;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }

    public UserDTO(String userID, String password, String fullName, String gender, String roleID, String email, String phoneNumber, String bank, String address) {
        this.userID = userID;
        this.password = password;
        this.fullName = fullName;
        this.gender = gender;
        this.roleID = roleID;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.bank = bank;
        this.address = address;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
