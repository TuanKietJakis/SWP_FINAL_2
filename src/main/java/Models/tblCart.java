/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kiet
 */
public class tblCart {

    int CartID;
    int UserID;
    int ProductID;
    String ProductName;
    int ProductPrice;
    int ProductAmount;
    String ProductImageURL;

    public int getCartID() {
        return CartID;
    }

    public void setCartID(int CartID) {
        this.CartID = CartID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public int getProductPrice() {
        return ProductPrice;
    }

    public void setProductPrice(int ProductPrice) {
        this.ProductPrice = ProductPrice;
    }

    public int getProductAmount() {
        return ProductAmount;
    }

    public void setProductAmount(int ProductAmount) {
        this.ProductAmount = ProductAmount;
    }

    public String getProductImageURL() {
        return ProductImageURL;
    }

    public void setProductImageURL(String ProductImageURL) {
        this.ProductImageURL = ProductImageURL;
    }

    public tblCart(int CartID, int UserID, int ProductID, String ProductName, int ProductPrice, int ProductAmount, String ProductImageURL) {
        this.CartID = CartID;
        this.UserID = UserID;
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.ProductPrice = ProductPrice;
        this.ProductAmount = ProductAmount;
        this.ProductImageURL = ProductImageURL;
    }

    public tblCart() {
    }
}
