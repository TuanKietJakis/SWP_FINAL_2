/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.tblCart;
import Models.tblProduct;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kiet CHUA XONG NHAAAAAAAAA
 */
public class ProductDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ProductDAO() throws Exception {
        conn = DatabaseConnection.DatabaseConnection.getConnection();
    }

    public int getTotalProductCount() {
        int total = 0;
        try {
            ps = conn.prepareStatement("SELECT COUNT(*) AS total FROM tblProduct");
            rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public ResultSet getAllProduct() {
        String sql = "select*from tblProduct";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ResultSet getFilterProduct(String sql) {
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {

        }
        return null;
    }

    public ResultSet getAllProductLimit(int start, int limit) {
        String sql = "select * from tblProduct order by ProductID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, start);
            ps.setInt(2, limit);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public tblProduct getInfoForUpdating(int ID) {
        tblProduct pro = null;
        try {
            ps = conn.prepareStatement("select * from tblProduct\n"
                    + "where ProductID = ?;");
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            if (rs.next()) {
                pro = new tblProduct(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("Price"),
                        rs.getInt("BrandID"), rs.getInt("CategoryID"),
                        rs.getString("ProductDes"), rs.getInt("Quantity"), rs.getByte("Active"),
                        rs.getString("ProductImageURL"), rs.getInt("Size"));
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pro;
    }

    public int UpdateProduct(tblProduct pro) {
        String sql = "Update tblProduct set CategoryID = ?, ProductName = ?, Price = ?, BrandID = ?, RatingID = ?, ProductDes = ?, Quantity = ?, Active = ?, ProductImageURL = ?, Size = ? where ProductID = ?";
        int result = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, pro.getCategoryID());
            ps.setString(2, pro.getProductName());
            ps.setInt(3, pro.getPrice());
            ps.setInt(4, pro.getBrandID());
            ps.setInt(5, pro.getRatingID());
            ps.setString(6, pro.getProductDes());
            ps.setInt(7, pro.getQuantity());
            ps.setInt(8, pro.getActive());
            ps.setString(9, pro.getProductImageURL());
            ps.setInt(10, pro.getSize());
            ps.setInt(11, pro.getProductID());
            result = ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public int UpdatetoProduct(tblProduct pro) {
        String sql = "Update tblProduct set CategoryID = ?, ProductName = ?, Price = ?, BrandID = ?, ProductDes = ?, Quantity = ?, Active = ?, ProductImageURL = ?, Size = ? where ProductID = ?";
        int result = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, pro.getCategoryID());
            ps.setString(2, pro.getProductName());
            ps.setInt(3, pro.getPrice());
            ps.setInt(4, pro.getBrandID());
//            ps.setInt(5, pro.getRatingID());
            ps.setString(5, pro.getProductDes());
            ps.setInt(6, pro.getQuantity());
            ps.setInt(7, pro.getActive());
            ps.setString(8, pro.getProductImageURL());
            ps.setInt(9, pro.getSize());
            ps.setInt(10, pro.getProductID());
            result = ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public ResultSet GetProductRating(int ProductID) {
        try {
            String sql = "select * from tblRating inner join tblUser on tblUser.UserID = tblRating.UserID where ProductID = ? and tblRating.Active = 1";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ProductID);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }

    public int ChangeActive(int ID) {
        int ketqua = 0;
        String sql = "Update tblProduct SET Active = 0 \n"
                + "where ProductID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            String URL = GetImageURL(ID);
            DeleteImage(URL);
            DeleteImageDB(ID);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Delete(int ID) {
        int ketqua = 0;
        String sql = "delete from tblProduct where ProductID=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            String URL = GetImageURL(ID);
            DeleteImage(URL);
            DeleteImageDB(ID);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
        }
        return ketqua;
    }

    //C:\SWP_PROJECT\SWP_FINAL\src\main\webapp\img
    public void DeleteImage(String imgName) {
        String HardPath = "C:\\SWP_PROJECT\\SWP_FINAL\\src\\main\\webapp";
        Path imagesPath = Paths.get(HardPath + File.separator + imgName);

        try {
            Files.delete(imagesPath);
            System.out.println("File "
                    + imagesPath.toAbsolutePath().toString()
                    + " successfully removed");
        } catch (IOException e) {
            System.err.println("Unable to delete "
                    + imagesPath.toAbsolutePath().toString()
                    + " due to...");
            e.printStackTrace();
        }
    }

    public String GetImageURL(int ID) {
        String sql = "Select Image_URL from Product_Image where Product_ID = ?";
        String URL = "";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            if (rs.next()) {
                URL = rs.getString("Image_URL");
            }
        } catch (SQLException ex) {

        }
        return URL;
    }

    public int GetLastImageID() {
        String sql = " Select max(Image_ID) as highest from Product_Image";
        int digit = 0;
        String ID = null;
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                ID = rs.getString("highest");
            }
            if (ID == null) {
                ID = "1";
            }
            digit = Integer.parseInt(ID);
            digit = digit + 1;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return digit;
    }

    public int DeleteImageDB(int ID) {
        int ketqua = 0;
        String sql = "delete from tblProduct where ProductID=? and ProductImageURL=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            // Đặt giá trị của ProductImageURL tại đây nếu bạn có thông tin này.
            // Nếu không có thông tin, hãy bỏ qua phần này.
            // ps.setString(2, "product_image_url_value");

            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            // Xử lý ngoại lệ, ví dụ: log lỗi.
        }
        return ketqua;
    }

    public int AddNew(tblProduct pro) {
        String sql = "insert into tblProduct values(?,?,?,?,?,?,?,?,?)";
        int result = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, pro.getCategoryID());
            ps.setString(2, pro.getProductName());
            ps.setInt(3, pro.getPrice());
            ps.setInt(4, pro.getBrandID());
            ps.setString(5, pro.getProductDes());
            ps.setInt(6, pro.getQuantity());
            ps.setInt(7, pro.getActive());
            ps.setString(8, pro.getProductImageURL());
            ps.setInt(9, pro.getSize());
            result = ps.executeUpdate();
        } catch (SQLException ex) {

        }
        return result;
    }

    public List<tblProduct> getAllProduct(int ID) {
        List<tblProduct> productList = new ArrayList<>();
        String sql = "SELECT * FROM tblProduct";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tblProduct product = new tblProduct();
                product.setProductID(rs.getInt("ProductID"));
                product.setCategoryID(rs.getInt("CategoryID"));
                product.setProductName(rs.getString("ProductName"));
                product.setPrice(rs.getInt("Price"));
                product.setBrandID(rs.getInt("BrandID"));
                product.setRatingID(rs.getInt("RatingID"));
                product.setProductDes(rs.getString("ProductDes"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setActive(rs.getByte("Active"));
                product.setProductImageURL(rs.getString("ProductImageURL"));
                product.setSize(rs.getInt("Size"));
                productList.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productList;
    }

    public ResultSet getAllProduct2(int ID) {
        ResultSet rs = null;
        String sql = "SELECT * FROM tblProduct";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ResultSet getSearchProduct(String inputValue) {
        ResultSet rs = null;
        String sql = "select ProductID,ProductName,ProductImageURL,Price from tblProduct where ProductName like ? order by ProductName OFFSET 0 ROWS\n"
                + "FETCH NEXT 4 ROWS ONLY;";
        String itemName = "%" + inputValue + "%";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, itemName);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ResultSet getSearchProductnolimit(String inputValue) {
        ResultSet rs = null;
        String sql = "select * from tblProduct where ProductName like ?";
        String itemName = "%" + inputValue + "%";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, itemName);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public tblProduct getProductbyID(int ID) {
        tblProduct pro = new tblProduct();
        String sql = "select * from tblProduct inner join tblCategory on tblProduct.CategoryID = tblCategory.CategoryID inner join tblBrand on tblBrand.BrandID = tblProduct.BrandID where ProductID = ? and tblProduct.Active = 1;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            if (rs.next()) {
                pro = new tblProduct(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("Price"), rs.getInt("BrandID"), rs.getInt("CategoryID"),
                        rs.getString("BrandName"), rs.getString("CatName"), rs.getString("ProductDes"), rs.getInt("Quantity"), rs.getString("ProductImageURL"), rs.getInt("Size"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pro;
    }

    public int getProductQuantity(int ProductID) {
        String sql = "select Quantity from tblProduct where ProductID=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ProductID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("Quantity");
            }
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return 0;
    }

    public ResultSet GetAllBrandName() {
        try {
            String sql = "select BrandName from tblBrand";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (Exception e) {
        }
        return null;
    }

    public ResultSet GetAllCategoryName() {
        try {
            String sql = "select CatName from tblCategory";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (Exception e) {
        }
        return null;
    }

    public int GetBrandIDByBrandName(String BrandName) {
        int count = 0;
        try {
            String sql = "select BrandID from tblBrand where BrandName= ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, BrandName);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("BrandID");
            }
        } catch (Exception e) {
        }
        return count;
    }

    public boolean CheckBrandName(String BrandName) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) as BrandName\n"
                    + "FROM tblBrand\n"
                    + "WHERE BrandName = ?;";
            ps = conn.prepareStatement(sql);
            ps.setString(1, BrandName);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public int GetCategoryIDByCategoryName(String CategoryName) {
        int count = 0;
        try {
            String sql = "select CategoryID from tblCategory where CatName= ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, CategoryName);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("CategoryID");
            }
        } catch (Exception e) {
        }
        return count;
    }

    public boolean CheckCategoryName(String CategoryName) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) as CatName\n"
                    + "FROM tblCategory\n"
                    + "WHERE CatName = ?;";
            ps = conn.prepareStatement(sql);
            ps.setString(1, CategoryName);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public int AddNewBrandNameCatName(tblProduct pr) {

        String sql = "Insert into tblBrand(BrandName,Active) values(?,?)"
                + "Insert into tblCategory(CatName,Active) values(?,?)";
        int kq = 0;
        try {

            ps = conn.prepareStatement(sql);
            ps.setString(1, pr.getBrandName());
            ps.setInt(2, 1);
            ps.setString(3, pr.getCatName());
            ps.setInt(4, 1);
            kq = ps.executeUpdate();
        } catch (Exception e) {
        }
        return kq;
    }

    public int ImportProduct(tblProduct p) {
        int kq = 0;
        String sql = "INSERT INTO tblProduct(ProductName,Price,BrandID,CategoryID,ProductDes,Quantity,Active,ProductImageURL,Size,Cost)\n"
                + "VALUES (?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, p.getProductName());
            ps.setInt(2, p.getPrice());
            ps.setInt(3, p.getBrandID());
            ps.setInt(4, p.getCategoryID());
            ps.setString(5, p.getProductDes());
            ps.setInt(6, p.getQuantity());
            ps.setInt(7, 1);
            ps.setString(8, p.getProductImageURL());
            ps.setInt(9, p.getSize());
            ps.setInt(10, p.getCost());
            kq = ps.executeUpdate();
        } catch (Exception e) {
        }
        return kq;
    }

    public int AddNewBrandName(tblProduct pr) {
        int kq = 0;
        String sql = "Insert into tblBrand(BrandName,Active) values(?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, pr.getBrandName());
            ps.setInt(2, 1);
            kq = ps.executeUpdate();
        } catch (Exception e) {
        }
        return kq;
    }

    public int AddNewCategoryName(tblProduct pr) {
        int kq = 0;
        String sql = "Insert into tblCategory(CatName,Active) values(?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, pr.getCatName());
            ps.setInt(2, 1);
            kq = ps.executeUpdate();
        } catch (Exception e) {
        }
        return kq;
    }
}
