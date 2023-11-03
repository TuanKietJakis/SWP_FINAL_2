/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kiet
 */
public class tblAddress {
    int AddressID;
    int UserID;
    String Address;
    byte Active;
    String PhoneNumber;
    String FullName;
        int PaymentMethod;


    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public int getPaymentMethod() {
        return PaymentMethod;
    }

    public void setPaymentMethod(int PaymentMethod) {
        this.PaymentMethod = PaymentMethod;
    }
    

    public tblAddress() {
    }

    public int getAddressID() {
        return AddressID;
    }

    public void setAddressID(int AddressID) {
        this.AddressID = AddressID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public byte getActive() {
        return Active;
    }

    public void setActive(byte Active) {
        this.Active = Active;
    }

    public tblAddress(int AddressID, int UserID, String Address, byte Active) {
        this.AddressID = AddressID;
        this.UserID = UserID;
        this.Address = Address;
        this.Active = Active;
    }

    public tblAddress(int AddressID, int UserID, String Address, byte Active, String PhoneNumber, String FullName, byte PaymentMethod) {
        this.AddressID = AddressID;
        this.UserID = UserID;
        this.Address = Address;
        this.Active = Active;
        this.PhoneNumber = PhoneNumber;
        this.FullName = FullName;
        this.PaymentMethod = PaymentMethod;
    }
    public tblAddress(int AddressID, int UserID, String Address, String PhoneNumber, String FullName, int PaymentMethod) {
        this.AddressID = AddressID;
        this.UserID = UserID;
        this.Address = Address;
        this.PhoneNumber = PhoneNumber;
        this.FullName = FullName;
        this.PaymentMethod = PaymentMethod;
    }

    public tblAddress(int UserID, String Address, String PhoneNumber, String FullName, byte PaymentMethod) {
        this.UserID = UserID;
        this.Address = Address;
        this.PhoneNumber = PhoneNumber;
        this.FullName = FullName;
        this.PaymentMethod = PaymentMethod;
    }

    public tblAddress(int UserID, String Address, byte Active, String PhoneNumber, String FullName, byte PaymentMethod) {
        this.UserID = UserID;
        this.Address = Address;
        this.Active = Active;
        this.PhoneNumber = PhoneNumber;
        this.FullName = FullName;
        this.PaymentMethod = PaymentMethod;
    }

    public tblAddress(int UserID, String Address, byte Active) {
        this.UserID = UserID;
        this.Address = Address;
        this.Active = Active;
    }
}
