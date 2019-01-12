package org.itrip.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.itrip.pojo.Dictionarydate;
import org.itrip.pojo.House;
import org.itrip.pojo.Order;
import org.springframework.stereotype.Component;

@Component
public interface SystemMapper {
	
	/**
	 * 字典表页面查询
	 */
	List<Dictionarydate> listdictionarydate();
	/**
	 * 点击添加
	 */
	Dictionarydate SystemId(int id);
	/**
	 * 修改数据
	 */
	int systemdictionarydate(Dictionarydate dictionarydate);
	/**
	 * 字典表删除
	 */
	int systemdelete(int id);
	/**
	 * 批量删除
	 */
	Integer systemroledelete(int[] idarr);
	/**
	 * 添加数据
	 */
	int systemroleadd(Dictionarydate dictionarydate);
	/**
	 * 数据总和
	 */
	int systemCount();
	
	
	
	
	
	
	/**
	 * 查询订单
	 */
	List<Order> orderQuery(Order order);
	
	/**
	 * 点击编辑订单
	 */
	Order OrderUpdata(int id);
	
	/**
	 * 查询字典表
	 */
	List<Dictionarydate> Orderlist();
	
	/**
	 * 点击修改
	 */
	int OrderListUpdate(Order order);
	
	/**
	 * 数据总和
	 */
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

































