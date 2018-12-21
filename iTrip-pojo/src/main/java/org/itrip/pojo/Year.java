package org.itrip.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.serializer.support.SerializationFailedException;

/**
 * 生成本年
 * @author Administrator
 *
 */
public class Year {
	//单位
	private Integer numPrice = 10000;
	
	//1-12月截至日期
	private String one;
	private String tow;
	private String three;
	private String four;
	private String five;
	private String six;
	private String seven;
	private String eight;
	private String nine;
	private String ten;
	private String eleven;
	private String twelve;
	//1-12月开始日期
	private String one1;
	private String tow1;
	private String three1;
	private String four1;
	private String five1;
	private String six1;
	private String seven1;
	private String eight1;
	private String nine1;
	private String ten1;
	private String eleven1;
	private String twelve1;
	
	/**
	 * 计算年 月 日
	 */
	public void getNum() {
		 int year = 0; //年份
		 
		//获得当前时间
		 SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		 String currentTime = simple.format(new Date());
		 //获得年 月 日
		 if(currentTime != null) {
			 String[] array = currentTime.split("-");
			 //年
			 year = Integer.valueOf(array[0]);
			 
			 //开始时间
			 this.setOne1(array[0]+"-"+"1-"+"1");
			 this.setThree1(array[0]+"-"+"3-"+"1");
			 this.setFive1(array[0]+"-"+"5-"+"1");
			 this.setSeven1(array[0]+"-"+"7-"+"1");
			 this.setEight1(array[0]+"-"+"8-"+"1");
			 this.setTen1(array[0]+"-"+"10-"+"1");
			 this.setTwelve1(array[0]+"-"+"12-"+"1");
			 this.setFour1(array[0]+"-"+"4-"+"1");
			 this.setSix1(array[0]+"-"+"6-"+"1");
			 this.setNine1(array[0]+"-"+"9-"+"1");
			 this.setEleven1(array[0]+"-"+"11-"+"1");
			 this.setTow1(array[0]+"-"+"2-"+"1");
			 
			 //结束时间
			//1、3、5、7、8、10、12 为31天
			 this.setOne(array[0]+"-"+"1-"+"31");
			 this.setThree(array[0]+"-"+"3-"+"31");
			 this.setFive(array[0]+"-"+"5-"+"31");
			 this.setSeven(array[0]+"-"+"7-"+"31");
			 this.setEight(array[0]+"-"+"8-"+"31");
			 this.setTen(array[0]+"-"+"10-"+"31");
			 this.setTwelve(array[0]+"-"+"12-"+"31");
			//4、6、9、11为30天
			 this.setFour(array[0]+"-"+"4-"+"30");
			 this.setSix(array[0]+"-"+"6-"+"30");
			 this.setNine(array[0]+"-"+"9-"+"30");
			 this.setEleven(array[0]+"-"+"11-"+"30");
			 
			 //闰年
			 if((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
				 //2为29天
				 this.setTow(array[0]+"-"+"2-"+"29");
			 }else {  //平年
				 this.setTow(array[0]+"-"+"2-"+"28");
			 }
		 }
	}
	
	
	public Integer getNumPrice() {
		return numPrice;
	}

	public void setNumPrice(Integer numPrice) {
		this.numPrice = numPrice;
	}


	public String getOne() {
		return one;
	}
	public void setOne(String one) {
		this.one = one;
	}
	public String getTow() {
		return tow;
	}
	public void setTow(String tow) {
		this.tow = tow;
	}
	public String getThree() {
		return three;
	}
	public void setThree(String three) {
		this.three = three;
	}
	public String getFour() {
		return four;
	}
	public void setFour(String four) {
		this.four = four;
	}
	public String getFive() {
		return five;
	}
	public void setFive(String five) {
		this.five = five;
	}
	public String getSix() {
		return six;
	}
	public void setSix(String six) {
		this.six = six;
	}
	public String getSeven() {
		return seven;
	}
	public void setSeven(String seven) {
		this.seven = seven;
	}
	public String getEight() {
		return eight;
	}
	public void setEight(String eight) {
		this.eight = eight;
	}
	public String getNine() {
		return nine;
	}
	public void setNine(String nine) {
		this.nine = nine;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public String getEleven() {
		return eleven;
	}
	public void setEleven(String eleven) {
		this.eleven = eleven;
	}
	public String getTwelve() {
		return twelve;
	}
	public void setTwelve(String twelve) {
		this.twelve = twelve;
	}


	public String getOne1() {
		return one1;
	}


	public void setOne1(String one1) {
		this.one1 = one1;
	}


	public String getTow1() {
		return tow1;
	}


	public void setTow1(String tow1) {
		this.tow1 = tow1;
	}


	public String getThree1() {
		return three1;
	}


	public void setThree1(String three1) {
		this.three1 = three1;
	}


	public String getFour1() {
		return four1;
	}


	public void setFour1(String four1) {
		this.four1 = four1;
	}


	public String getFive1() {
		return five1;
	}


	public void setFive1(String five1) {
		this.five1 = five1;
	}


	public String getSix1() {
		return six1;
	}


	public void setSix1(String six1) {
		this.six1 = six1;
	}


	public String getSeven1() {
		return seven1;
	}


	public void setSeven1(String seven1) {
		this.seven1 = seven1;
	}


	public String getEight1() {
		return eight1;
	}


	public void setEight1(String eight1) {
		this.eight1 = eight1;
	}


	public String getNine1() {
		return nine1;
	}


	public void setNine1(String nine1) {
		this.nine1 = nine1;
	}


	public String getTen1() {
		return ten1;
	}


	public void setTen1(String ten1) {
		this.ten1 = ten1;
	}


	public String getEleven1() {
		return eleven1;
	}


	public void setEleven1(String eleven1) {
		this.eleven1 = eleven1;
	}


	public String getTwelve1() {
		return twelve1;
	}


	public void setTwelve1(String twelve1) {
		this.twelve1 = twelve1;
	}
	
	
	
	
	
	
}
