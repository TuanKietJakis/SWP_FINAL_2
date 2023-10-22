/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DatabaseConnection.DatabaseConnection;
import EncodeMD5.MD5;
import Models.tblUser;
import java.sql.Connection;
import java.sql.Date;
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
     *
     * @param @return
     */
    public int UpdateAccount(String Fullname, String Username, String Mobile_Number, String Email, String Address, String Gender, Date date, int Account_ID) {
        int kq = 0;
        String sql = "UPDATE tblUser\n"
                + "SET  Fullname = ?, Username = ?, Mobile_Number = ?,\n"
                + "Email = ?, Address = ?, Gender = ?, Birthday = ? WHERE Account_ID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, Fullname);
            ps.setString(2, Username);
            ps.setString(3, Mobile_Number);
            ps.setString(4, Email);
            ps.setString(5, Address);
            ps.setString(6, Gender);
            ps.setDate(7, date);
            ps.setInt(8, Account_ID);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    /**
     *
     * @param ID
     * @return
     */
    public int DeleteAccount(int ID) {
        int ketqua = 0;
        String sql = "delete from tblUser where UserID=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
        }
        return ketqua;
    }

    /**
     * Make account an admin
     *
     * @param ID
     * @return
     */
    public int AddAdmin(int ID) {
        String sql = "Update tblUser set RoleID=2 where UserID = ?";
        int result = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    /**
     * Get Account where that Account is not Admin
     *
     * @return
     */
    public ResultSet GetNotAdmin() {
        String sql = "select UserID, FullName, Email from tblUser where RoleID = 1;";
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
                + "where RoleID = 1;";
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
        String sql = "select UserID, Fullname, Email from tblUser where RoleID = 2;";
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
     * Remove account from admin
     *
     * @param ID
     * @return
     */
    public int RemoveAdmin(int ID) {
        String sql = "Update tblUser set RoleID=0 where UserID = ?";
        int result = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    /**
     * Get ID of Account from it fullname
     *
     * @param Fullname
     * @return
     */
    public int GetIDFromUsername(String Username) {
        int ID = 0;
        String sql = "select UserID from tblUser\n"
                + "where Username = ?;";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, Username);
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
                us = new tblUser(rs.getInt("UserID"), rs.getString("Username"), rs.getString("Email"), rs.getString("FullName"), rs.getString("Gender"), rs.getString("PhoneNumber"), rs.getString("Address"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return us;
    }
    public tblUser GetUserID(int ID) {
        tblUser us = new tblUser();
        try {
            ps = conn.prepareStatement("select * from tblUser where tblUser.UserID=?");
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            if (rs.next()) {
                us = new tblUser(rs.getInt("UserID"), rs.getString("Username"), rs.getString("Email"), rs.getString("FullName"), rs.getString("Gender"), rs.getString("PhoneNumber"), rs.getString("DOB"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return us;
    }

    public boolean checkEmail(String email) {
        String query = "SELECT COUNT(*) FROM tblUser WHERE Email = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return false;
    }

    public tblUser forgetpass(String newPassword, String email) {//kiet

        String query = "UPDATE tblUser\n"
                + "SET Password = ? \n"
                + "where Email  = ?";
        try {
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
//            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            ps.setString(1, newPassword);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {

        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
                throw new RuntimeException(e);
            }
        }
        return null;

    }

    public String GetMaxAccountID() {
        String maxID = "";

        try {
            ps = conn.prepareStatement("SELECT MAX(Account_ID) AS MaxID FROM Account");
            rs = ps.executeQuery();
            if (rs.next()) {
                maxID = rs.getString("MaxID");
            }
        } catch (SQLException ex) {

        }
        return maxID;
    }

    public boolean checkUserNameIsExist(String username) {
        try {
            ps = conn.prepareStatement("SELECT UserID FROM tblUser WHERE Username = ?");
            ps.setString(1, username);
            rs = ps.executeQuery();
            return rs.next(); // Return true if there is a result, indicating the username already exists
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
                throw new RuntimeException(e);
            }
        }
        return false;
    }

//    public boolean checkFullnameIsExist(String username) {
//        try {
//            ps = conn.prepareStatement("SELECT UserID FROM tblUser WHERE Fullname = ?");
//            ps.setString(1, username);
//            rs = ps.executeQuery();
//            return rs.next(); // Return true if there is a result, indicating the username already exists
//        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            try {
//                if (conn != null) {
//                    conn.close();
//                }
//                if (ps != null) {
//                    ps.close();
//                }
//                if (rs != null) {
//                    rs.close();
//                }
//            } catch (SQLException e) {
//                System.out.println(e);
//                throw new RuntimeException(e);
//            }
//        }
//        return false;
//    }
//    public static void main(String[] args) throws Exception {
//        AccountDAO acc = new AccountDAO();
//        acc.signup("15", "vy", "vy123", "1", "0123456789", "vy@gmail.com", "abv", "0", "0", "1992-07-06");
//        System.out.println("Add thanh cong ");
//    }
    public void signup(
            String UserName,
            String Password,
            String Email,
            String FullName,
            String Gender,
            String DOB,
            String PhoneNumber,
            int RoleID,
            int Active
    
        ) {

        try {
            ps = conn.prepareStatement("INSERT INTO tblUser VALUES (?,?,?,?,?,?,?,?,?)");

            ps.setString(1, UserName);
            ps.setString(2, EncodeMD5.MD5.encode(Password));
            ps.setString(3, Email);
            ps.setString(4, FullName);
            ps.setString(5, Gender);
            ps.setString(6, DOB);
            ps.setString(7, PhoneNumber);
            ps.setInt(8, RoleID);
            ps.setInt(9, Active);
            ps.executeUpdate();
        } catch (Exception e) {

            System.out.println(e);
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
                throw new RuntimeException(e);

            }
        }
    }
     public int UpdateAccount(String fullname, String username, String dob, String gender, String phone, String email, String address, int UserID) {
        int kq = 0;
        String sql1 = "update tblUser set FullName=?, Username=?,  DOB=?, Gender=?, PhoneNumber=?, Email=? where UserID=?;"
                + "update tblAddress set [Address]=? where UserID=?";
        try {
            ps = conn.prepareStatement(sql1);
            ps.setString(1, fullname);
            ps.setString(2, username);
            ps.setString(3, dob);
            ps.setString(4, gender);
            ps.setString(5, phone);
            ps.setString(6, email);
            ps.setInt(7, UserID);
            ps.setString(8, address);
            ps.setInt(9, UserID);
            kq = ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }
}

