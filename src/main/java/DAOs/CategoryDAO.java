/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.tblCategory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Kiet
 */
public class CategoryDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public CategoryDAO() throws Exception {
        conn = DatabaseConnection.DatabaseConnection.getConnection();
    }

    public ResultSet GetAllBrand() {
        try {
            ps = conn.prepareStatement("select * from tblBrand where Active = 1;");
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
        }
        return null;
    }
    public ResultSet GetAllCategory() {
        try {
            ps = conn.prepareStatement("select * from tblCategory where Active = 1;");
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
        }
        return null;
    }

    public ResultSet GetAll() {
        try {
            ps = conn.prepareStatement("select * from tblCategory");
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
        }
        return null;
    }

    public int AddNewCategory(tblCategory pro) {
        String sql = "insert into tblCategory values(?,?)";
        int result = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pro.getCatName());
            ps.setInt(2, pro.getActive());

            result = ps.executeUpdate();
        } catch (SQLException ex) {

        }
        return result;
    }

    public boolean isCategoryExists(String Category) {
        try {
            String sql = "SELECT COUNT(*) FROM tblCategory WHERE CatName = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, Category);
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
    
     public ResultSet getCategoryNameByCategoryID(int CategoryID){
          try{
              ps = conn.prepareStatement("select * from tblCategory where CategoryID = ?");
              ps.setInt(1, CategoryID);
              rs = ps.executeQuery();
              return rs;
          }catch (SQLException e){
              return null;
          }
      }
}
