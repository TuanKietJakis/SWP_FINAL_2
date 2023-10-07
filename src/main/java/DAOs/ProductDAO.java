/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.tblProduct;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kiet CHUA XONG NHAAAAAAAAA
 */
public class ProductDAO {
      private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ProductDAO() throws Exception {
        conn = DatabaseConnection.DatabaseConnection.getConnection();
    }
    
    public tblProduct getInfoForUpdating(int ID) {
        tblProduct pro = null;
        try {
            ps = conn.prepareStatement("select * from Product\n"
                    + "where Product_ID = ?;");
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            if (rs.next()) {
//                pro = new tblProduct(rs.getInt("Product_ID"), rs.getInt("Catagory_ID"), rs.getString("P_Name"), rs.getString("P_Status"), rs.getString("P_Price"),
//                        rs.getInt("Brand_ID"), rs.getString("P_Size"), rs.getString("P_Country"));
            }
        } catch (Exception e) {
        }
        return pro;
    }
      public int UpdateProduct(tblProduct pro) {
        String a, b, c, d, e, f;
//        int ID = pro.getProduct_ID();
//        b = pro.getP_price();
//        int Cat = pro.getCategory_ID();
//        int rb = pro.getBrand_ID();
//        int price = Integer.parseInt(b);
//        a = pro.getP_name();
//        c = pro.getP_availability();
//        d = pro.getP_size();
//        e = pro.getP_Country();
        String sql = "Update Product set Product_ID = ?, Catagory_ID = ?, P_Name = ?, P_Status = ?, P_Price = ? ,Brand_ID = ?, P_Size = ?, P_Country = ? where Product_ID = ?";
        int result = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, pro.getProduct_ID());
//            ps.setInt(2, pro.getCategory_ID());
//            ps.setString(3, pro.getP_name());
//            ps.setString(4, pro.getP_availability());
//            ps.setInt(5, price);
//            ps.setInt(6, pro.getBrand_ID());
//            ps.setString(7, pro.getP_size());
//            ps.setString(8, pro.getP_Country());
//            ps.setInt(9, pro.getProduct_ID());
            result = ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
        
    }
     public int Delete(int ID) {
        int ketqua = 0;
        String sql = "delete from Product where Product_ID=?";
        try {
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, ID);
//            String URL = GetImageURL(ID);
//            DeleteImage(URL);
//            DeleteImageDB(ID);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
        }
        return ketqua;
    }
     
        public String GetImageURL(int ID) {
        String sql = "Select Image_URL from Product_Image where Product_ID = ?";
        String URL = "";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            if (rs.next()) {
                URL = rs.getString("Image_URL");
            }
        } catch (SQLException ex) {

        }
        return URL;
    }
        
         public int GetLastImageID() {
        String sql = " Select max(Image_ID) as highest from Product_Image";
        int digit = 0;
        String ID = null;
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                ID = rs.getString("highest");
            }
            if (ID == null) {
                ID = "1";
            }
            digit = Integer.parseInt(ID);
            digit = digit + 1;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return digit;
    }   
         public int DeleteImageDB(int ID) {
        int ketqua = 0;
        String sql = "delete from Product_Image where Product_ID=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
        }
        return ketqua;
    }

    public int AddNew(tblProduct pro) {
        String sql = "insert into Product values(?,?,?,?,?,?,?,?)";
        int result = 0;
        try {
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, pro.getProduct_ID());
//            ps.setInt(2, pro.getBrand_ID());
//            ps.setInt(3, pro.getCategory_ID());
//            ps.setString(4, pro.getP_name());
//            ps.setString(5, pro.getP_availability());
//            ps.setInt(6, Integer.parseInt(pro.getP_price()));
//            ps.setString(7, pro.getP_size());
//            ps.setString(8, pro.getP_Country());
            result = ps.executeUpdate();
        } catch (SQLException ex) {

        }
        return result;
    }

    public int AddImage(tblProduct PImg) {
        String sql = "insert into Product_Image values(?,?,?)";
        int result = 0;
        try {
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, PImg.getImage_ID());
//            ps.setInt(2, PImg.getProduct_ID());
//            ps.setString(3, PImg.getImage_URL());
            result = ps.executeUpdate();
        } catch (SQLException ex) {

        }
        return result;
    }
}
