/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package process;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;
import model.Car;
import static process.HandleAccount.NAME_ROOT;
import static process.HandleAccount.PASSWORD_ROOT;

/**
 *
 * @author linh2
 */
public class HandleManageCar {
    public static boolean addCar(Car car){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/carshopping", NAME_ROOT, PASSWORD_ROOT);
            String sql = " INSERT INTO car (name_car,price,amount,name_brand,country) values(?,?,?,?,?)";
            preparedStatement = (PreparedStatement) connection.prepareStatement(sql);
            preparedStatement.setString(1, car.getNameCar());
            preparedStatement.setInt(2, car.getPrice());
            preparedStatement.setInt(3, car.getAmount());
            preparedStatement.setString(4, car.getName_brand());
            preparedStatement.setString(5, car.getCountry());
            preparedStatement.executeUpdate();
            //
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
    public static boolean deleteCar(int id_car){
        Connection connection = null;
        Statement preparedStatement = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/carshopping", NAME_ROOT, PASSWORD_ROOT);
            String sql = "DELETE FROM CAR WHERE id_car = "+id_car;
            preparedStatement = (Statement) connection.prepareStatement(sql);
            preparedStatement.execute(sql);
            //
            preparedStatement.close();
            connection.close();
            return true;
        }
        catch(SQLException e){
            System.out.println("delete  car unsuccessfully");
            System.out.println(e.getMessage());
            return false;
            
        }
        catch(ClassNotFoundException e){
            System.out.println(e.getMessage());
            return false;
        }
    }
    public static boolean editCar(Car car){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/carshopping", NAME_ROOT, PASSWORD_ROOT);
            String sql = "UPDATE car SET name_car = ?,price = ?,amount = ?,name_brand = ?, country = ? WHERE id_car = ?";
            preparedStatement = (PreparedStatement) connection.prepareStatement(sql);
            preparedStatement.setString(1, car.getNameCar());
            preparedStatement.setInt(2, car.getPrice());
            preparedStatement.setInt(3, car.getAmount());
            preparedStatement.setString(4, car.getName_brand());
            preparedStatement.setString(5, car.getCountry());
            preparedStatement.setInt(6, car.getId());
            preparedStatement.executeUpdate();
            //
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
    public static ArrayList<Car>findCar(String name){
        Connection connection = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        ArrayList<Car> cars = new ArrayList<>();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/carshopping", NAME_ROOT, PASSWORD_ROOT);
            String sql = "{call findCar(?)}";
            cs = (CallableStatement) connection.prepareCall(sql);
            cs.setString(1,name);
            rs = cs.executeQuery();
            while(rs.next()){
                cars.add(new Car(rs.getInt("id_car")
                        ,rs.getString("name_car")
                        ,rs.getInt("price")
                        ,rs.getInt("amount")
                        ,rs.getString("name_brand")
                        ,rs.getString("Country")));
            }
                
            //
            rs.close();
            cs.close();
            connection.close();
            return cars;
            
        }
        catch(SQLException e){
            System.out.println("Insert table account unsuccessfully");
            System.out.println(e.getMessage());
            return null;
            
        }
        catch(ClassNotFoundException e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public static ArrayList<Vector> statisticMonth(int yearStas){
        Connection connection;
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        ArrayList<Vector> months = new ArrayList<Vector>();
        //khoi tao
        for(int i=1; i<=12; i++){
            Vector vector = new Vector();
            vector.add(i);
            vector.add(0);
            vector.add(0.0);
            months.add(vector);
        }
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/carshopping", NAME_ROOT, PASSWORD_ROOT);
            String sql = "select month(o.buying_time) as month, sum(amount) as amount_sale, sum(total) as total " +
                "from (" +
                "select * " +
                "from orders " +
                "where year(orders.buying_time) = ?" +
                ") as o" +
                " group by month(o.buying_time)";
            preparedStatement = (PreparedStatement) connection.prepareCall(sql);
            preparedStatement.setInt(1,yearStas);
            resultSet = preparedStatement.executeQuery();
            int i =0;
            while(resultSet.next()){
                Vector v = new Vector();
                int monthStas = resultSet.getInt("month");
                v.add(monthStas);        
                v.add(resultSet.getInt("amount_sale"));
                v.add(resultSet.getInt("total"));
                months.set(monthStas-1, v);
                i++;
            }
            preparedStatement.close();
            connection.close();
            return months;
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
    
    public static ArrayList<Vector> statisticYear(int yearFrom, int yearTo){
        Connection connection;
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        ArrayList<Vector> years = new ArrayList<Vector>();
        //khoi tao
        for(int i=yearFrom; i<=yearTo; i++){
            Vector vector = new Vector();
            vector.add(i);
            vector.add(0);
            vector.add(0.0);
            years.add(vector);
        }
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/carshopping", NAME_ROOT, PASSWORD_ROOT);
            String sql = "select year(o.buying_time) as year, sum(amount) as amount_sale, sum(total) as total " +
                "from (" +
                "select * " +
                "from orders " +
                "where year(orders.buying_time) >= ? " +
                "and year(orders.buying_time) <= ? " +
                ") as o" +
                " group by year(o.buying_time)";
            preparedStatement = (PreparedStatement) connection.prepareCall(sql);
            preparedStatement.setInt(1,yearFrom);
            preparedStatement.setInt(2,yearTo);
            resultSet = preparedStatement.executeQuery();
            int i =0;
            while(resultSet.next()){
                Vector v = new Vector();
                int yearStas = resultSet.getInt("year");
                v.add(yearStas);        
                v.add(resultSet.getInt("amount_sale"));
                v.add(resultSet.getInt("total"));
                years.set(yearStas-yearFrom, v);
                i++;
            }
            preparedStatement.close();
            connection.close();
            return years;
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
       // System.out.println(findCar("s"));
        //System.out.println(statisticYear(2020, 2021));
    }
}
