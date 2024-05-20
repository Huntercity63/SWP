/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author phuan
 */
public class CategoryProduct {
    private int category_productID;
    private String category_name;
    private String category_description;

    public CategoryProduct() {
    }

    public CategoryProduct(int category_productID, String category_name, String category_description) {
        this.category_productID = category_productID;
        this.category_name = category_name;
        this.category_description = category_description;
    }

    public int getCategory_productID() {
        return category_productID;
    }

    public void setCategory_productID(int category_productID) {
        this.category_productID = category_productID;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public String getCategory_description() {
        return category_description;
    }

    public void setCategory_description(String category_description) {
        this.category_description = category_description;
    }

    @Override
    public String toString() {
        return "CategoryProduct{" + "category_productID=" + category_productID + ", category_name=" + category_name + ", category_description=" + category_description + '}';
    }

}
