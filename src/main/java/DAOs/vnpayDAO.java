/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.tblCart;
import Models.tblOrder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Kiet
 */
public class vnpayDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public vnpayDAO() throws Exception {
        conn = DatabaseConnection.DatabaseConnection.getConnection();
    }

    public int AddOrderFromCart(int vnp_UserID, String vnp_FullName, String formattedDate, int vnp_Amount,
             String vnp_PhoneNumber, String vnp_Address) {
        String sql = "insert into tblOrder values(?,?,?,?,?,?,?,?,?)";
        int result = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, vnp_UserID);
            ps.setString(2, vnp_FullName);
            ps.setString(3, formattedDate);
            ps.setInt(4, vnp_Amount);
            ps.setString(5, vnp_PhoneNumber);
            ps.setString(6, vnp_Address);
            ps.setInt(7, 1);
            ps.setInt(8, 1);
            ps.setInt(9, 1);
            result = ps.executeUpdate();
        } catch (SQLException ex) {

        }
        return result;
    }

    public int GetOrderID(String orderTime, int UserID) {
        int kq = 0;
        String sql = "select * from tblOrder where UserID = ? and OrderDate = ?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setString(2, orderTime);
            rs = ps.executeQuery();
            if (rs.next()) {
                kq = rs.getInt("OrderID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return kq;
    }
    
     public int AddOrderDetail(tblCart item, int OrderID){
        String sql = "insert into tblOrderDetail values(?,?,?,?,?)";
        int result = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, OrderID);
            ps.setInt(2, item.getProductID());
            ps.setInt(3, item.getProductPrice());
            ps.setInt(4, item.getProductAmount());
            ps.setInt(5, 1);
            result = ps.executeUpdate();
        } catch (SQLException ex) {

        }
        return result;
    }
    

}
