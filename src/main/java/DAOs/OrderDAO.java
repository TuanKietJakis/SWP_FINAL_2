/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Kiet
 */
public class OrderDAO {
       private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public OrderDAO() throws Exception {
        conn = DatabaseConnection.DatabaseConnection.getConnection();
    }
      public int GetIncome() {
        int count = 0;
        String sql = "select sum(TotalPrice) as Income from tblOrder\n"
                + "where StatusID = 1;";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("Income");
            }
        } catch (SQLException e) {
        }
        return count;
    }

    public int GetNewOrder() {
        int count = 0;
        String sql = "select count OrderID as NewOrder from tblOrder\n"
                + "where StatusID = 3 or StatusID =2;";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("NewOrder");
            }
        } catch (SQLException e) {
        }
        return count;
    }
    
       public ResultSet GetOrderInfo(int Status) {
        String sql = "select Order_ID,Total_Price,Phone_Number,Delivery_Instruction,Delivery_Address,Delivery_Time, \n"
                + "Account.Fullname as fn, Account.Email as email, Payment_Method.Payment_Method as Pay_Met, Order_Status.Order_Status as [Status] from [Order]\n"
                + "inner join Account on Account.Account_ID = [Order].Account_ID\n"
                + "inner join Payment_Method on Payment_Method.Payment_Method_ID = [Order].Payment_Method_ID\n"
                + "inner join Order_Status on Order_Status.Order_Status_ID = [Order].Order_Status_ID where [Order].Order_Status_ID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Status);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
        }
        return null;
    }

    public ResultSet GetSpecificOrderInfo(int ID) {
        String sql = "select Order_ID, Total_Price,Phone_Number,Delivery_Instruction,Delivery_Address,Delivery_Time, \n"
                + "Account.Fullname as fn, Account.Email as email, Payment_Method.Payment_Method as Pay_Met, Order_Status.Order_Status as [Status] from [Order]\n"
                + "inner join Account on Account.Account_ID = [Order].Account_ID\n"
                + "inner join Payment_Method on Payment_Method.Payment_Method_ID = [Order].Payment_Method_ID\n"
                + "inner join Order_Status on Order_Status.Order_Status_ID = [Order].Order_Status_ID where [Order].Order_ID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
        }
        return null;
    }
    
    public ResultSet GetSpecificOrderInfoCustomer(int ID) {
        String sql = "select Order_ID, Total_Price,Phone_Number,Delivery_Instruction,Delivery_Address,Delivery_Time, \n"
                + "Account.Fullname as fn, Account.Email as email, Payment_Method.Payment_Method as Pay_Met, Order_Status.Order_Status as [Status] from [Order]\n"
                + "inner join Account on Account.Account_ID = [Order].Account_ID\n"
                + "inner join Payment_Method on Payment_Method.Payment_Method_ID = [Order].Payment_Method_ID\n"
                + "inner join Order_Status on Order_Status.Order_Status_ID = [Order].Order_Status_ID where Account.Account_ID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
        }
        return null;
    }
       public int CompleteOrder(int O_ID, Date time) {
        String sql = "Update [Order]\n"
                + "set Order_Status_ID = 1 , Delivery_Time = ?\n"
                + "where Order_ID = ?";        
        int result = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setDate(1, time);
            ps.setInt(2, O_ID);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            
        }
        return result;
    }
}
