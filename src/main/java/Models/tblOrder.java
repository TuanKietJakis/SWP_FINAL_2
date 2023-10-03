/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kiet
 */
public class tblOrder {
    int OrderID;
    int UserID;
    String FullName;
    String OrderDate;
    int TotalPrice;
    int PhoneNumber;
    int OrderAddressID;
    byte StatusID;
    byte PaymentMethodID;

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }

    public int getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(int TotalPrice) {
        this.TotalPrice = TotalPrice;
    }

    public int getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(int PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public int getOrderAddressID() {
        return OrderAddressID;
    }

    public void setOrderAddressID(int OrderAddressID) {
        this.OrderAddressID = OrderAddressID;
    }

    public byte getStatusID() {
        return StatusID;
    }

    public void setStatusID(byte StatusID) {
        this.StatusID = StatusID;
    }

    public byte getPaymentMethodID() {
        return PaymentMethodID;
    }

    public void setPaymentMethodID(byte PaymentMethodID) {
        this.PaymentMethodID = PaymentMethodID;
    }

    public byte getActive() {
        return Active;
    }

    public void setActive(byte Active) {
        this.Active = Active;
    }

    public tblOrder(int OrderID, int UserID, String FullName, String OrderDate, int TotalPrice, int PhoneNumber, int OrderAddressID, byte StatusID, byte PaymentMethodID, byte Active) {
        this.OrderID = OrderID;
        this.UserID = UserID;
        this.FullName = FullName;
        this.OrderDate = OrderDate;
        this.TotalPrice = TotalPrice;
        this.PhoneNumber = PhoneNumber;
        this.OrderAddressID = OrderAddressID;
        this.StatusID = StatusID;
        this.PaymentMethodID = PaymentMethodID;
        this.Active = Active;
    }

    public tblOrder() {
    }
    byte Active;
}
