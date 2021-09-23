/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author Dell
 */
public class AdminUpdateController extends HttpServlet {

    public static final String ERROR = "update.jsp";
    public static final String SUCCESS = "AdminSearchController";
    public static final String LOGOUT = "LogoutController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            List<UserDTO> listCheckExist = UserDAO.getListUserIDEmailPhone();

            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String gender = request.getParameter("gender");
            String email = request.getParameter("email");
            String bank = request.getParameter("bank");
            String phoneNumber = request.getParameter("phoneNumber");
            String address = request.getParameter("address");

            UserError userError = new UserError("", "", "", "", "", "", "", "", "", "");
            boolean check = true;
            if (fullName.length() < 5) {//ít hơn 5 kí tự
                userError.setFullNameError("*** Sorry, full name must be more than 5 characters, please!!!");
                check = false;
            }
            if (!password.equals(confirmPassword)) {
                userError.setConfirmPasswordError("*** Sorry, Password and Confirm password do not match each other, please !");
                check = false;
            }
            if ((!email.contains("@") || email.trim().length() < 5) || UserDAO.checkUpdateEmail(listCheckExist, email, userID)) {
                if ((!email.contains("@") || email.trim().length() < 5)) {
                    userError.setEmailError("*** Sorry, email must be more than 5 characters and has @gmail.com, please!!!");
                } else {
                    userError.setEmailError("*** Sorry, this Email has existed in system !!!");
                }
                check = false;
            }

            if (!(phoneNumber.length() >= 10 && phoneNumber.length() <= 12) || UserDAO.checkUpdatePhoneNumber(listCheckExist, phoneNumber, userID)) {
                if (!(phoneNumber.length() >= 10 && phoneNumber.length() <= 12)) {
                    userError.setPhoneNumberError("*** Sorry, phone number must be in [10;12] numbers, please!!!");
                } else {
                    userError.setPhoneNumberError("*** Sorry, this phone number has existed in system, please!!!");
                }
                check = false;
            }
            if (address.length() < 10) {
                userError.setAddressError("*** Sorry, address has more 10 characters, please!!!");
                check = false;
            }
            if (check) {
                UserDAO dao = new UserDAO();
                UserDTO user = new UserDTO(userID, password, fullName, gender, roleID, email, phoneNumber, bank, address);

                boolean checkUpdate = dao.updateUser(user);
                if (checkUpdate) {// update thành công
                    if (userID.trim().equalsIgnoreCase(loginUser.getUserID())) {
                        url = LOGOUT; //     login
                    } else {
                        url = SUCCESS; //   admin search controller
                        request.setAttribute("SUCCESS_MESSAGE_ADMIN", "Updating successfully!");
                        List<UserDTO> list = dao.getAllUser();
                        session.setAttribute("LIST_USER", list);
                    }
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at AdminUpdateController: " + e.toString());
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
