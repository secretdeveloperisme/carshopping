/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package process;



/**
 *
 * @author linh2
 */
public class HandleNumber {
    public static boolean isNumber(String number){
       boolean isN = true;
       char[] numArray = new char[number.length()];
       for(int i = 0;i<number.length();i++){
           numArray[i] = number.charAt(i);
       }
       for(int i = 0;i<number.length();i++){
           if(numArray[i]<'0'||numArray[i]>'9')
               return false;
       }
        
       return isN;
    }
    public static void main(String[] args) {
        System.out.println(isNumber("5454iuji54"));
    }
}
