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
public class ProductDAO {
      private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ProductDAO() throws Exception {
        conn = DatabaseConnection.DatabaseConnection.getConnection();
    }
}
