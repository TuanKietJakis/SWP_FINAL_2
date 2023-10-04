/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kiet
 */
public class tblUser {

    int UserID;
    String UserName;
    String Password;
    String Email;
    String FullName;
    String Gender;
    String DOB;
    String PhoneNumber;
    private int AddressID;
    private String Address;
    int RoleID;
    byte Active;

    public tblUser() {
    }

    
    public tblUser(int UserID, String UserName, String Password, String Email, String FullName, String Gender, String DOB, String PhoneNumber, int RoleID, byte Active) {
        this.UserID = UserID;
        this.UserName = UserName;
        this.Password = Password;
        this.Email = Email;
        this.FullName = FullName;
        this.Gender = Gender;
        this.DOB = DOB;
        this.PhoneNumber = PhoneNumber;
        this.RoleID = RoleID;
        this.Active = Active;
    }

    public tblUser(String UserName, String Password, String Email, String FullName, String Gender, String DOB, String PhoneNumber, int RoleID, byte Active) {
        this.UserName = UserName;
        this.Password = Password;
        this.Email = Email;
        this.FullName = FullName;
        this.Gender = Gender;
        this.DOB = DOB;
        this.PhoneNumber = PhoneNumber;
        this.RoleID = RoleID;
        this.Active = Active;
    }

    public tblUser(int UserID, String UserName, String Email, String FullName, String Gender, String DOB, String PhoneNumber, int AddressID, String Address) {
        this.UserID = UserID;
        this.UserName = UserName;
        this.Email = Email;
        this.FullName = FullName;
        this.Gender = Gender;
        this.DOB = DOB;
        this.PhoneNumber = PhoneNumber;
        this.AddressID = AddressID;
        this.Address = Address;
    }

    public tblUser(int UserID, String UserName, String Email, String FullName, String Gender, String PhoneNumber, String Address) {
        this.UserID = UserID;
        this.UserName = UserName;
        this.Email = Email;
        this.FullName = FullName;
        this.Gender = Gender;
        this.PhoneNumber = PhoneNumber;
        this.Address = Address;
    }
    

    
    
    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getEmail() {
        return Email;
    }

    public tblUser(String UserName, String Password) {
        this.UserName = UserName;
        this.Password = Password;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public int getRoleID() {
        return RoleID;
    }

    public void setRoleID(int RoleID) {
        this.RoleID = RoleID;
    }

    public byte getActive() {
        return Active;
    }

    public void setActive(byte Active) {
        this.Active = Active;
    }

    public int getAddressID() {
        return AddressID;
    }

    public void setAddressID(int AddressID) {
        this.AddressID = AddressID;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

}
