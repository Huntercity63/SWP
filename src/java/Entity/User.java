/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.util.Date;

/**
 *
 * @author phuan
 */
public class User {

    private int UserID;
    private String first_name;
    private String last_name;
    private String phone;
    private String email;
    private String address;
    private String username;
    private String password;
    private Date dob;
    private boolean gender;
    private int status;
    private Role role;
    private Security security;
    private String securityAnswer;
     public User(){
         
     }

    public User(int UserID, String first_name, String last_name, String phone, String email, String address, String username, String password, Date dob, boolean gender, int status, Role role, Security security, String securityAnswer) {
        this.UserID = UserID;
        this.first_name = first_name;
        this.last_name = last_name;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.username = username;
        this.password = password;
        this.dob = dob;
        this.gender = gender;
        this.status = status;
        this.role = role;
        this.security = security;
        this.securityAnswer = securityAnswer;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Security getSecurity() {
        return security;
    }

    public void setSecurity(Security security) {
        this.security = security;
    }

    public String getSecurityAnswer() {
        return securityAnswer;
    }

    public void setSecurityAnswer(String securityAnswer) {
        this.securityAnswer = securityAnswer;
    }

    @Override
    public String toString() {
        return "User{" + "UserID=" + UserID + ", first_name=" + first_name + ", last_name=" + last_name + ", phone=" + phone + ", email=" + email + ", address=" + address + ", username=" + username + ", password=" + password + ", dob=" + dob + ", gender=" + gender + ", status=" + status + ", role=" + role + ", security=" + security + ", securityAnswer=" + securityAnswer + '}';
    }

   
   
}
