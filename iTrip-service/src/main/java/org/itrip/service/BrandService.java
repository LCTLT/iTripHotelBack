package org.itrip.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.itrip.pojo.Hotel;
import org.itrip.pojo.House;
import org.itrip.pojo.Level;
import org.itrip.pojo.Rawstock;

public interface BrandService {
	List<House> querylist(String house,String hotelName);
	int queryList(String houseName);
	int deleteDel(int id);
	Integer deleteDelList(int[] idarr);
	House queryType4(int hotelId);
	int insertHouse(House house);
	int updateHouse(House house);
	List<Hotel> querylevel4(Hotel hotel);
	/**
	 * 库存增加
	 * @return
	 */
	int inserRawstock(Rawstock rawstock);
	/**
	 * 根据房型查询库存
	 * @return
	 */
	Rawstock queryType5(Integer houseId);
}
