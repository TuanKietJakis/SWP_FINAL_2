/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Kiet
 */
public class vnpayDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public vnpayDAO() throws Exception {
        conn = DatabaseConnection.DatabaseConnection.getConnection();
    }

    public void insertPaymentInfo(String vnp_Amount, String vnp_BankCode, String vnp_BankTranNo,
            String vnp_CardType, String vnp_OrderInfo, String vnp_PayDate, String vnp_ResponseCode) throws Exception {

        String sql = "INSERT INTO vnpay_results (vnp_Amount, vnp_BankCode, vnp_BankTranNo, vnp_CardType, vnp_OrderInfo, vnp_PayDate, vnp_ResponseCode) VALUES (?, ?, ?, ?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, vnp_Amount);
        ps.setString(2, vnp_BankCode);
        ps.setString(3, vnp_BankTranNo);
        ps.setString(4, vnp_CardType);
        ps.setString(5, vnp_OrderInfo);
        ps.setString(6, vnp_PayDate);
        ps.setString(7, vnp_ResponseCode);

        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            System.out.println("Payment information saved successfully");
        } else {
            System.out.println("Failed to save payment information");
        }
    }

}
