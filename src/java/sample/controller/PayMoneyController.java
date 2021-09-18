/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.user.UserDTO;
import shopping.Cart;
import shopping.OrderDAO;
import shopping.OrderDetailDAO;

/**
 *
 * @author Dell
 */
public class PayMoneyController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "store.jsp";

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
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            Cart cart = (Cart) session.getAttribute("CART");
            OrderDAO orderDAO = new OrderDAO();
            String orderID = orderDAO.getOrderID(loginUser.getUserID());
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            ProductDAO productDAO = new ProductDAO();

            if (cart.getCart().isEmpty() || cart == null || orderID == null) {
                session.setAttribute("ERROR_MESSAGE", "Sorry, you haven't added anything to your cart yet!");
            } else {
                List<String> list = productDAO.checkQuantityInStock(cart);
                if (list.isEmpty()) {
                    if (productDAO.subProduct(cart)) {
                        log("Setting quantity in stock successfully!");
                    } else {
                        log("Setting quantity in stock failed!");
                    }
                    if (productDAO.setStatusIDQuantityInStock() == 0) {
                        log("Dont have any product out of stock!");
                    } else {
                        log("We have " + productDAO.setStatusIDQuantityInStock() + " product names out of stock!");
                    }
                    if (orderDAO.setOffPaymentStatusOfOrder(loginUser.getUserID())) {
                        log("Setting off Payment Status Successfully!");
                    } else {
                        log("Setting off Payment Status Failed!");
                    }
                    if (orderDAO.setOffStatusIDOfOrder(loginUser.getUserID())) {
                        log("Setting off StatusID Order successfully!");
                    } else {
                        log("Setting off StatusID Order failed!");
                    }
                    if (orderDetailDAO.createOrderDetail(orderID, cart)) {
                        log("Create Order Detail Successfully!");
                        request.setAttribute("SHOPPING", "Thank you for your order from Peter's Store, "+loginUser.getFullName() +" !");
                        url = SUCCESS;
                        cart.getCart().clear();
                        if (cart.getCart().isEmpty()) {
                            log("Deleting all product in cart successfully!");
                        } else {
                            log("Deleting all product in cart failed!");
                        }
                        //cập nhật lại list(session) sau khi mua thành công
                        List<ProductDTO> listProduct = new ArrayList<>();
                        listProduct = productDAO.getAllProduct();
                        session.setAttribute("LIST_BOOK", listProduct);
                        session.setAttribute("CART", cart);

                    } else {
                        log("Create Order Detail Failed!");
                        session.setAttribute("ERROR_MESSAGE", "Buying failed!");
                        url = ERROR;
                    }
                } else {
                    String msg = new String();
                    for (String str : list) {
                        msg += str + "</br>";
                    }
                    session.setAttribute("ERROR_MESSAGE", "Sorry, We don't have enough quantity for ...</br>" + msg);
                    url = ERROR;
                }

            }

        } catch (Exception e) {
            log("Error at Pay Money Controller: " + e.toString());
        } finally {
//            response.sendRedirect(url);
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
