/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;
import shopping.Cart;

/**
 *
 * @author Dell
 */
public class ProductDAO {

    public List<ProductDTO> getAllProduct() throws SQLException, ClassNotFoundException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ProductID, ProductName, CategoryID, Writer, QuantityInStock, Price, PublicationDate "
                        + "FROM tblProducts WHERE StatusID = ? and QuantityInStock > 0 ORDER BY ProductName asc";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "A");//chỉ lấy những sách nào Active
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("ProductID");
                    String productName = rs.getString("ProductName");
                    String categoryID = rs.getString("CategoryID");
                    String writer = rs.getString("Writer");
                    int quantityInStock = rs.getInt("QuantityInStock");
                    double price = rs.getFloat("Price");
                    String publicationDate = rs.getString("PublicationDate");

                    list.add(new ProductDTO(productID, productName, categoryID, writer, quantityInStock, price, publicationDate));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<ProductDTO> getListByProductName(String search) throws SQLException, ClassNotFoundException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ProductID, ProductName, CategoryID, Writer, QuantityInStock, Price, PublicationDate "
                        + "FROM tblProducts WHERE ProductName LIKE ? and StatusID = ? and QuantityInStock > 0 ORDER BY ProductName asc";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                stm.setString(2, "A");//chỉ lấy những sách nào Active
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("ProductID");
                    String productName = rs.getString("ProductName");
                    String categoryID = rs.getString("CategoryID");
                    String writer = rs.getString("Writer");
                    int quantityInStock = rs.getInt("QuantityInStock");
                    double price = rs.getFloat("Price");
                    String publicationDate = rs.getString("PublicationDate");

                    list.add(new ProductDTO(productID, productName, categoryID, writer, quantityInStock, price, publicationDate));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<ProductDTO> getListByCategoryName(String search) throws SQLException, ClassNotFoundException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ProductID, ProductName, CategoryID, Writer, QuantityInStock, Price, PublicationDate "
                        + "FROM tblProducts WHERE CategoryID LIKE ? and StatusID = ? and QuantityInStock > 0 ORDER BY ProductName asc";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                stm.setString(2, "A");//chỉ lấy những loại nào Active
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("ProductID");
                    String productName = rs.getString("ProductName");
                    String categoryID = rs.getString("CategoryID");
                    String writer = rs.getString("Writer");
                    int quantityInStock = rs.getInt("QuantityInStock");
                    double price = rs.getFloat("Price");
                    String publicationDate = rs.getString("PublicationDate");

                    list.add(new ProductDTO(productID, productName, categoryID, writer, quantityInStock, price, publicationDate));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<ProductDTO> getListByWriter(String search) throws SQLException, ClassNotFoundException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ProductID, ProductName, CategoryID, Writer, QuantityInStock, Price, PublicationDate "
                        + "FROM tblProducts WHERE Writer LIKE ? and StatusID = ? and QuantityInStock > 0 ORDER BY ProductName asc";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                stm.setString(2, "A");//chỉ lấy những loại nào Active
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("ProductID");
                    String productName = rs.getString("ProductName");
                    String categoryID = rs.getString("CategoryID");
                    String writer = rs.getString("Writer");
                    int quantityInStock = rs.getInt("QuantityInStock");
                    double price = rs.getFloat("Price");
                    String publicationDate = rs.getString("PublicationDate");

                    list.add(new ProductDTO(productID, productName, categoryID, writer, quantityInStock, price, publicationDate));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public int getQuantityByProductID(String productID) throws SQLException, ClassNotFoundException {
        int count = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT QuantityInStock FROM tblProducts WHERE ProductID = ?"; // 
                stm = conn.prepareStatement(sql);
                stm.setString(1, productID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt("QuantityInStock");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return count;
    }

    public List<String> checkQuantityInStock(Cart cart) throws SQLException {
        List<String> list = new ArrayList<>();
        try {
            for (ProductDTO pro : cart.getCart().values()) {
                int quantityInStock = getQuantityByProductID(pro.getProductID());
                if (pro.getQuantityInStock() > quantityInStock) {
                    // Nếu số lượng mua > số lượng trong kho !!!
                    list.add(pro.getProductName());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean subProduct(Cart cart) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                int flag = 0;

                for (ProductDTO pro : cart.getCart().values()) {
                    int quantityInStock = getQuantityByProductID(pro.getProductID());
                    String sql = "UPDATE tblProducts SET QuantityInStock = ? WHERE ProductID = ? ";
                    stm = conn.prepareStatement(sql);
                    stm.setInt(1, quantityInStock - pro.getQuantityInStock());// Quantity: kho - mua
                    stm.setString(2, pro.getProductID());
                    if (stm.executeUpdate() <= 0) {
                        flag = 1;
                    }
                }

                if (flag == 1) {
                    check = false;
                } else {
                    check = true;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public int setStatusIDQuantityInStock() throws SQLException, ClassNotFoundException {
        int count = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblProducts SET StatusID = ? WHERE QuantityInStock = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "I");
                stm.setInt(2, 0);
                count = stm.executeUpdate();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return count;
    }
}
