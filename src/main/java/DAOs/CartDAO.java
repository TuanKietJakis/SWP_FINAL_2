/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DatabaseConnection.DatabaseConnection;
import Models.tblCart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kiet
 */
public class CartDAO {
      private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public CartDAO() throws Exception {
        conn = DatabaseConnection.getConnection();
    }
    
    public ResultSet ShowCartByID(int UserID) {
        String sql = "select * from tblCart\n"
                + "where UserID = ?;";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, UserID);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
        }
        return null;
    }
    public tblCart CompareAmount(int CartID) {
        tblCart cart = new tblCart();
        try {
        String sql = "select tblCart.CartID, tblCart.ProductID, ProductAmount, Quantity from tblCart inner join tblProduct on tblProduct.ProductID = tblCart.ProductID where CartID=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, CartID);
            rs = ps.executeQuery();
            System.out.println(rs);
            if (rs.next()) {
            cart = new tblCart(rs.getInt("CartID"), rs.getInt("ProductID"), rs.getInt("ProductAmount"), rs.getInt("Quantity"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cart;
    }
    
    public int Delete(int ID) {
        int result = 0;
        String sql = "DELETE FROM tblCart WHERE CartID=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            
        }
        return result;
    }
    public int UpdateCartAmount(int ProductAmount, int CardID) {
        int result = 0;
        String sql = "update tblCart SET ProductAmount=? where CartID = ?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ProductAmount);
            ps.setInt(2, CardID);
            result = ps.executeUpdate();
        } catch (Exception e) {
        }
        return result;
    }
}
