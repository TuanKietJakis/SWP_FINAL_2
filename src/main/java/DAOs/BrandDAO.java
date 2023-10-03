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
public class BrandDAO {
      private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public BrandDAO() throws Exception{
        conn = DatabaseConnection.DatabaseConnection.getConnection();
    }
     public ResultSet GetAll() {
        try {
            ps = conn.prepareStatement("select * from tblBrand");
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
        }
        return null;
    }
}
