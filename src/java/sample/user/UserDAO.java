/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;
import myLibrary.MyStyle;
import sample.utils.HashPassword;

/**
 *
 * @author Dell
 */
public class UserDAO {

    public UserDTO checkLogin(String userID, String password) throws SQLException, ClassNotFoundException, NoSuchAlgorithmException, InvalidKeySpecException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<UserDTO> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                /*
                LOGIN NÀY KHÔNG PHÂN BIỆT CHỮ HOA VÀ CHỮ THƯỜNG
                String sql = "SELECT FullName, RoleID, Bank, Address, PhoneNumber, Gender, Email "
                        + "from tblUsers WHERE UserID = ? and Password = ? and StatusID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                stm.setString(3, "A");
                rs = stm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("FullName");
                    String roleID = rs.getString("RoleID");
                    String bank = rs.getString("Bank");
                    String address = rs.getString("Address");
                    String phoneNumber = rs.getString("PhoneNumber");
                    String gender = rs.getString("Gender");
                    String email = rs.getString("Email");
                    user = new UserDTO(userID, password, fullName, gender, roleID, email, phoneNumber, bank, address);
                }
                 */
                String sql = "SELECT UserID, Password, FullName, RoleID, Bank, Address, PhoneNumber, Gender, Email "
                        + "from tblUsers Where StatusID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "A");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userIDCol = rs.getString("UserID");
                    String passwordCol = rs.getString("Password");
                    String fullName = rs.getString("FullName");
                    String roleID = rs.getString("RoleID");
                    String bank = rs.getString("Bank");
                    String address = rs.getString("Address");
                    String phoneNumber = rs.getString("PhoneNumber");
                    String gender = rs.getString("Gender");
                    String email = rs.getString("Email");
                    user = new UserDTO(userIDCol, passwordCol, fullName, gender, roleID, email, phoneNumber, bank, address);

                    list.add(user);
                }
                user = null;
                for (UserDTO u : list) {
                    if (u.getUserID().equals(userID) && HashPassword.validatePassword(password, u.getPassword())) {
//                        log("Input " + password + ", Password Enscrypt: " + u.getPassword());
                        user = u;
                    }
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
        return user;
    }

    public List<UserDTO> getAllUser() throws SQLException, ClassNotFoundException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT UserID, FullName, RoleID, PhoneNumber, Bank, Address, Gender, Email "
                        + "FROM tblUsers "
                        + "WHERE StatusID = ? ORDER BY FullName asc";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "A");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("UserID");
                    String fullName = rs.getString("FullName");
                    String roleID = rs.getString("RoleID");
                    String password = "********";
                    String phoneNumber = rs.getString("PhoneNumber");
                    String bank = rs.getString("Bank");
                    String address = rs.getString("Address");
                    String gender = rs.getString("Gender");
                    String email = rs.getString("Email");
                    list.add(new UserDTO(userID, password, fullName, gender, roleID, email, phoneNumber, bank, address));
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

    public List<UserDTO> getListUser(String search) throws SQLException, ClassNotFoundException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT UserID, FullName, RoleID, PhoneNumber, Bank, Address, Gender, Email "
                        + "FROM tblUsers "
                        + "WHERE fullName LIKE ? and statusID = ? ORDER BY FullName asc";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                stm.setString(2, "A");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("UserID");
                    String fullName = rs.getString("FullName");
                    String roleID = rs.getString("RoleID");
                    String password = "********";
                    String phoneNumber = rs.getString("PhoneNumber");
                    String bank = rs.getString("Bank");
                    String address = rs.getString("Address");
                    String gender = rs.getString("Gender");
                    String email = rs.getString("Email");
                    list.add(new UserDTO(userID, password, fullName, gender, roleID, email, phoneNumber, bank, address));
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

    public boolean deleteUser(String userID) throws SQLException, ClassNotFoundException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblUsers SET StatusID=? WHERE UserID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "I");
                stm.setString(2, userID);
                result = stm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public boolean updateUser(UserDTO user) throws SQLException, ClassNotFoundException, NoSuchAlgorithmException, InvalidKeySpecException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            String fullName = MyStyle.toUpperFirstLetter(user.getFullName().trim());
            String address = MyStyle.toTitleCase(MyStyle.toUpperFirstLetter(user.getAddress().trim()));
            String password = HashPassword.createHash(user.getPassword());// enscrypt password
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblUsers SET FullName = ?, Gender = ?, Email = ?, "
                        + "PhoneNumber = ?, Bank = ?, Address = ?, RoleID = ?, Password = ? WHERE UserID = ?";
                stm = conn.prepareStatement(sql);
                stm.setNString(1, fullName);
                stm.setString(2, user.getGender());
                stm.setString(3, user.getEmail().trim());
                stm.setString(4, user.getPhoneNumber().trim());
                stm.setString(5, user.getBank());
                stm.setNString(6, address);
                stm.setString(7, user.getRoleID().trim().toUpperCase());
                stm.setString(8, password);
                stm.setString(9, user.getUserID().trim());
                check = stm.executeUpdate() > 0;
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

    public boolean checkExistUserID(String userID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<String> listUserID = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT UserID FROM tblUsers";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    listUserID.add(rs.getString("UserID"));
                }
                for (String str : listUserID) {
                    if (userID.equalsIgnoreCase(str)) {
                        check = true;
                    }
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

    public boolean insertUser(UserDTO user) throws SQLException, ClassNotFoundException, NoSuchAlgorithmException, InvalidKeySpecException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            String fullName = MyStyle.toTitleCase(MyStyle.toUpperFirstLetter(user.getFullName().trim()));
            String address = MyStyle.toTitleCase(MyStyle.toUpperFirstLetter(user.getAddress().trim()));
            String password = HashPassword.createHash(user.getPassword());// Mã hóa password
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblUsers(FullName, RoleID, UserID, Password, Gender, Email, PhoneNumber, Bank, Address, StatusID)"
                        + "VALUES (?,?,?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setNString(1, fullName);
                stm.setString(2, user.getRoleID().toUpperCase());
                stm.setString(3, user.getUserID());
                stm.setString(4, password);
                stm.setString(5, user.getGender());
                stm.setString(6, user.getEmail());
                stm.setString(7, user.getPhoneNumber());
                stm.setString(8, user.getBank());
                stm.setNString(9, address);
                stm.setString(10, "A");
                check = stm.executeUpdate() > 0;
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

    public static List<UserDTO> getListUserIDEmailPhone() throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<UserDTO> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT UserID, Email, PhoneNumber FROM tblUsers";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("UserID");
                    String email = rs.getString("Email");
                    String phoneNumber = rs.getString("PhoneNumber");
                    list.add(new UserDTO(userID, email, phoneNumber));
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

    public static List<String> getListEmail() throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<String> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT Email FROM tblUsers";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(rs.getString("Email"));
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

    public static List<String> getListPhoneNumber() throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<String> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT PhoneNumber FROM tblUsers";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(rs.getString("PhoneNumber"));
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

    public static boolean checkUpdateEmail(List<UserDTO> listCheck, String str, String userID) {
        boolean check = false;
        for (UserDTO user : listCheck) {
            if (!user.getUserID().equalsIgnoreCase(userID) && user.getEmail().equalsIgnoreCase(str)) {// khác ID && trùng str >> true
                check = true;
            }
        }
        return check;
    }

    public static boolean checkUpdatePhoneNumber(List<UserDTO> listCheck, String str, String userID) {
        boolean check = false;
        for (UserDTO user : listCheck) {
            if (!user.getUserID().equalsIgnoreCase(userID) && user.getPhoneNumber().equalsIgnoreCase(str)) {// khác ID && trùng str >> true
                check = true;
            }
        }
        return check;
    }

    public static boolean checkExist(String str, List<String> list) {// email id 
        boolean check = false;
        for (String a : list) {
            if (str.equalsIgnoreCase(a)) {
                check = true;
            }
        }
        return check;
    }

}
