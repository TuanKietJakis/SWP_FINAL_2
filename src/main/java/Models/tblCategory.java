/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kiet
 */
public class tblCategory {
    int CategoryID;
    String CatName;
    int Active;

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public tblCategory(String CatName, int Active) {
        this.CatName = CatName;
        this.Active = Active;
    }

    public String getCatName() {
        return CatName;
    }

    public void setCatName(String CatName) {
        this.CatName = CatName;
    }

    public int getActive() {
        return Active;
    }

    public void setActive(int Active) {
        this.Active = Active;
    }

    public tblCategory(int CategoryID, String CatName, int Active) {
        this.CategoryID = CategoryID;
        this.CatName = CatName;
        this.Active = Active;
    }

    public tblCategory() {
    }
}
