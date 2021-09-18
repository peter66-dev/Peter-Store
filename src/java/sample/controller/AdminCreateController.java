
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author Dell
 */
public class AdminCreateController extends HttpServlet {

    private static final String ERROR = "create.jsp";
    private static final String SUCCESS = "login.html";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;
        UserError userError = new UserError("", "", "", "", "", "", "", "", "", "");
        String userID = request.getParameter("userID");

        try {
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            String gender = request.getParameter("gender");
            String email = request.getParameter("email");
            String bank = request.getParameter("bank");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phoneNumber");
            boolean check = true;

            if (!(userID.length() == 3 || userID.length() == 4)) {
                userError.setUserIDError("*** Sorry, user ID has 3 or 4 characters, please !");
                check = false;
            }
            if (fullName.length() < 5) {
                userError.setFullNameError("*** Sorry, full Name has more than 5 characters, please !");
                check = false;
            }
            if (!password.equals(confirm)) {
                userError.setConfirmPasswordError("*** Sorry, confirm password is not correct, please !");
                check = false;
            }

            List<String> listEmail = UserDAO.getListEmail();
            if ((!email.contains("@") || email.trim().length() < 5 || UserDAO.checkExist(email, listEmail))) {
                if ((!email.contains("@") || email.trim().length() < 5)) {
                    userError.setEmailError("*** Sorry, email must be more than 5 characters and has @gmail.com, please !");
                } else {
                    userError.setEmailError("*** Sorry, this Email has existed in system !");
                }
                check = false;
            }

            List<String> listPhoneNumber = UserDAO.getListPhoneNumber();
            if (!(phoneNumber.length() >= 10 && phoneNumber.length() <= 12) || UserDAO.checkExist(phoneNumber, listPhoneNumber)) {
                if (!(phoneNumber.length() >= 10 && phoneNumber.length() <= 12)) {
                    userError.setPhoneNumberError("*** Sorry, phone Number must be in [10;12] numbers, please !");
                } else {
                    userError.setPhoneNumberError("*** Sorry, this phone number has existed in system !");
                }
                check = false;
            }
            if (address.length() < 5) {
                userError.setAddressError("*** Sorry, address has more 5 characters, please !");
                check = false;
            }
            if (check) {
                UserDAO dao = new UserDAO();
                UserDTO user = new UserDTO(userID, password, fullName, gender, roleID, email, phoneNumber, bank, address);
                boolean checkInsert = dao.insertUser(user);
                if (checkInsert) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (SQLException ex) {
            log("Create Controller _ SQL: " + ex.getMessage());
            if (ex.getMessage().contains("duplicate")) {
                userError.setUserIDError(" *** " + userID.toUpperCase() + " has existed in our system!");
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at Admin Create Controller: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
