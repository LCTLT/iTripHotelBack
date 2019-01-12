package org.itrip.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.itrip.pojo.Dictionarydate;
import org.itrip.pojo.House;
import org.itrip.pojo.Order;

public interface SystemService {

	List<Dictionarydate> listdictionarydate();
	Dictionarydate SystemId(int id);
	int systemdictionarydate(Dictionarydate dictionarydate);
	int systemdelete(int id);
	Integer systemroledelete(int[] idarr);
	int systemroleadd(Dictionarydate dictionarydate);
	int systemCount();
	
	
	
	
	List<Order> orderQuery(Order order);
	Order OrderUpdata(int id);
	List<Dictionarydate> Orderlist();
	int OrderListUpdate(Order order);
	int countorder(Order order);
	/*
	 * 查询所属酒店所有房间类型
	 */
	List<House> getQueryHouseOrder(@Param("hotelId")Integer hotelId);
	/**
	 * 删除用户
	 */
	int deletePicOne(@Param("id")int id);
	/**
	 * 删除多个用户
	 */
	Integer deletePics(int[] idarr);
}
