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
    private int OrderID;
    private int UserID;
    private String FullName;
    private String OrderDate;
    private int TotalPrice;
    private String PhoneNumber;
    private String OrderAddress;
    private byte StatusID;
    private byte PaymentMethodID;
    private byte Active;

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

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getOrderAddress() {
        return OrderAddress;
    }

    public void setOrderAddress(String OrderAddress) {
        this.OrderAddress = OrderAddress;
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

    public tblOrder(int UserID, String FullName, String OrderDate, int TotalPrice, String PhoneNumber, String OrderAddress, byte StatusID, byte PaymentMethodID, byte Active) {
        this.UserID = UserID;
        this.FullName = FullName;
        this.OrderDate = OrderDate;
        this.TotalPrice = TotalPrice;
        this.PhoneNumber = PhoneNumber;
        this.OrderAddress = OrderAddress;
        this.StatusID = StatusID;
        this.PaymentMethodID = PaymentMethodID;
        this.Active = Active;
    }

    public tblOrder(int OrderID, int UserID, String FullName, String OrderDate, int TotalPrice, String PhoneNumber, String OrderAddress, byte StatusID, byte PaymentMethodID, byte Active) {
        this.OrderID = OrderID;
        this.UserID = UserID;
        this.FullName = FullName;
        this.OrderDate = OrderDate;
        this.TotalPrice = TotalPrice;
        this.PhoneNumber = PhoneNumber;
        this.OrderAddress = OrderAddress;
        this.StatusID = StatusID;
        this.PaymentMethodID = PaymentMethodID;
        this.Active = Active;
    }

    public tblOrder() {
    }
}
