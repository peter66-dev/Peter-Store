/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import sample.product.ProductDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Dell
 */
public class OrderDetailDAO {

    public boolean createOrderDetail(String orderID, Cart cart) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                int count = 0;
                for (ProductDTO pro : cart.getCart().values()) {
                    int row = 0;
                    String sql = "INSERT INTO tblOrderDetails(OrderID, ProductID, Quantity, TOTAL, StatusID, Date) "
                            + "VALUES(?, ?, ?, ?, ?, GETDATE()) ";
                    stm = conn.prepareStatement(sql);
                    stm.setString(1, orderID);
                    stm.setString(2, pro.getProductID());
                    stm.setInt(3, pro.getQuantityInStock());// Số lượng mua
                    stm.setDouble(4, pro.getPrice() * pro.getQuantityInStock());
                    stm.setString(5, "A");
                    row = stm.executeUpdate();
                    if (row > 0) {
                        ++count;
                    }
                }
                if (count > 0) {
                    check = true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
