/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DatabaseConnection.DatabaseConnection;
import Models.tblFAQ;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author khoic
 */
public class FaQDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    /**
     *
     * @throws Exception
     */
    public FaQDAO() throws Exception {
        conn = DatabaseConnection.getConnection();
    }
    
    
    public int AddNewQuest(tblFAQ pr) {
        String sql = "Insert into tblFAQ values(?,?,?)";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pr.getQuestion());
            ps.setString(2, pr.getAnswer());
            ps.setInt(3, 1);
            
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }
      public ResultSet GetAll() {
        try {
            ps = conn.prepareStatement("select * from tblFAQ");
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
        }
        return null;
    }
}
