package org.itrip.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.itrip.pojo.Hotel;
import org.itrip.pojo.House;
import org.itrip.pojo.Level;

public interface BrandService {
	List<House> querylist(String house);
	int queryList();
	int deleteDel(int id);
	Integer deleteDelList(int[] idarr);
	House queryType4(int hotelId);
	int insertHouse(House house);
	int updateHouse(House house);
	List<Hotel> querylevel4(Hotel hotel);
}
