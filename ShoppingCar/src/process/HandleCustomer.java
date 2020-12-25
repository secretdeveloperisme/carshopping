/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package process;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;
import javax.swing.JOptionPane;
import model.Car;
import model.Person;
import static process.HandleAccount.NAME_ROOT;
import static process.HandleAccount.PASSWORD_ROOT;

/**
 *
 * @author linh2
 */
public class HandleCustomer {
    public static boolean buyCar(Car car, Person p,int amount,String date){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/carshopping", NAME_ROOT, PASSWORD_ROOT);
            String sql_car = "SELECT amount FROM car where id_car = "+car.getId();
            statement = (Statement) connection.createStatement();
            resultSet = statement.executeQuery(sql_car);
            resultSet.next();
            //query amount
            int amout_car = resultSet.getInt("amount");
            String sqlIsHaveEnough = "SELECT isHaveEnoughMoney("+p.getId()+","+amount*(car.getPrice())+") as isHaveEnough";
            resultSet = statement.executeQuery(sqlIsHaveEnough);
            resultSet.next();
            //test current amount greater than minusAmout
            boolean isHaveEnoughMoney = resultSet.getBoolean("isHaveEnough");
            System.out.println(isHaveEnoughMoney);
            if(!isHaveEnoughMoney){
                System.out.println("not have enough money !");
                return false;
            }
            if(amout_car >= amount){ 
            // add to orders
            String sql = " INSERT INTO orders(id_customer,id_car,buying_time,amount,total)  values(?,?,?,?,?)";
            preparedStatement = (PreparedStatement) connection.prepareStatement(sql);
            preparedStatement.setInt(1, p.getId());
            preparedStatement.setInt(2, car.getId());
            preparedStatement.setString(3, date);
            preparedStatement.setInt(4, amount);
            int total = car.getPrice()* amount;
            preparedStatement.setInt(5, total);
            preparedStatement.executeUpdate();
            //
            String sqlUpdateCarAmount = "call updateAmountCar(?,?)";
            preparedStatement = (PreparedStatement) connection.prepareCall(sqlUpdateCarAmount);
            preparedStatement.setInt(1,car.getId());
            preparedStatement.setInt(2, amount);
            preparedStatement.execute();
            //minus Money
            String sqlMinusMoney = "call minusMoney(?,?)";
            preparedStatement = (PreparedStatement) connection.prepareCall(sqlMinusMoney);
            preparedStatement.setInt(1, p.getId());
            preparedStatement.setInt(2,amount*car.getPrice());
            resultSet = preparedStatement.executeQuery();
            }
            else {
                System.out.println("amount that you buy greater than availabel");
                return false;
            }
            //update amount in table car
            
            //
            statement.close();
            preparedStatement.close();
            connection.close();
            return true;
        }
        catch(SQLException e){
            System.out.println("Insert table account unsuccessfully");
            System.out.println(e.getMessage());
            return false;
            
        }
        catch(ClassNotFoundException e){
            System.out.println(e.getMessage());
            return false;
        }
        
    }
    public static ArrayList<Vector> getHistoryBuyingCustomer(int idCustomer){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<Vector>  vectors= new ArrayList<Vector>();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/carshopping", NAME_ROOT, PASSWORD_ROOT);
            String sqlHBC = "call showHistoryBuyingCustomer(?)";
            preparedStatement = (PreparedStatement) connection.prepareCall(sqlHBC);
            preparedStatement.setInt(1,idCustomer);
            resultSet = preparedStatement.executeQuery();
            int i =0;
            while(resultSet.next()){
                Vector v = new Vector();
                v.add(resultSet.getString("first_name"));
                v.add(resultSet.getString("last_name"));
                v.add(resultSet.getString("name_car"));
                v.add(resultSet.getString("buying_time"));
                v.add(resultSet.getInt("amount"));
                v.add(resultSet.getInt("total"));
                vectors.add(v);
                i++;
            }
            preparedStatement.close();
            connection.close();
            return vectors;
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
            return null;
            
        }
        catch(ClassNotFoundException e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    public static ArrayList<Vector> getAllHistoryBuyingCustomer(){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<Vector>  vectors= new ArrayList<Vector>();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/carshopping", NAME_ROOT, PASSWORD_ROOT);
            String sqlHBC = "call showHistoryBuyingCustomer(?)";
            preparedStatement = (PreparedStatement) connection.prepareCall(sqlHBC);
            preparedStatement.setInt(1,-1);
            resultSet = preparedStatement.executeQuery();
            int i =0;
            while(resultSet.next()){
                Vector v = new Vector();
                v.add(resultSet.getInt("id_order"));
                v.add(resultSet.getString("first_name")+" "+resultSet.getString("last_name"));
                v.add(resultSet.getString("name_car"));
                v.add(resultSet.getString("buying_time"));
                v.add(resultSet.getInt("amount"));
                v.add(resultSet.getInt("total"));
                vectors.add(v);
                i++;
            }
            preparedStatement.close();
            connection.close();
            return vectors;
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
            return null;
            
        }
        catch(ClassNotFoundException e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public static void main(String[] args) {
        System.out.println(getHistoryBuyingCustomer(-1));
    }
}
