/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping;

import java.util.HashMap;
import java.util.Map;
import sample.product.ProductDTO;

/**
 *
 * @author Dell
 */
public class Cart {

    private Map<String, ProductDTO> cart;

    public Cart() {
    }

    public Cart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public void add(ProductDTO product) {// quantityBuy
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(product.getProductID())) {
            int currentQuantity = this.cart.get(product.getProductID()).getQuantityInStock();// quantity in stock là số lượng khách hàng mua!!!
            product.setQuantityInStock(currentQuantity + product.getQuantityInStock());
        }
        cart.put(product.getProductID(), product);
    }

    public void delete(String id) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.remove(id);
        }
    }

    public boolean delete(ProductDTO pro) {
        boolean check = false;
        if (this.cart == null) {
            check = false;
        }
        if (this.cart.containsKey(pro.getProductID())) {
            this.cart.remove(pro.getProductID());
            check = true;
        }
        return check;
    }

    public void update(String id, ProductDTO newProduct) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.replace(id, newProduct);
        }
    }

    public int deleteAll() {
        int count = 0;
        for (ProductDTO pro : cart.values()) {
            if (this.cart.remove(pro.getProductID(), pro)) {
                ++count;
            }
        }
        return count;
    }
}
