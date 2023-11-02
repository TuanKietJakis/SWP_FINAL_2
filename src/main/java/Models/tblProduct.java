/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kiet
 */
public class tblProduct {

    int ProductID;
    String ProductName;
    int Price;
    int BrandID;
    int CategoryID;
    int RatingID;
    String ProductDes;
    int Quantity;
    byte Active;
    String ProductImageURL;
    int Size;
    String BrandName;
    String CatName;
    int Cost;

    public tblProduct() {
    }

    public tblProduct(String ProductName, int Price, int BrandID, int CategoryID, String ProductDes, int Quantity, byte Active, String ProductImageURL, int Size, int Cost) {
        this.ProductName = ProductName;
        this.Price = Price;
        this.BrandID = BrandID;
        this.CategoryID = CategoryID;
        this.ProductDes = ProductDes;
        this.Quantity = Quantity;
        this.Active = Active;
        this.ProductImageURL = ProductImageURL;
        this.Size = Size;
        this.Cost = Cost;
    }

    public tblProduct(String ProductName, int Price, int BrandID, int CategoryID, String ProductDes, int Quantity, byte Active, String ProductImageURL, int Size) {
        this.ProductName = ProductName;
        this.Price = Price;
        this.BrandID = BrandID;
        this.CategoryID = CategoryID;
        this.ProductDes = ProductDes;
        this.Quantity = Quantity;
        this.Active = Active;
        this.ProductImageURL = ProductImageURL;
        this.Size = Size;
    }

    public tblProduct(String BrandName, String CatName) {
        this.BrandName = BrandName;
        this.CatName = CatName;
    }

    public tblProduct(String ProductName, int Price, String ProductDes, byte Active, String ProductImageURL, int Size, String BrandName, String CatName) {
        this.ProductName = ProductName;
        this.Price = Price;
        this.ProductDes = ProductDes;
        this.Active = Active;
        this.ProductImageURL = ProductImageURL;
        this.Size = Size;
        this.BrandName = BrandName;
        this.CatName = CatName;
    }

    public tblProduct(int ProductID, String ProductName, int Price, int BrandID, int CategoryID, String ProductDes, int Quantity, byte Active, String ProductImageURL, int Size) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.Price = Price;
        this.BrandID = BrandID;
        this.CategoryID = CategoryID;
        this.RatingID = RatingID;
        this.ProductDes = ProductDes;
        this.Quantity = Quantity;
        this.Active = Active;
        this.ProductImageURL = ProductImageURL;
        this.Size = Size;
    }

    public tblProduct(int ProductID, String ProductName, int Price, int BrandID, int CategoryID, String ProductDes, int Quantity, String ProductImageURL, int Size) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.Price = Price;
        this.BrandID = BrandID;
        this.CategoryID = CategoryID;
        this.RatingID = RatingID;
        this.ProductDes = ProductDes;
        this.Quantity = Quantity;
        this.ProductImageURL = ProductImageURL;
        this.Size = Size;
    }

    public tblProduct(int ProductID, String ProductName, int Price, String ProductImageURL) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.Price = Price;
        this.ProductImageURL = ProductImageURL;
    }

    public int getCost() {
        return Cost;
    }

    public void setCost(int Cost) {
        this.Cost = Cost;
    }

    public String getBrandName() {
        return BrandName;
    }

    public void setBrandName(String BrandName) {
        this.BrandName = BrandName;
    }

    public String getCatName() {
        return CatName;
    }

    public void setCatName(String CatName) {
        this.CatName = CatName;
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

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public int getBrandID() {
        return BrandID;
    }

    public void setBrandID(int BrandID) {
        this.BrandID = BrandID;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public int getRatingID() {
        return RatingID;
    }

    public void setRatingID(int RatingID) {
        this.RatingID = RatingID;
    }

    public String getProductDes() {
        return ProductDes;
    }

    public void setProductDes(String ProductDes) {
        this.ProductDes = ProductDes;
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

    public String getProductImageURL() {
        return ProductImageURL;
    }

    public void setProductImageURL(String ProductImageURL) {
        this.ProductImageURL = ProductImageURL;
    }

    public int getSize() {
        return Size;
    }

    public void setSize(int Size) {
        this.Size = Size;
    }

}
