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
import java.util.logging.Level;

/**
 *
 * @author TRA MY NGUYEN
 */
public class WishListDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public WishListDAO() throws Exception {
        this.conn = DatabaseConnection.getConnection();
    }

    public ResultSet GetAll(int UserID) {
        try {
            String sql = "select * from tblWishList w\n"
                    + "  join tblProduct p on w.ProductID=p.ProductID\n"
                    + "  join tblCategory c on c.CategoryID=p.CategoryID where w.UserID= ?";
       
            ps = conn.prepareStatement(sql);
            ps.setInt(1, UserID);
            rs = ps.executeQuery();
            return rs;
            
            
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(WishListDAO.class.getName()).log(Level.SEVERE, null, ex);
        }return null;
    }
    public int Delete(int wishListId){
        int kq=0;
        try {
            ps = conn.prepareStatement("Delete tblWishList where WishListId=?");
            ps.setInt(1, wishListId);
            kq = ps.executeUpdate();
            return kq;
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(WishListDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }
    
    
}

