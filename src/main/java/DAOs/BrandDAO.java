/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.tblBrand;
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

    public BrandDAO() throws Exception {
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

    public int AddNewBrand(tblBrand brand) {
        String sql = "insert into tblBrand values(?,?)";
        int result = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, brand.getBrandName());
            ps.setInt(2, brand.getActive());

            result = ps.executeUpdate();
        } catch (SQLException ex) {

        }
        return result;
    }

    public boolean isBrandExists(String brandName) {
        try {
            String sql = "SELECT COUNT(*) FROM tblBrand WHERE brandName = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, brandName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public ResultSet getNameBrandByBrandID(int BrandID) {
        try {
            ps = conn.prepareStatement("SELECT * FROM tblBrand WHERE BrandID = ?");
            ps.setInt(1, BrandID);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
            return null;
        }
    }

}
