/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kiet
 */
public class tblOrderDetail {
    int OrderID;
    int ProductID;
    int ProductPrice;
    int Quantity;
    byte Active;

    public tblOrderDetail() {
    }

    public tblOrderDetail(int OrderID, int ProductID, int ProductPrice, int Quantity, byte Active) {
        this.OrderID = OrderID;
        this.ProductID = ProductID;
        this.ProductPrice = ProductPrice;
        this.Quantity = Quantity;
        this.Active = Active;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getProductPrice() {
        return ProductPrice;
    }

    public void setProductPrice(int ProductPrice) {
        this.ProductPrice = ProductPrice;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public byte getActive() {
        return Active;
    }

    public void setActive(byte Active) {
        this.Active = Active;
    }
    
}
