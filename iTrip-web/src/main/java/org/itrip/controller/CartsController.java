package org.itrip.controller;
import org.itrip.service.CartsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
/**
 * 统计图
 * @author Administrator
 *
 */
@Controller
public class CartsController {
	
	@Autowired
	private CartsService cartsService;
	/**
	 * 进入扇形统计图页面
	 * @return
	 */
	@RequestMapping("charts-5.do")
	public String carts5() {
		return "charts-5";
	}
	/**
	 * 进入折线统计图
	 */
	
	/**
	 * 异步加载订单数统计图数据
	 */
	@RequestMapping("getCarts.do")
	@ResponseBody
	public Integer[] getCarts(@RequestParam("type")String type) {
		Integer[] array = null;
		if(type!=null && type.equals("order")) {
			array = cartsService.getCartsQuery();
		}
		return array;
	}
	/**
	 * 异步加载销售额统计图数据
	 * @param type
	 * @return
	 */
	@RequestMapping("getCartsPrice.do")
	@ResponseBody
	public Double[] getCartsPrice(@RequestParam("type")String type) {
		Double[] array = null;
		if(type!=null && type.equals("price")) {
			array = cartsService.getCartsQueryPrice();
		}
		return array;
	}
}
