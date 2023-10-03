/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kiet
 */
public class tblOrderStatus {
    int StatusID;
    String StatusName;
    Byte Active;

    public tblOrderStatus() {
    }

    public tblOrderStatus(int StatusID, String StatusName, Byte Active) {
        this.StatusID = StatusID;
        this.StatusName = StatusName;
        this.Active = Active;
    }

    public int getStatusID() {
        return StatusID;
    }

    public void setStatusID(int StatusID) {
        this.StatusID = StatusID;
    }

    public String getStatusName() {
        return StatusName;
    }

    public void setStatusName(String StatusName) {
        this.StatusName = StatusName;
    }

    public Byte getActive() {
        return Active;
    }

    public void setActive(Byte Active) {
        this.Active = Active;
    }
    
}
