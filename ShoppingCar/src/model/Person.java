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
public class Person {
    private int id;
    private String firstName;
    private String lastName;
    private char gender;
    private String dateOfBirth;
    private long phoneNumber;
    private String address;

    public Person() {
        this.id=0;
        this.firstName="unknown";
        this.lastName="unknown";
        this.gender='N';
        this.dateOfBirth="1970/1/1";
        this.phoneNumber=0;
        this.address="No Address";
    }
    
    public Person(int id,String firstName, String lastName, char gender, String dateOfBirth, long phoneNumber, String address) {
        this.id=id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public char getGender() {
        return gender;
    }

    public void setGender(char gender) {
        this.gender = gender;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public long getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(long phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    

    @Override
    public String toString() {
        return "Person{" +"id= "+id+ " firstName=" + firstName + ", lastName=" + lastName + ", gender=" + gender + ", dateOfBirth=" + dateOfBirth + ", phoneNumber=" + phoneNumber + ", address=" + address + '}';
    }
    
    
    
}
