package org.itrip.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.itrip.mapper.ProductMapper;
import org.itrip.pojo.Dictionarydate;
import org.itrip.pojo.Hotel;
import org.itrip.pojo.Level;
import org.itrip.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper productMapper;
	
	@Override
	public List<Hotel> getQueryHotelList() {
		// TODO Auto-generated method stub
		return productMapper.queryHotelList();
	}

	@Override
	public int updateHotel(Hotel hotel) {
		// TODO Auto-generated method stub
		return productMapper.updateHotel(hotel);
	}

	@Override
	public Hotel queryUpdateHotel(int hotelId) {
		// TODO Auto-generated method stub
		return productMapper.queryUpdateHotel(hotelId);
	}

	@Override
	public int insertHotel(Hotel hotel) {
		// TODO Auto-generated method stub
		return productMapper.insertHotel(hotel);
	}

	@Override
	public List<Level> queryType1() {
		// TODO Auto-generated method stub
		return productMapper.queryType1();
	}
	@Override
	public List<Level> queryType2() {
		// TODO Auto-generated method stub
		return productMapper.queryType2();
	}
	@Override
	public List<Level> queryType3() {
		// TODO Auto-generated method stub
		return productMapper.queryType3();
	}

	@Override
	public int deleteHotel(int hotelId) {
		// TODO Auto-generated method stub
		return productMapper.deleteHotel(hotelId);
	}

	@Override
	public Integer deleteHotelList(int[] idarr) {
		// TODO Auto-generated method stub
		return productMapper.deleteHotelList(idarr);
	}

	@Override
	public int getcountHotel() {
		// TODO Auto-generated method stub
		return productMapper.countHotel();
	}

	@Override
	public List<Level> getLevel2(Integer id) {
		
		return productMapper.getLevel2(id);
	}
	/**
	 * 读取酒店星级
	 */
	public List<Dictionarydate> getQueryList(){
		return productMapper.getQueryList();
	}

	@Override
	public int savaLevel(Level level) {
		// TODO Auto-generated method stub
		return productMapper.savaLevel(level);
	}

	@Override
	public List<Level> seleLevel(String name) {
		boolean fig = false;
		Level level = new Level();
		//根据name查询出某一个id
		if(name != null && !name.equals("")) {
			level = productMapper.getQueryNameLevel(name);
			fig = true;
		}
		List<Level> seleLevel = productMapper.seleLevel(level.getId());
		//添加原来的
		if(fig) {
			seleLevel.add(level);
		}
		return seleLevel;
	}

	@Override
	public int updateLevel(Level level) {
		// TODO Auto-generated method stub
		return productMapper.updateLevel(level);
	}

	@Override
	public int deleLevel(int id) {
		// TODO Auto-generated method stub
		return productMapper.deleLevel(id);
	}
	/**
	 * 查询分类是否可删除
	 */
	public int getSelectCount(Integer id) {
		return productMapper.getSelectCount(id);
	}
}
