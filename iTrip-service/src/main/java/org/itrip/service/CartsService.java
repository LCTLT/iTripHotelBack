package org.itrip.service;

/**
 * 显示图形报表
 * @author Administrator
 *
 */
public interface CartsService {
	
	Integer[] getCartsQuery();
	
	//统计每月订单金额
	Double[] getCartsQueryPrice();
}
