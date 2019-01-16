package org.itrip.service.impl;

import org.itrip.mapper.CartsMapper;
import org.itrip.service.CartsService;
import org.itrip.pojo.Year;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 显示图形报表
 * @author Administrator
 *
 */
@Service
public class CartsServiceImpl implements CartsService{

	@Autowired
	private CartsMapper cartsMapper;
	
	@Override
	public Integer[] getCartsQuery() {
		Year year = new Year();
		year.getNum(); //获得参数
		Year yearParam = cartsMapper.getCartsQuery(year);
		//转换为数组
		if(yearParam != null) {
			return new Integer[] {Integer.valueOf(yearParam.getOne()),
					Integer.valueOf(yearParam.getTow()),
					Integer.valueOf(yearParam.getThree()),
					Integer.valueOf(yearParam.getFour()),
					Integer.valueOf(yearParam.getFive()),
					Integer.valueOf(yearParam.getSix()),
					Integer.valueOf(yearParam.getSeven()),
					Integer.valueOf(yearParam.getEight()),
					Integer.valueOf(yearParam.getNine()),
					Integer.valueOf(yearParam.getTen()),
					Integer.valueOf(yearParam.getEleven()),
					Integer.valueOf(yearParam.getTwelve())
			};
		}
		return null;
	}

	@Override
	public Double[] getCartsQueryPrice() {
		Year year = new Year();
		year.getNum(); //获得参数
		Year yearParam = cartsMapper.getCartsQueryPrice(year);
		//转换为数组
		if(yearParam != null) {
			Double[] array = new Double[] {
					Double.valueOf(yearParam.getOne()!=null?yearParam.getOne():"0"),
					Double.valueOf(yearParam.getTow()!=null?yearParam.getOne():"0"),
					Double.valueOf(yearParam.getThree()!=null?yearParam.getOne():"0"),
					Double.valueOf(yearParam.getFour()!=null?yearParam.getOne():"0"),
					Double.valueOf(yearParam.getFive()!=null?yearParam.getOne():"0"),
					Double.valueOf(yearParam.getSix()!=null?yearParam.getOne():"0"),
					Double.valueOf(yearParam.getSeven()!=null?yearParam.getOne():"0"),
					Double.valueOf(yearParam.getEight()!=null?yearParam.getOne():"0"),
					Double.valueOf(yearParam.getNine()!=null?yearParam.getOne():"0"),
					Double.valueOf(yearParam.getTen()!=null?yearParam.getOne():"0"),
					Double.valueOf(yearParam.getEleven()!=null?yearParam.getOne():"0"),
					Double.valueOf(yearParam.getTwelve()!=null?yearParam.getOne():"0")
			};
			//换算成万
			for (int i = 0; i < array.length; i++) {
				if(array[i] > 0) {
					array[i] = array[i]/yearParam.getNumPrice();
				}
			}
			return array;
		}
		return null;
	}
}
