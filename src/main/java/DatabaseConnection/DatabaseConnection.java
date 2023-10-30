///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package DatabaseConnection;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//
///**
// *
// * @author User
// */
//public class DatabaseConnection {
//
//    private static Connection conn = null;
//    //tuankiet:"jdbc:sqlserver://DESKTOP-1JMA68C\\\\ADMIN:1433;databaseName=PerfumeShopV3;"
//    //+ "user=sa;password=123;encrypt=true;trustServerCertificate=true;"
//    public static Connection getConnection() throws Exception {
//        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        conn = DriverManager.getConnection("jdbc:sqlserver://HAIDANG:1433;"
//                    + "databaseName=FFShop;"
//                    + "user=sa;password=123456;"
//                    + "encrypt=true;"
//                    + "trustServerCertificate=true;"
//                    + "sendStringParametersAsUnicode=true;");
//
//        return conn;
//    }
//}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DatabaseConnection;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author User
 */
public class DatabaseConnection {

    private static Connection conn = null;

    //tuankiet:"jdbc:sqlserver://DESKTOP-1JMA68C\\\\ADMIN:1433;databaseName=PerfumeShopV3;"
    //+ "user=sa;password=123;encrypt=true;trustServerCertificate=true;"
    public static Connection getConnection() throws Exception {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        conn = DriverManager.getConnection("jdbc:sqlserver://HAIDANG:1433;"
//                    + "databaseName=FFShop;"
//                    + "user=sa;password=123456;"
//                    + "encrypt=true;"
//                    + "trustServerCertificate=true;"
//                    + "sendStringParametersAsUnicode=true;");
        conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-OCMN4IH\\SQLEXPRESS:1433;databaseName=FFShop;"
                + "user=sa;password=Admin123@;encrypt=true;trustServerCertificate=true;");

        return conn;
    }
}
