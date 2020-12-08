/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package process;
import com.mysql.jdbc.PreparedStatement;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Person;

/**
 *
 * @author linh2
 */
public class HandleAccount {
    public static String NAME_ROOT = "root";
    public static String PASSWORD_ROOT="hoanglinh777";
    public static boolean Login(String userName,String passWord ){
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        ArrayList<Account> accounts = new ArrayList<>();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/carshopping", NAME_ROOT, PASSWORD_ROOT);
            String sql= "select isValidAccount('"+userName+"','"+passWord+"') as valid";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            resultSet.next();
            boolean isValid = resultSet.getBoolean("valid");
            resultSet.close();
            statement.close();
            connection.close();
            return isValid;
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
            return false;
            
        }
        catch(ClassNotFoundException e){
            System.out.println(e.getMessage()); 
            return false;
        } 
    }
public static boolean createAccount(Account account){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/carshopping", NAME_ROOT, PASSWORD_ROOT);
            String sql = " INSERT INTO person_account(user_name,pass_word) values(?,?)";
            preparedStatement = (PreparedStatement) connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getUserName());
            preparedStatement.setString(2, account.getPassWord());
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
    public static int getIdAccount(String userName){
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        ArrayList<Account> accounts = new ArrayList<>();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/carshopping", NAME_ROOT, PASSWORD_ROOT);
            String sql= "select getIdAccount('"+userName+"') as id";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            resultSet.next();
            int id = resultSet.getInt("id");
            resultSet.close();
            statement.close();
            connection.close();
            return id;
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
            return 0;
            
        }
        catch(ClassNotFoundException e){
            e.getMessage();
            return 0;
    }
    }
    
    public static boolean enterInformation (int id ,Person person){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/carshopping", NAME_ROOT, PASSWORD_ROOT);
            String sql = " INSERT INTO person(id,first_name,last_name,gender,date_of_birth,phone_number,address) values(?,?,?,?,?,?,?)";
            preparedStatement = (PreparedStatement) connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, person.getFirstName());
            preparedStatement.setString(3, person.getLastName());
            preparedStatement.setString(4, person.getGender()+"");
            preparedStatement.setString(5, person.getDateOfBirth());
            preparedStatement.setLong(6, person.getPhoneNumber());
            preparedStatement.setString(7,person.getAddress() );
            preparedStatement.executeUpdate();
            //
            preparedStatement.close();
            connection.close();
            return true;
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
            return false;
            
        }
        catch(ClassNotFoundException e){
            System.out.println("");
            return false;
        }
    }
    public static char getRole(int id){
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        char role = 'u';
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/carshopping",NAME_ROOT,PASSWORD_ROOT);
            String sql = "SELECT * FROM person WHERE ID = "+id;
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                role = resultSet.getString("role").charAt(0);
            }
            resultSet.close();
            statement.close();
            connection.close();
            return role;
        }
        catch(SQLException e){
            e.printStackTrace();
            return 'u';
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(HandleAccount.class.getName()).log(Level.SEVERE, null, ex);
            return 'u';
        }
    }
    public static Person getPersonViaID(int id){
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Person person = new Person();
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/carshopping",NAME_ROOT,PASSWORD_ROOT);
            String sql = "SELECT * FROM person WHERE ID = "+id;
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                person.setId(resultSet.getInt("id"));
                person.setFirstName(resultSet.getString("first_name"));
                person.setLastName(resultSet.getString("last_name"));
                person.setGender(resultSet.getString("gender").charAt(0));
                person.setDateOfBirth(resultSet.getString("date_of_birth"));
                person.setPhoneNumber(resultSet.getLong("phone_number"));
                person.setAddress(resultSet.getString("address"));
            }
            resultSet.close();
            statement.close();
            connection.close();
            return person;
        }
        catch(SQLException e){
            e.printStackTrace();
            return null;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(HandleAccount.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    public static void main(String[] args) {
//        System.out.println(Login("linh", "linh123"));
//        System.out.println(getIdAccount("linh"));
         int id = getIdAccount("linh");
         System.out.println(getRole(id));
         
    }
   
}
