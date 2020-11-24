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
public class Order {
    private String idOrder;
    private Person person;
    private Car car;
    private String buyingTime;
    private int amount;

    public Order(String idOrder, Person person, Car car, String buyingTime, int amount) {
        this.idOrder = idOrder;
        this.person = person;
        this.car = car;
        this.buyingTime = buyingTime;
        this.amount = amount;
    }

    public String getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(String idOrder) {
        this.idOrder = idOrder;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public String getBuyingTime() {
        return buyingTime;
    }

    public void setBuyingTime(String buyingTime) {
        this.buyingTime = buyingTime;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "Order{" + "idOrder=" + idOrder + ", person=" + person + ", car=" + car + ", buyingTime=" + buyingTime + ", amount=" + amount + '}';
    }
    
    
}
