/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.tblOrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Kiet
 */
public class OrderDetailDAO {
    
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public OrderDetailDAO() throws Exception {
        conn = DatabaseConnection.DatabaseConnection.getConnection();
    }
    
    public int InsertIntoOrderDetail(tblOrderDetail detail) {
        String sql = "insert into Order_Details\n"
                + "VALUES (?,?,?,?,?,?); ";
        int result = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, detail.getProduct_ID());
//            ps.setString(2, detail.getP_Name());
//            ps.setInt(3, detail.getP_Amount());
//            ps.setInt(4, detail.getP_Price());
//            ps.setInt(5, detail.getOrder_ID());
//            ps.setInt(6, detail.getAccount_ID());
            result = ps.executeUpdate();
        } catch (SQLException ex) {

        }
        return result;
    }
 public ResultSet getOrderDetailFromOrderID(int Order_ID) {
        String sql = "select * from Order_Details\n"
                + "where Order_ID = ?;";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Order_ID);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
        }
        return null;
    }
}
