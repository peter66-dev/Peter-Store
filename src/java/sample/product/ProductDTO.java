/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.io.Serializable;

/**
 *
 * @author Dell
 */
public class ProductDTO implements Serializable{

    private String productID;
    private String productName;
    private String categoryID;
    private String writer;
    private int quantityInStock;
    private double price;
    private String statusID;
    private String publicationDate;

    public ProductDTO() {
    }

    public ProductDTO(String productID, String productName, String categoryID, String writer, int quantityInStock, double price, String statusID, String publicationDate) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.writer = writer;
        this.quantityInStock = quantityInStock;
        this.price = price;
        this.statusID = statusID;
        this.publicationDate = publicationDate;
    }

    public ProductDTO(String productID, String productName, String categoryID, String writer, int quantityInStock, double price, String publicationDate) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.writer = writer;
        this.quantityInStock = quantityInStock;
        this.price = price;
        this.publicationDate = publicationDate;
    }

    public ProductDTO(String productID, int quantityBuy, double price, String productName, String categoryID, String writer) {
        this.productID = productID;
        this.quantityInStock = quantityBuy;
        this.price = price;
        this.productName = productName;
        this.categoryID = categoryID;
        this.writer = writer;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public int getQuantityInStock() {
        return quantityInStock;
    }

    public void setQuantityInStock(int quantityInStock) {
        this.quantityInStock = quantityInStock;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatusID() {
        return statusID;
    }

    public void setStatusID(String statusID) {
        this.statusID = statusID;
    }

    public String getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(String publicationDate) {
        this.publicationDate = publicationDate;
    }

}
