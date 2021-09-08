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
import sample.product.ProductDTO;
import sample.user.UserDTO;
import shopping.Cart;
import shopping.OrderDAO;

/**
 *
 * @author Dell
 */
public class AddToCartController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "store.jsp";
    private static final String LOGIN = "login.html";

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

            String userID = request.getParameter("userID");
            String productID = request.getParameter("productID");
            String categoryID = request.getParameter("categoryID");
            String productName = request.getParameter("productName");
            String writer = request.getParameter("writer");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantityBuy = Integer.parseInt(request.getParameter("quantityBuy"));
            int quantityInStock = Integer.parseInt(request.getParameter("quantityInStock"));

            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            if (userID.isEmpty()) {
                url = LOGIN;
            } else if (session.getAttribute("LOGIN_USER").equals("AD")) {
                session.setAttribute("ERROR_MESSAGE", "Sorry, Role Admin can't buy product here!");
            } else {
                if (quantityBuy <= 0) {
                    url = SUCCESS;
                    request.setAttribute("SHOPPING_MESSAGE", "*** Sorry, quantity must be > 0!");
                } else {
                    if (quantityBuy > quantityInStock) {
                        url = SUCCESS;
                        request.setAttribute("SHOPPING_MESSAGE", "*** Sorry, We don't have enough quantity for this book!");
                    } else {
                        OrderDAO orderDao = new OrderDAO();
                        ProductDTO pro = new ProductDTO(productID, quantityBuy, price, productName, categoryID, writer);
                        Cart cart = (Cart) session.getAttribute("CART");
                        if (cart == null || cart.getCart().isEmpty()) {
                            cart = new Cart();
                            cart.add(pro);
                            boolean check = orderDao.createOrder(user.getRoleID(), userID, quantityBuy * price);
                            if (check) {
                                log("Creating new order successfully!");
                            } else {
                                log("Creating new order failed!");
                            }
                        } else {
                            cart.add(pro);
                            String orderID = orderDao.getOrderID(userID);
                            if (orderDao.updateOrder(orderID, cart)) {
                                log("Updating order successfully!");
                            } else {
                                log("Updating order failed!");
                            }
                        }
                        session.setAttribute("CART", cart);
                        url = SUCCESS;
                        String message = "Added " + quantityBuy + " '" + productName + "' to " + user.getFullName() + "'s cart!";
                        request.setAttribute("SHOPPING_MESSAGE", message);
                    }
                }
            }
        } catch (Exception e) {
            log("Error at AddToCartController: " + e.toString());
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
