package org.itrip.service.impl;

import java.util.List;

import org.itrip.mapper.BrandMapper;
import org.itrip.pojo.Hotel;
import org.itrip.pojo.House;
import org.itrip.pojo.Level;
import org.itrip.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class BrandServiceImpl implements BrandService{
	@Autowired
	BrandMapper brandMapper;

	@Override
	public List<House> querylist(String house) {
		// TODO Auto-generated method stub
		return brandMapper.querylist(house);
	}

	@Override
	public int queryList() {
		// TODO Auto-generated method stub
		return brandMapper.queryList();
	}

	@Override
	public int deleteDel(int id) {
		return brandMapper.deleteDel(id);
	}

	@Override
	public Integer deleteDelList(int[] idarr) {
		// TODO Auto-generated method stub
		return brandMapper.deleteDelList(idarr);
	}

	@Override
	public House queryType4(int hotelId) {
		// TODO Auto-generated method stub
		return brandMapper.queryType4(hotelId);
	}

	@Override
	public int insertHouse(House house) {
		// TODO Auto-generated method stub
		return brandMapper.insertHouse(house);
	}

	@Override
	public int updateHouse(House house) {
		// TODO Auto-generated method stub
		return brandMapper.updateHouse(house);
	}

	@Override
	public List<Hotel> querylevel4(Hotel hotel) {
		// TODO Auto-generated method stub
		return brandMapper.querylevel4(hotel);
	}

}
