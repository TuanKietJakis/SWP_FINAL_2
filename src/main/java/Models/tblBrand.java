/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kiet
 */
public class tblBrand {

    public tblBrand(String BrandName, int Active) {
        this.BrandName = BrandName;
        this.Active = Active;
    }
    int BrandID;
    String BrandName;
    int Active;

    public int getBrandID() {
        return BrandID;
    }

    public void setBrandID(int BrandID) {
        this.BrandID = BrandID;
    }

    public String getBrandName() {
        return BrandName;
    }

    public void setBrandName(String BrandName) {
        this.BrandName = BrandName;
    }

    public int getActive() {
        return Active;
    }

    public void setActive(int Active) {
        this.Active = Active;
    }

    public tblBrand(int BrandID, String BrandName, int Active) {
        this.BrandID = BrandID;
        this.BrandName = BrandName;
        this.Active = Active;
    }

    public tblBrand() {
    }
}
