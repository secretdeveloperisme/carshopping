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
import model.Account;
import model.Person;

/**
 *
 * @author linh2
 */
public class HandleLogin {
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
            String sql= "select * from person_account";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                Account account = new Account(Integer.parseInt(resultSet.getString("id")),resultSet.getString("user_Name"),resultSet.getString("pass_Word"));
                accounts.add(account);
            }
            for(int i=0;i<accounts.size();i++){
                if(accounts.get(i).getUserName().equals(userName)&&accounts.get(i).getPassWord().equals(passWord))
                {
                    return true;
                }
            }
            resultSet.close();
            statement.close();
            connection.close();
            return false;
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
            return false;
            
        }
        catch(ClassNotFoundException e){
            e.getMessage();
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
    
    public static boolean enterInformation (int id,Person person){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/carshopping", NAME_ROOT, PASSWORD_ROOT);
            String sql = " INSERT INTO person values(?,?,?,?,?,?,?)";
            preparedStatement = (PreparedStatement) connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, person.getFirstName());
            preparedStatement.setString(3, person.getLastName());
            preparedStatement.setString(4, person.getGender()+"");
            preparedStatement.setString(5, person.getDateOfBirth());
            preparedStatement.setString(6, person.getAddress());
            preparedStatement.setInt(7, (int) person.getPhoneNumber());
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
    public static void main(String[] args) {
        createAccount(new Account( "lieu", "lieu123"));
    }
   
}
