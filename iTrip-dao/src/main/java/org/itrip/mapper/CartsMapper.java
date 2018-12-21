package org.itrip.mapper;
import org.itrip.pojo.Year;
import org.springframework.stereotype.Component;

/**
 * 显示图形报表
 * @author Administrator
 *
 */
@Component
public interface CartsMapper {
	//统计每月订单数
	Year getCartsQuery(Year year);
	//统计每月订单金额
	Year getCartsQueryPrice(Year year);
}
