package org.itrip.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.itrip.pojo.Hotel;
import org.itrip.pojo.House;

public interface BrandMapper {
   /**
       * 显示房型数据
    */
	List<House> querylist(@Param("house")String house);
	/**
	 * 查询数据量
	 */
	int getCount(@Param("houseName")String houseName);
	/**
	 * 删除
	 */
	int deleteDel(int id);
	/**
	 * 批量删除
	 */
	Integer deleteDelList(int[] idarr);
	/**
	 * 查询房型信息
	 */
	House queryType4(int hotelId);
	/**
	 * 查询三级指定
	 */
	List<Hotel> querylevel4(Hotel hotel);
	/**
	 * 增加房型信息
	 */
	int insertHouse(House house);
	/**
	 * 修改房型信息
	 */
	int updateHouse(House house);
}
