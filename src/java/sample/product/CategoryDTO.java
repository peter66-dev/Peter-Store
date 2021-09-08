/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

/**
 *
 * @author Dell
 */
public class CategoryDTO {

    private String categoryID;
    private String categoryName;
    private String country;
    private String statusID;

    public CategoryDTO() {
    }

    public CategoryDTO(String categoryID, String categoryName, String country, String statusID) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.country = country;
        this.statusID = statusID;
    }

    public CategoryDTO(String categoryID, String categoryName, String country) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.country = country;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getStatusID() {
        return statusID;
    }

    public void setStatusID(String statusID) {
        this.statusID = statusID;
    }

}
