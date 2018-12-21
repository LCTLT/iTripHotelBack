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
					Double.valueOf(yearParam.getOne()),
					Double.valueOf(yearParam.getTow()),
					Double.valueOf(yearParam.getThree()),
					Double.valueOf(yearParam.getFour()),
					Double.valueOf(yearParam.getFive()),
					Double.valueOf(yearParam.getSix()),
					Double.valueOf(yearParam.getSeven()),
					Double.valueOf(yearParam.getEight()),
					Double.valueOf(yearParam.getNine()),
					Double.valueOf(yearParam.getTen()),
					Double.valueOf(yearParam.getEleven()),
					Double.valueOf(yearParam.getTwelve())
			};
			//换算成万
			for (int i = 0; i < array.length; i++) {
				array[i] = array[i]/yearParam.getNumPrice();
			}
			
			return array;
		}
		return null;
	}
}
