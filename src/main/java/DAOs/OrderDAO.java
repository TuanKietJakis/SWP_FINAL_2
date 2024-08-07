/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.tblOrder;
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

    public ResultSet GetOrderDetailsByUserID(int UserID) {
        try {
            String sql = "SELECT o.OrderID, o.OrderDate, p.ProductName, p.Price as ProductPrice, "
                    + "od.Quantity, o.TotalPrice, p.ProductImageURL, p.ProductID,od.Active "
                    + "FROM tblOrder o "
                    + "INNER JOIN tblOrderDetail od ON o.OrderID = od.OrderID "
                    + "INNER JOIN tblProduct p ON od.ProductID = p.ProductID "
                    + "WHERE o.UserID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, UserID);
            rs = ps.executeQuery();
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
//2023-10-22

    public ResultSet GetIncomeOnDay(String Day) {
        String sql = "SELECT \n"
                + "    CONVERT(DATE, o.OrderDate, 103) as OrderDay,\n"
                + "    SUM(p.Price) as TotalProductPrice, \n"
                + "    SUM(p.Cost) as TotalProductCost\n"
                + "FROM tblOrder o \n"
                + "INNER JOIN tblOrderDetail od ON o.OrderID = od.OrderID\n"
                + "INNER JOIN tblProduct p ON od.ProductID = p.ProductID\n"
                + "WHERE CONVERT(DATE, o.OrderDate, 103) = ?\n"
                + "GROUP BY CONVERT(DATE, o.OrderDate, 103)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, Day);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
        }
        return null;
    }

    public ResultSet GetIncomeOnMonth(String StartMonth, String EndMonth) {

        String sql = "SELECT \n"
                + "    SUM(TotalProductPrice) as GrandTotalProductPrice, \n"
                + "    SUM(TotalProductCost) as GrandTotalProductCost\n"
                + "FROM (\n"
                + "    SELECT \n"
                + "        CONVERT(DATE, o.OrderDate, 103) as OrderDay,\n"
                + "        SUM(p.Price) as TotalProductPrice, \n"
                + "        SUM(p.Cost) as TotalProductCost\n"
                + "    FROM tblOrder o \n"
                + "    INNER JOIN tblOrderDetail od ON o.OrderID = od.OrderID\n"
                + "    INNER JOIN tblProduct p ON od.ProductID = p.ProductID\n"
                + "    WHERE CONVERT(DATE, o.OrderDate, 103) BETWEEN ? AND ? \n"
                + "    GROUP BY CONVERT(DATE, o.OrderDate, 103)\n"
                + ") AS Subquery";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, StartMonth);
            ps.setString(2, EndMonth);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
        }
        return null;
    }

    public ResultSet GetBillOnMonth(String Month, String Month2) {

        String sql = "SELECT o.OrderID, FORMAT(CONVERT(datetime, o.OrderDate, 103), 'yyyy-MM-dd') as OrderDate, p.ProductName, p.Price as ProductPrice, p.Cost as ProductCost,\n"
                + "od.Quantity, o.TotalPrice, p.ProductID, od.Active, r.RateNumber,o.FullName,u.Email,o.PhoneNumber\n"
                + "FROM tblOrder o \n"
                + "INNER JOIN tblOrderDetail od ON o.OrderID = od.OrderID\n"
                + "INNER JOIN tblProduct p ON od.ProductID = p.ProductID\n"
                + "LEFT JOIN tblRating r ON od.ProductID = r.ProductID AND o.UserID = r.UserID\n"
                + "LEFT JOIN tblUser u ON o.UserID = u.UserID\n"
                + "WHERE CONVERT(datetime, o.OrderDate, 103) >= ? AND CONVERT(datetime, o.OrderDate, 103) < ?";

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, Month);
            ps.setString(2, Month2);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ResultSet GetBillOnDay(String Day) {
        String sql = "SELECT o.OrderID, CONVERT(datetime, o.OrderDate, 103) as OrderDate, p.ProductName, p.Price as ProductPrice, p.Cost as ProductCost,\n"
                + "                  od.Quantity, o.TotalPrice, p.ProductID, od.Active,o.FullName,u.Email,o.PhoneNumber\n"
                + "            FROM tblOrder o \n"
                + "           INNER JOIN tblOrderDetail od ON o.OrderID = od.OrderID\n"
                + "           INNER JOIN tblProduct p ON od.ProductID = p.ProductID\n"
                + "            LEFT JOIN tblRating r ON od.ProductID = r.ProductID AND o.UserID = r.UserID\n"
                + "            LEFT JOIN tblUser u ON o.UserID = u.UserID\n"
                + "           WHERE CONVERT(date, o.OrderDate, 103) = ? ";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, Day);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
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

    public int AddOrderFromCart(tblOrder order) {
        String sql = "insert into tblOrder values(?,?,?,?,?,?,?,?,?)";
        int result = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, order.getUserID());
            ps.setString(2, order.getFullName());
            ps.setString(3, order.getOrderDate());
            ps.setInt(4, order.getTotalPrice());
            ps.setString(5, order.getPhoneNumber());
            ps.setString(6, order.getOrderAddress());
            ps.setInt(7, order.getStatusID());
            ps.setInt(8, order.getPaymentMethodID());
            ps.setInt(9, order.getActive());
            result = ps.executeUpdate();
        } catch (SQLException ex) {

        }
        return result;
    }

    public int GetOrderID(String orderTime, int UserID) {
        int kq = 0;
        String sql = "select * from tblOrder where UserID = ? and OrderDate = ?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setString(2, orderTime);
            rs = ps.executeQuery();
            if (rs.next()) {
                kq = rs.getInt("OrderID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return kq;
    }

    public ResultSet GetAllOrder() {
        try {
            String sql = "select * from tblOrder\n"
                    + "inner join tblOrderStatus on tblOrderStatus.StatusID = tblOrder.StatusID order by tblOrder.StatusID asc";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (Exception e) {
        }
        return null;
    }

    public int GetOrderIDQuantity(int OrderID) {
        int kq = 0;
        try {
            String sql = "SELECT count(Quantity) AS TotalQuantity \n"
                    + "FROM tblOrderDetail where OrderID = ? \n"
                    + "GROUP BY OrderID\n";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,OrderID);
            rs = ps.executeQuery();
           if(rs.next()){
               kq = rs.getInt("TotalQuantity");
           }
        } catch (Exception e) {
        }
        return kq;
    }

    public int GetTotalOrder() {
        int count = 0;
        try {

            String sql = "select count(OrderID) as TotalOrder from tblOrder";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("TotalOrder");
            }
        } catch (Exception e) {
        }
        return count;
    }

    public ResultSet GetOrderInfoByID(int OrderID) {
        try {
            String sql = "select tblOrderDetail.ProductID, ProductName, tblOrderDetail.Quantity,Price from tblOrderDetail\n"
                    + "inner join tblProduct on tblProduct.ProductID = tblOrderDetail.ProductID\n"
                    + "where OrderID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, OrderID);
            rs = ps.executeQuery();
            return rs;
        } catch (Exception e) {
        }
        return null;
    }

    public int GetPaymentMethodbyID(int OrderID) {
        int count = 0;
        try {
            String sql = "select PaymentMethodID from tblOrder\n"
                    + "where OrderID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, OrderID);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("PaymentMethodID");
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int RejectOrder(int orderID) {
        int result = 0;
        try {
            String sql = "Update tblOrder set StatusID = 3 where OrderID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, orderID);
            result = ps.executeUpdate();
        } catch (Exception e) {
        }
        return result;
    }
    public ResultSet getOrderDetail(int OrderID){
        String sql = "select * from tblOrderDetail where OrderID = ?;";
        try{
            ps = conn.prepareStatement(sql);
            ps.setInt(1, OrderID);
            rs = ps.executeQuery();
            return rs;
        }catch(SQLException e){
            
        }
        return null;
    }
    public int getProductQuan(int ProductID){
        int kq = 0;
        String sql = "select Quantity from tblProduct where ProductID = ?";
        try{
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ProductID);
            rs = ps.executeQuery();
            if(rs.next()){
                kq = rs.getInt("Quantity");
            }
        }catch(SQLException e){
            
        }
        return kq;
    }
    public int updateQuantityProduct(int ProductID,int Amount,int Quantity){
        int kq = 0;
        int total = Quantity + Amount;
        String sql = "update tblProduct set Quantity = ? where ProductID = ?";
        try{
            ps = conn.prepareStatement(sql);
            ps.setInt(1, total);
            ps.setInt(2, ProductID);
            kq = ps.executeUpdate();
        }catch(SQLException r){
            
        }
        return kq;
    }

    public int AcceptOrder(int orderID) {
        int result = 0;
        try {
            String sql = "Update tblOrder set StatusID = 2 where OrderID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, orderID);
            result = ps.executeUpdate();
        } catch (Exception e) {
        }
        return result;
    }

    public int GetTotalProductbyOrderID(int OrderID) {
        int count = 0;
        try {
            String sql = "SELECT COUNT( ProductID) AS ProductIDCount FROM tblOrderDetail\n"
                    + "Where OrderID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, OrderID);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("ProductIDCount");
            }
        } catch (Exception e) {
        }
        return count;
    }
}
