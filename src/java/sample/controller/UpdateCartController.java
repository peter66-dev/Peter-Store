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
public class UpdateCartController extends HttpServlet {

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

        String url = "viewCart.jsp";
        try {
            int newQuantity = Integer.parseInt(request.getParameter("quantityBuy"));
            HttpSession session = request.getSession();// check link

            if (newQuantity > 0) {
                String productID = request.getParameter("productID");
                Cart cart = (Cart) session.getAttribute("CART");
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                ProductDTO pro = null;
                for (ProductDTO dto : cart.getCart().values()) {
                    if (dto.getProductID().equals(productID)) {
                        String productName = dto.getProductName();
                        double price = dto.getPrice();
                        String writer = dto.getWriter();
                        String categoryID = dto.getCategoryID();
                        pro = new ProductDTO(productID, newQuantity, price, productName, categoryID, writer);
                        break;
                    }
                }
                cart.update(productID, pro);
                OrderDAO dao = new OrderDAO();
                String orderID = dao.getOrderID(loginUser.getUserID());
                boolean check = dao.updateOrder(orderID, cart);
                if (check) {
                    log("Update order successfully!");
                    request.setAttribute("VIEWCART_MESSAGE", "Updating order successfully!");
                    session.setAttribute("CART", cart);
                } else {
                    log("Sai ở class OrderDAO hàm updateOrder rồi!");
                    request.setAttribute("VIEWCART_MESSAGE", "Sorry, Updating order failed!");
                }
            } else {
                request.setAttribute("ERROR_VIEWCART_MESSAGE", "Sorry, quantity must be more than 0 !");
            }

        } catch (Exception e) {
            log("Error at Update Cart Controller: " + e.toString());
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
