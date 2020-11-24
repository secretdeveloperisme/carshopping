/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package process;

import com.mysql.jdbc.PreparedStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import model.Car;
import static process.HandleLogin.NAME_ROOT;
import static process.HandleLogin.PASSWORD_ROOT;

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
}
