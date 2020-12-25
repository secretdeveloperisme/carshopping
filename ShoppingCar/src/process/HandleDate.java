/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package process;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author linh2
 */
public class HandleDate {
    private Date date;

    public HandleDate() {
        date = new Date();
    }

    public HandleDate(Date date) {
        this.date = date;
    }
    public String getDay(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd");
        String day = simpleDateFormat.format(date);
        return day;
    }
    public String getMonth(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM");
        String month = simpleDateFormat.format(date);
        return month;
    }
    public String getYear(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
        String year = simpleDateFormat.format(date);
        return year;
    }
    public String getFullDate(){
       SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
        String fullDate = simpleDateFormat.format(date);
        return fullDate;
    }
    public String getFullDateMySQL(){
       SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
        String fullDate = simpleDateFormat.format(date);
        return fullDate;
    }
    
    public static void main(String[] args) {
        
        
    }
    
}
