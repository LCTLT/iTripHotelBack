package org.itrip.service;

import java.util.List;

import org.itrip.pojo.Dictionarydate;
import org.itrip.pojo.Hotel;
import org.itrip.pojo.Level;

public interface ProductService {
	/**
	 * 查询所有酒店
	 * @return
	 */
	List<Hotel> getQueryHotelList();
	/**
	 * 修改
	 */
	int updateHotel(Hotel hotel);
	/**
	 * 显示修改数据
	 */
	Hotel queryUpdateHotel(int hotelId);
	/**
	 * 添加酒店
	 */
	int insertHotel(Hotel hotel);
	/**
	 * 123级分类
	 */
	List<Level> queryType1();
	/**
	 * 123级分类
	 */
	List<Level> queryType2();
	/**
	 * 123级分类
	 */
	List<Level> queryType3();
	/**
	 * 查询指定二、三级分类
	 */
	List<Level> getLevel2(Integer id);
	/**
	 * 删除酒店
	 */
	int deleteHotel(int hotelId);

	/**
	 * 删除多个酒店
	 */
	Integer deleteHotelList(int[] idarr);
	/**
	 * 数据总和
	 */
	int getcountHotel();
	/**
	 * 读取酒店星级
	 */
	List<Dictionarydate> getQueryList();
	/**
	 * 分类管理添加
	 */
	int savaLevel(Level level);
	/**
	 * 查询分类
	 */
	List<Level> seleLevel();
	/**
	 * 修改分类
	 */
	int updateLevel(Level level);
	/**
	 * 删除分类
	 */
	int deleLevel(int id);
}
