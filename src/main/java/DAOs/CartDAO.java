/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DatabaseConnection.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
