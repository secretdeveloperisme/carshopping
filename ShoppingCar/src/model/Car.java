/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author linh2
 */
public class Car {
    private int id;
    private String nameCar;
    private int price;
    private int amount;
    //brand
    private String name_brand;
    private String Country;
    public Car(){
        
    }
    public Car(int id, String nameCar, int price, int amount, String name_brand, String Country) {
        this.id = id;
        this.nameCar = nameCar;
        this.price = price;
        this.amount = amount;
        this.name_brand = name_brand;
        this.Country = Country;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameCar() {
        return nameCar;
    }

    public void setNameCar(String nameCar) {
        this.nameCar = nameCar;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getName_brand() {
        return name_brand;
    }

    public void setName_brand(String name_brand) {
        this.name_brand = name_brand;
    }

    public String getCountry() {
        return Country;
    }

    public void setCountry(String Country) {
        this.Country = Country;
    }

    @Override
    public String toString() {
        return "Car{" + "id=" + id + ", nameCar=" + nameCar + ", price=" + price + ", amount=" + amount + ", name_brand=" + name_brand + ", Country=" + Country + '}';
    }

     
    
    
}
