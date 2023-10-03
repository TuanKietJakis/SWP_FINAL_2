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

    public tblAddress(int UserID, String Address, byte Active) {
        this.UserID = UserID;
        this.Address = Address;
        this.Active = Active;
    }
}
