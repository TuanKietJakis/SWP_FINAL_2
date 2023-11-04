/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kiet
 */
public class tblWishList {
    int WishListID;
    int UserID;
    int ProductID;
    String ProductName;
    int ProductPrice;
    String ProductImageURL;

    public tblWishList() {
    }

    public tblWishList(int WishListID, int UserID, int ProductID, String ProductName, int ProductPrice, String ProductImageURL) {
        this.WishListID = WishListID;
        this.UserID = UserID;
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.ProductPrice = ProductPrice;
        this.ProductImageURL = ProductImageURL;
    }

    public tblWishList(int WishListID, int UserID, int ProductID) {
        this.WishListID = WishListID;
        this.UserID = UserID;
        this.ProductID = ProductID;
    }

    public int getWishListID() {
        return WishListID;
    }

    public void setWishListID(int WishListID) {
        this.WishListID = WishListID;
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

    public String getProductImageURL() {
        return ProductImageURL;
    }

    public void setProductImageURL(String ProductImageURL) {
        this.ProductImageURL = ProductImageURL;
    }
    
}
