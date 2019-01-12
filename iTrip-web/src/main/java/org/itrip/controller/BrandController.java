package org.itrip.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.itrip.pojo.Hotel;
import org.itrip.pojo.House;
import org.itrip.pojo.Level;
import org.itrip.pojo.Rawstock;
import org.itrip.service.BrandService;
import org.itrip.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
@Controller
public class BrandController {
	@Autowired
    BrandService brandService;
	@Autowired
	ProductService productService;
	
	@RequestMapping("product-brand.do")
	public String querylist(HttpServletRequest request) {
		String houseName = request.getParameter("houseName");
		String hotelName = request.getParameter("hotelName");
		List<House> house = brandService.querylist(houseName,hotelName);
		int count = brandService.queryList(houseName);
		request.setAttribute("count",count);
		request.setAttribute("hotel",house);
		request.setAttribute("ist",houseName);
		request.setAttribute("hotelName",hotelName);
		return "product-brand";
	}
	@RequestMapping("product-brand-del.do")
	@ResponseBody
	public int deleteDel(@RequestParam("id")Integer id,HttpServletRequest request) {
		int i = brandService.deleteDel(id);
		return i;
	}
	@RequestMapping("product-brand-delList.do")
	@ResponseBody
	public int deleteDelList(HttpServletRequest request,int[] arr) {
		int i = brandService.deleteDelList(arr);
		return i;
	}
	
	/**
	 * 判断添加或修改进入页面
	 */
	@RequestMapping("product-brand-add.do")
	public String productAdd(HttpServletRequest request,@RequestParam("type")int type,@RequestParam("houseId")int id) {
		List<Level> queryType1 = productService.queryType1();
		if(type == 2) {
			//查询出房型
			House house = brandService.queryType4(id);
			request.setAttribute("House", house);

			Rawstock rawstock=brandService.queryType5(house.getHouseId());
			request.setAttribute("rawstock", rawstock);
			//根据房型的id查询出酒店内容
			Hotel hotels = this.productService.queryUpdateHotel(house.getHotelId());
			request.setAttribute("hotel", hotels);
			if(hotels.getLevel2() > 0) {
				request.setAttribute("types2",this.productService.getLevel2(hotels.getLevel1()));
			}
			if(hotels.getLevel3() > 0) {
				request.setAttribute("types3", productService.getLevel2(hotels.getLevel2()));
			}
		}
		
		request.setAttribute("types1", queryType1);
		request.setAttribute("type",type);
		return "product-brand-add";
	}
  /**
   * 添加房间信息
   * @param house
   * @param request
   * @return
   */
	@RequestMapping("product-brand-add1.do")
	@ResponseBody
	public Integer insertlist(House house,HttpServletRequest request) {
        int result = brandService.insertHouse(house);
        if(result > 0) {
        	 Rawstock rawstock = new Rawstock();
        	 rawstock.setStore(Integer.valueOf(request.getParameter("store"))); //获得库存
        	 rawstock.setProductType(house.getHotelId()); //酒店外键
        	 rawstock.setHotelId(house.getHouseId()); //房型外键
             brandService.inserRawstock(rawstock);
        }
        return result;
	}

	/**
	 * 修改房间
	 */
	@RequestMapping("updateHouse.do")
	@ResponseBody
	public Integer updateHouse(House house,HttpServletRequest request) {
		int result = brandService.updateHouse(house);
		return result;
	}
	/*
	 * 加载二、三级分类
	 */
	@RequestMapping("level2-list1.do")
	@ResponseBody
	public String level2(@RequestParam("id")Integer id) throws IOException, ServletException {
		List<Level> list = this.productService.getLevel2(id);
		return JSON.toJSONString(list);
	}
	/*
	 * 加载酒店
	 */
	@RequestMapping("level2-list2.do")
	@ResponseBody
	public String level3(Hotel hotel) throws IOException, ServletException {
		List<Hotel> list = this.brandService.querylevel4(hotel);
		return JSON.toJSONString(list);
	}
	
}
