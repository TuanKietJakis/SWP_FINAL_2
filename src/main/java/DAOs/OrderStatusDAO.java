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
public class OrderStatusDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public OrderStatusDAO() throws Exception {
        conn = DatabaseConnection.DatabaseConnection.getConnection();
    } 
        public ResultSet GetAll() {
        try {
            ps = conn.prepareStatement("select * from tblOrderStatus");
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
        }
        return null;
    }
          public int GetTotalCount(int statusID) {
        try {
            ps = conn.prepareStatement("SELECT COUNT(*) FROM tblOrderStatus WHERE StatusID = ?");
            ps.setInt(1, statusID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đảm bảo đóng ResultSet và PreparedStatement
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return 0;
    }
}
