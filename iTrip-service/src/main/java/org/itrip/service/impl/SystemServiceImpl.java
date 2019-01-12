package org.itrip.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.itrip.mapper.SystemMapper;
import org.itrip.pojo.Dictionarydate;
import org.itrip.pojo.House;
import org.itrip.pojo.Order;
import org.itrip.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SystemServiceImpl implements SystemService  {

	@Autowired
	SystemMapper systemMapper;

	@Override
	public List<Dictionarydate> listdictionarydate() {
		return systemMapper.listdictionarydate();
	}

	@Override
	public Dictionarydate SystemId(int id) {
		return systemMapper.SystemId(id);
	}

	@Override
	public int systemdictionarydate(Dictionarydate dictionarydate) {
		return systemMapper.systemdictionarydate(dictionarydate);
	}

	@Override
	public int systemdelete(int id) {
		return systemMapper.systemdelete(id);
	}

	@Override
	public Integer systemroledelete(int[] idarr) {
		return systemMapper.systemroledelete(idarr);
	}

	@Override
	public int systemroleadd(Dictionarydate dictionarydate) {
		return systemMapper.systemroleadd(dictionarydate);
	}

	@Override
	public int systemCount() {
		return systemMapper.systemCount();
	}

	
	
	
	
	
	
	
	
	
	@Override
	public List<Order> orderQuery(Order order) {
		return systemMapper.orderQuery(order);
	}

	@Override
	public Order OrderUpdata(int id) {
		return systemMapper.OrderUpdata(id);
	}

	@Override
	public List<Dictionarydate> Orderlist() {
		return systemMapper.Orderlist();
	}

	@Override
	public int OrderListUpdate(Order order) {
		return systemMapper.OrderListUpdate(order);
	}

	@Override
	public int countorder(Order order) {
		return systemMapper.countorder(order);
	}
	/*
	 * 查询所属酒店所有房间类型
	 */
	public List<House> getQueryHouseOrder(@Param("hotelId")Integer hotelId){
		return systemMapper.getQueryHouseOrder(hotelId);
	}
	/**
	 * 删除用户
	 */
	public int deletePicOne(@Param("id")int id) {
		return systemMapper.deletePicOne(id);
	}
	/**
	 * 删除多个用户
	 */
	public Integer deletePics(int[] idarr) {
		return systemMapper.deletePics(idarr);
	}

	
}
