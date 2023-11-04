/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DatabaseConnection.DatabaseConnection;
import Models.tblAddress;
import Models.tblCart;
import Models.tblProduct;
import Models.tblWishList;
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

    public ResultSet ShowCartRecently(int UserID) {
        String sql = "select * from (select ProductID,ProductImageURL,ProductName,ProductPrice,ROW_NUMBER() OVER (ORDER BY CartID DESC) AS Rank from tblCart where UserID = ? ) tmp where rank <= 3;";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, UserID);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
        }
        return null;
    }

    public int showNumberItem(int UserID) {
        int kq = 0;
        String sql = "SELECT COUNT(CartID) as numberItem FROM tblCart where UserID = ?;";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, UserID);
            rs = ps.executeQuery();
            if (rs.next()) {
                kq = rs.getInt("numberItem");
            }
        } catch (SQLException e) {
        }
        return kq;
    }

    public tblCart CompareAmount(int CartID) {
        tblCart cart = new tblCart();
        try {
            String sql = "select tblCart.CartID, tblCart.ProductID, ProductAmount, Quantity from tblCart inner join tblProduct on tblProduct.ProductID = tblCart.ProductID where CartID=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, CartID);
            rs = ps.executeQuery();
            if (rs.next()) {
                cart = new tblCart(rs.getInt("CartID"), rs.getInt("ProductID"), rs.getInt("ProductAmount"), rs.getInt("Quantity"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cart;
    }

    public int UpdateProductQuantity(int ProductAmount, int Quantity, int ProductID) {
        int kq = 0;
        try {
            String sql = "update tblProduct SET Quantity=? where ProductID = ?;";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Quantity - ProductAmount);
            ps.setInt(2, ProductID);
            kq = ps.executeUpdate();
        } catch (SQLException e) {

        }
        return kq;
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
    public int DeleteWishlist(int ID) {
        int result = 0;
        String sql = "DELETE FROM tblWishList WHERE WishListID=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            result = ps.executeUpdate();
        } catch (SQLException ex) {

        }
        return result;
    }

    public int DeleteAllIteminCart(int ID) {
        int result = 0;
        String sql = "DELETE FROM tblCart WHERE UserID=?";
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

    public tblProduct getProductforAdd(int ID) {
        tblProduct pro = null;
        try {
            ps = conn.prepareStatement("select * from tblProduct\n"
                    + "where ProductID = ?;");
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            if (rs.next()) {
                pro = new tblProduct(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("Price"), rs.getString("ProductImageURL"));
            }
        } catch (Exception e) {
        }
        return pro;
    }

    public int AddNewCart(int UserID, tblProduct pro, int Amount) {
        String sql = "insert into tblCart values(?,?,?,?,?,?,?)";
        int result = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setInt(2, pro.getProductID());
            ps.setString(3, pro.getProductName());
            ps.setInt(4, pro.getPrice());
            ps.setInt(5, Amount);
            ps.setString(6, pro.getProductImageURL());
            ps.setInt(7, 1);
            result = ps.executeUpdate();
        } catch (SQLException ex) {

        }
        return result;
    }
    public int AddNewWishList(int UserID, tblProduct pro) {
        String sql = "insert into tblWishList values(?,?,?,?,?)";
        int result = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setInt(2, pro.getProductID());
            ps.setString(3, pro.getProductName());
            ps.setInt(4, pro.getPrice());
            ps.setString(5, pro.getProductImageURL());
            result = ps.executeUpdate();
        } catch (SQLException ex) {

        }
        return result;
    }

    public int AddNewCarttoWishList(int UserID, tblProduct pro) {
        String sql = "insert into tblCart values(?,?,?,?,?,?,?)";
        int result = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setInt(2, pro.getProductID());
            ps.setString(3, pro.getProductName());
            ps.setInt(4, pro.getPrice());
            ps.setInt(5, 1);
            ps.setString(6, pro.getProductImageURL());
            ps.setInt(7, 1);
            result = ps.executeUpdate();
        } catch (SQLException ex) {

        }
        return result;
    }

    public int AddAddress(int UserID, String Name, String Phone, int Payment, String Address) {
        
        String sql = "insert into tblAddress values(?,?,?,?,?,?)";
        int result = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setString(2, Address);
            ps.setInt(3, 1);
            ps.setString(4, Phone);
            ps.setString(5, Name);
            ps.setInt(6, Payment);
            result = ps.executeUpdate();
        } catch (SQLException ex) {

        }
        return result;
    }
    public int UdateAddress(int AddressID, String Name, String Phone, int Payment, String Address) {
        
        String sql = "update tblAddress set [Address]=?,PhoneNumber = ?, FullName = ?,PaymentMethodID = ? where AddressID = ?;";
        int result = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, Address);
            ps.setString(2, Phone);
            ps.setString(3, Name);
            ps.setInt(4, Payment);
            ps.setInt(5, AddressID);
            result = ps.executeUpdate();
        } catch (SQLException ex) {

        }
        return result;
    }
    public int hideAddress(int addressID){
        String sql = "update tblAddress set Active = 0 where AddressID = ?;";
        int result = 0;
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, addressID);
            result = ps.executeUpdate();
        }catch(SQLException e){
            
        }
        return result;
    }
//    public int getAddressfromUserID(int UserID, String Name) {
//        String sql = "insert into tblCart values(?,?,?,?,?,?)";
//        int result = 0;
//        try {
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, UserID);
//            ps.setString(2, Address);
//            ps.setInt(3, 1);
//            ps.setString(4, Phone);
//            ps.setString(5, Name);
//            ps.setInt(6, Payment);
//            result = ps.executeUpdate();
//        } catch (SQLException ex) {
//
//        }
//        return result;
//    }

    public ResultSet getAllAddress(int UserID) {
        String sql = "select * from tblAddress where UserID = ? and active = 1;";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, UserID);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {

        }
        return null;
    }

    public tblAddress getAddress(int AddressID) {
        tblAddress address = null;
        String sql = "select * from tblAddress where AddressID = ?;";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, AddressID);
            rs = ps.executeQuery();
            if (rs.next()) {
                address = new tblAddress(rs.getInt("AddressID"), rs.getInt("UserID"), rs.getString("Address"), rs.getByte("Active"), rs.getString("PhoneNumber"), rs.getString("FullName"), rs.getByte("PaymentMethodID"));
            }
        } catch (SQLException e) {

        }
        return address;
    }

    public tblCart getItemforAdd(int CartID) {
        tblCart item = new tblCart();
        try {
            ps = conn.prepareStatement("select ProductID,ProductPrice,ProductAmount from tblCart where CartID=?;");
            ps.setInt(1, CartID);
            rs = ps.executeQuery();
            if (rs.next()) {
                item = new tblCart(rs.getInt("ProductID"), rs.getInt("ProductPrice"), rs.getInt("ProductAmount"));
            }
        } catch (Exception e) {
        }
        return item;
    }

    public tblCart getCartTheSame(int ProductID, int UserID) {
        tblCart cart = new tblCart();
        String sql1 = "select * from tblCart where ProductID=? and UserID = ?;";
        try {
            ps = conn.prepareStatement(sql1);
            ps.setInt(1, ProductID);
            ps.setInt(2, UserID);
            rs = ps.executeQuery();
            if (rs.next()) {
                cart = new tblCart(rs.getInt("CartID"), rs.getInt("UserID"), rs.getInt("ProductID"), "", 0, rs.getInt("ProductAmount"), "");
            }
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return cart;
    }
    public tblWishList getWishlistTheSame(int ProductID, int UserID) {
        tblWishList cart = new tblWishList();
        String sql1 = "select * from tblWishList where ProductID=? and UserID = ?;";
        try {
            ps = conn.prepareStatement(sql1);
            ps.setInt(1, ProductID);
            ps.setInt(2, UserID);
            rs = ps.executeQuery();
            if (rs.next()) {
                cart = new tblWishList(rs.getInt("WishListID"), rs.getInt("UserID"), rs.getInt("ProductID"));
            }
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return cart;
    }

    public int UpdateCombineAmount(int ProductID, int UserID, int Amount1, int Amount2) {
        int kq = 0;
        int CountAmount = Amount1 + Amount2;
        String sql = "Update tblCart set ProductAmount=? where ProductID = ? and UserID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, CountAmount);
            ps.setInt(2, ProductID);
            ps.setInt(3, UserID);
            kq = ps.executeUpdate();
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return kq;
    }

    public int getAmountFromCart(int ProductID, int UserID) {
        String sql = "select ProductAmount from tblCart where UserID = ? and ProductID = ?";
        int kq = 0;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setInt(2, ProductID);
            rs = ps.executeQuery();
            if (rs.next()) {
                kq = rs.getInt("ProductAmount");
            }
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return kq;
    }

}

