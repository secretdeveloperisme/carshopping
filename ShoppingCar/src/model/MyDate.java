/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.StringTokenizer;

/**
 *
 * @author linh2
 */
public class MyDate {
	private int ngay,thang,nam;
	public MyDate() {
		ngay = 1;
		thang = 1;
		nam = 2020;
	}
	public MyDate(int d, int m, int y) {
		ngay = d;
		thang = m;
		nam = y;	
	}
	public boolean hople() {
		int max[]= {0,31,28,31,30,31,30,31,30,31,30,31,30};
		if(nam%4==0) max[2]=29;
		if( ngay>0 && thang>0 && thang < 13 && nam>0  && ngay<=max[thang]  )
			return true;
		else return false;
	}
	
	public void setNgay(int ngay) {
		this.ngay = ngay;
	}
	public void setThang(int thang) {
		this.thang = thang;
	}
	public void setNam(int nam) {
		this.nam = nam;
	}
	public int getNgay() {
		return ngay;
	}
	public int getThang() {
		return thang;
	}
	public int getNam() {
		return nam;
	}
	public void in() {
		System.out.println(ngay+"/"+thang+"/"+nam);
	}
        public void setDayString(String str){
            StringTokenizer st = new StringTokenizer(str,"/");
            this.nam = Integer.parseInt(st.nextToken());
            this.thang = Integer.parseInt(st.nextToken()); 
            this.ngay = Integer.parseInt(st.nextToken());
        }
	public MyDate ngayhomsau() {
		MyDate d=new MyDate(ngay,thang,nam);
		d.ngay++;
		if(!d.hople()) {
			d.ngay=1;
			d.thang++;
			if(!d.hople()) {
				d.thang = 1;
				d.nam++;
			}
		}
		return d;
	}
	public MyDate congDate(int n) {
		MyDate d = new MyDate(ngay,thang,nam);
		for(int i=0;i<n;i++)
			d=d.ngayhomsau();
		return d;
	}
	public MyDate(MyDate day) {
		this.ngay = day.ngay;
		thang  = day.ngay;
		nam = day.nam;
	}
        public String getFormatMysql(){
            return getNam()+"/"+getThang()+"/"+getNgay();
        }
        public static void main(String[] args) {
         MyDate md = new MyDate();
         md.setDayString("2012/11/1");
         md.in();
    }
        
}