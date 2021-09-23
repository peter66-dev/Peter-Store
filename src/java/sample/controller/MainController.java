/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
public class MainController extends HttpServlet {

    public static final String ERROR = "error.jsp";
    public static final String LOGIN = "login.html";
    public static final String LOGIN_CONFIRM = "LoginController";
    public static final String ADMIN_SEARCH = "AdminSearchController";
    public static final String ADMIN_SHOW_ALL_USERS = "AdminShowAllUsersController";
    public static final String ADMIN_DELETE = "AdminDeleteController";
    public static final String ADMIN_UPDATE = "update.jsp";
    public static final String ADMIN_UPDATE_CONFIRM = "AdminUpdateController";
    public static final String LOGOUT = "LogoutController";
    public static final String CREATE = "AdminCreateController";
    public static final String USER_SEARCH = "UserSearchController";
    public static final String USER_SHOW_ALL_PRODUCT = "UserShowAllProductController";
    public static final String ADD_TO_CART = "AddToCartController";
    public static final String VIEW_CART = "viewCart.jsp";
    public static final String UPDATE_CART = "UpdateCartController";
    public static final String REMOVE_CART = "RemoveCartController";
    public static final String PAY_MONEY = "PayMoneyController";

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
        try {
            HttpSession session = request.getSession();
            String action = request.getParameter("action");
            switch (action) {
                case "Log in": {
                    url = LOGIN;
                    break;
                }
                case "Login": {
                    url = LOGIN_CONFIRM;
                    break;
                }
                case "Search": {
                    url = ADMIN_SEARCH;
                    break;
                }
                case "Delete": {
                    url = ADMIN_DELETE;
                    break;
                }
                case "Update": {
                    url = ADMIN_UPDATE;
                    break;
                }
                case "Confirm Update": {
                    url = ADMIN_UPDATE_CONFIRM;
                    break;
                }
                case "Log out": {
                    url = LOGOUT;
                    break;
                }
                case "Create": {
                    url = CREATE;
                    break;
                }
                case "Search Items": {
                    url = USER_SEARCH;
                    break;
                }
                case "Show All Products": {
                    url = USER_SHOW_ALL_PRODUCT;
                    break;
                }
                case "Show All Users": {
                    url = ADMIN_SHOW_ALL_USERS;
                    break;
                }
                case "Add To Cart": {
                    url = ADD_TO_CART;
                    break;
                }
                case "View Cart": {
                    url = VIEW_CART;
                    break;
                }
                case "Modify": {
                    url = UPDATE_CART;
                    break;
                }
                case "Remove": {
                    url = REMOVE_CART;
                    break;
                }
                case "Pay Money": {
                    url = PAY_MONEY;
                    break;
                }
                default: {
                    session.setAttribute("ERROR_MESSAGE", "Sorry, function is not available!");
                    break;
                }
            }
        } catch (Exception e) {
            log("Error at Main Controller: " + e.toString());
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
