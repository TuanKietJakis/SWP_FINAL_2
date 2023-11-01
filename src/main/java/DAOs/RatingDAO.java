/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Kiet
 */
public class RatingDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public RatingDAO() throws Exception {
        conn = DatabaseConnection.DatabaseConnection.getConnection();
    }

    public ResultSet GetAll() {
        try {
            ps = conn.prepareStatement("select * from tblRating");
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
        }
        return null;
    }

    public ResultSet getRateNumberByRateID(int RatingID) {
        try {
            ps = conn.prepareStatement("select * from tblRating where RatingID = ?");
            ps.setInt(1, RatingID);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
            return null;
        }
    }

    public boolean insertRating(int productID, int rateNumber, String rateDes, int userID) {
        try {
            String sql = "INSERT INTO tblRating VALUES (?, ?, ?, ?,?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, productID);
            ps.setInt(2, rateNumber);
            ps.setString(3, rateDes);
            ps.setInt(4, userID);
            ps.setInt(5, 1);
            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean insertActiveToOrderDetail(int OrderID, int ProductID) {
        try {
            String sql = "UPDATE  tblOrderDetail set Active = 2 where OrderID =? and ProductID=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, OrderID);
            ps.setInt(2, ProductID);

            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
