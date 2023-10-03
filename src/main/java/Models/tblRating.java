/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kiet
 */
public class tblRating {
    int RatingID;
    int RateNumber;
    String RateDes;
    int UserID;
    byte Active;

    public tblRating() {
    }

    public tblRating(int RatingID, int RateNumber, String RateDes, int UserID, byte Active) {
        this.RatingID = RatingID;
        this.RateNumber = RateNumber;
        this.RateDes = RateDes;
        this.UserID = UserID;
        this.Active = Active;
    }

    public int getRatingID() {
        return RatingID;
    }

    public void setRatingID(int RatingID) {
        this.RatingID = RatingID;
    }

    public int getRateNumber() {
        return RateNumber;
    }

    public void setRateNumber(int RateNumber) {
        this.RateNumber = RateNumber;
    }

    public String getRateDes() {
        return RateDes;
    }

    public void setRateDes(String RateDes) {
        this.RateDes = RateDes;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public byte getActive() {
        return Active;
    }

    public void setActive(byte Active) {
        this.Active = Active;
    }
    
}
