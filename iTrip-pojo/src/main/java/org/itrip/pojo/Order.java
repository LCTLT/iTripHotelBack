package org.itrip.pojo;

import java.util.Date;

/**
 * ������
 * @author Administrator
 *
 */
public class Order {
	
	private int id;//主键id
	private String orderNo;//订单编号
	private int hotelId;//酒店id
	private int count;//预订房间数量
	private int bookingDays;//预订天数
	private Date checkInDate;//入住日期
	private Date checkOutDate;//退房日期
	private int orderStatus;//订单状态
	private double payAmount;//支付金额
	private int payType;//支付类型
	private String noticePhone;//联系电话
	private String noticeEmail;//联系邮件
	private String linkUserName;//联系人姓名
	private String context;//备注
	private String place;//出发地
	private int bookType;//客户端(0.web端，1.手机端，2.其它)
		
		
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getOrderNo() {
			return orderNo;
		}
		public void setOrderNo(String orderNo) {
			this.orderNo = orderNo;
		}
		public int getHotelId() {
			return hotelId;
		}
		public void setHotelId(int hotelId) {
			this.hotelId = hotelId;
		}
		public int getCount() {
			return count;
		}
		public void setCount(int count) {
			this.count = count;
		}
		public int getBookingDays() {
			return bookingDays;
		}
		public void setBookingDays(int bookingDays) {
			this.bookingDays = bookingDays;
		}
		public int getOrderStatus() {
			return orderStatus;
		}
		public void setOrderStatus(int orderStatus) {
			this.orderStatus = orderStatus;
		}
		public double getPayAmount() {
			return payAmount;
		}
		public void setPayAmount(double payAmount) {
			this.payAmount = payAmount;
		}
		public int getPayType() {
			return payType;
		}
		public void setPayType(int payType) {
			this.payType = payType;
		}
		public String getNoticePhone() {
			return noticePhone;
		}
		public void setNoticePhone(String noticePhone) {
			this.noticePhone = noticePhone;
		}
		public String getNoticeEmail() {
			return noticeEmail;
		}
		public void setNoticeEmail(String noticeEmail) {
			this.noticeEmail = noticeEmail;
		}
		public String getLinkUserName() {
			return linkUserName;
		}
		public void setLinkUserName(String linkUserName) {
			this.linkUserName = linkUserName;
		}
		public String getContext() {
			return context;
		}
		public void setContext(String context) {
			this.context = context;
		}
		public String getPlace() {
			return place;
		}
		public void setPlace(String place) {
			this.place = place;
		}
		public int getBookType() {
			return bookType;
		}
		public void setBookType(int bookType) {
			this.bookType = bookType;
		}
		public Date getCheckInDate() {
			return checkInDate;
		}
		public void setCheckInDate(Date checkInDate) {
			this.checkInDate = checkInDate;
		}
		public Date getCheckOutDate() {
			return checkOutDate;
		}
		public void setCheckOutDate(Date checkOutDate) {
			this.checkOutDate = checkOutDate;
		}
	
		
}
