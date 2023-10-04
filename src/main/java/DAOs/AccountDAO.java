/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DatabaseConnection.DatabaseConnection;
import EncodeMD5.MD5;
import Models.tblUser;
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
public class AccountDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    /**
     *
     * @throws Exception
     */
    public AccountDAO() throws Exception {
        conn = DatabaseConnection.getConnection();
    }

    /**
     * Get All form Account where Account_ID = ?
     *
     * @param ID
     * @return
     */
    public ResultSet GetAll(int ID) {
        try {
            ps = conn.prepareStatement("select * from tblUser where UserID=?");
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
        }
        return null;
    }

    /**
     * Get Account where that Account is not Admin
     *
     * @return
     */
    public ResultSet GetNotAdmin() {
        String sql = "select UserID, Fullname, Email from Account where Role = 1;";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
        }
        return null;
    }

    /**
     *
     * @return
     */
    public int GetCountAccount() {
        int count = 0;
        String sql = "select count(UserID) as [counter] from tblUser\n"
                + "where Role = 1;";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("counter");
            }
        } catch (SQLException e) {
        }
        return count;
    }

    /**
     * Login check if the username and password is available and if it's
     * available in the database
     *
     * @param acc
     * @return
     * @throws SQLException
     */
    public boolean Login(tblUser acc) throws SQLException {
        String sql = "SELECT * FROM tblUser WHERE Username=? AND Password=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, acc.getUserName());
            ps.setString(2, MD5.encode(acc.getPassword()));
            rs = ps.executeQuery();
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs.next();
    }

    /**
     * Get Account where that Account is Admin
     *
     * @return
     */
    public ResultSet GetAdmin() {
        String sql = "select UserID, Fullname, Email from tblUser where Role = 1;";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
        }
        return null;
    }

    /**
     *
     * @param username
     * @return
     */
    public boolean IsAdmin(String username) {
        String sql = "SELECT RoleID FROM tblUser WHERE Username = ?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int RoleID = rs.getInt("RoleID");
                return (RoleID == 2);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     *
     * @param Account_ID
     * @param Fullname
     * @param Username
     * @param Password
     * @param Mobile_Number
     * @param Email
     * @param Address
     * @param IsAdmin
     */
    /**
     *
     * @param acc
     * @return
     */
    /**
     *
     * @param username
     * @return
     */
    public String GetFullName(String username) {
        String fullname = null;

        try {
            ps = conn.prepareStatement("select Fullname from tblUser where Username=?");
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                fullname = rs.getString("Fullname");
            }
        } catch (SQLException ex) {

        }
        return fullname;

    }

    /**
     * Get ID of Account from it fullname
     *
     * @param Fullname
     * @return
     */
    public int GetIDFromFullname(String Fullname) {
        int ID = 0;
        String sql = "select UserID from tblUser\n"
                + "where Fullname = ?;";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, Fullname);
            rs = ps.executeQuery();
            if (rs.next()) {
                ID = rs.getInt("UserID");
            }
        } catch (SQLException e) {
        }
        return ID;
    }
    public tblUser GetCartByUserID(int ID) {
        tblUser us = new tblUser();
        try {
            ps = conn.prepareStatement("select * from tblUser inner join tblAddress on tblUser.UserID = tblAddress.UserID where tblUser.UserID=?");
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            if (rs.next()) {
                us = new tblUser(rs.getInt("UserID") , rs.getString("Username"), rs.getString("Email"), rs.getString("FullName"), rs.getString("Gender"), rs.getString("PhoneNumber") , rs.getString("Address")) ;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return us;
    }
}
