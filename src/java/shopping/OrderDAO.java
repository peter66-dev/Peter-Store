/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping;

import static java.rmi.server.LogStream.log;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.product.ProductDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Dell
 */
public class OrderDAO {

    public boolean createOrder(String roleID, String userID, double price) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            if (!roleID.equals("US")) {
                check = false;
            } else {
                conn = DBUtils.getConnection();
                if (conn != null) {
                    String sql = "INSERT INTO tblOrders(UserID, Date, Price, StatusID, PaymentStatus) "
                            + "values(?, GETDATE(), ?, 'A', 'Unpaid debt')";
                    stm = conn.prepareStatement(sql);
                    stm.setString(1, userID);
                    stm.setDouble(2, price);
                    int row = stm.executeUpdate();// insert, delete, update 
                    if (row > 0) {
                        check = true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public String getOrderID(String userID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        String orderID = new String();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT OrderID FROM tblOrders WHERE UserID = ? and StatusID = ?";//User phải đang đăng nhập
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, "A");
                rs = stm.executeQuery();
                if (rs.next()) {
                    orderID = rs.getString("OrderID");
                }
            }
        } catch (Exception e) {
            log("OrderDAO at getOrderID: " + e.getMessage());
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
        return orderID;
    }

    public boolean updateOrder(String orderID, Cart cart) throws SQLException { // update Price where userID
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;

        double total = 0;
        for (ProductDTO pro : cart.getCart().values()) {
            total += pro.getPrice() * pro.getQuantityInStock();
        }
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblOrders SET Price = ? WHERE OrderID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setDouble(1, total);
                stm.setString(2, orderID);
                if (stm.executeUpdate() > 0) {
                    check = true;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
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

    public boolean setOffStatusIDOfOrder(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblOrders SET StatusID = ? WHERE UserID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "I");
                stm.setString(2, userID);
                check = stm.executeUpdate() > 0 ? true : false;
            }

        } catch (Exception e) {
            e.printStackTrace();
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

    public boolean setOffAllStatusIDOfOrder() throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblOrders SET StatusID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "I");
                check = stm.executeUpdate() > 0 ? true : false;
            }

        } catch (Exception e) {
            e.printStackTrace();
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

    public boolean setOffPaymentStatusOfOrder(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblOrders SET PaymentStatus = ? WHERE UserID = ? AND StatusID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "Paid");
                stm.setString(2, userID);
                stm.setString(3, "A");
                check = stm.executeUpdate() > 0 ? true : false;
            }

        } catch (Exception e) {
            e.printStackTrace();
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
