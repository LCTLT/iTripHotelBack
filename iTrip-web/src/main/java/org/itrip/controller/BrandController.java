package org.itrip.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.itrip.pojo.Hotel;
import org.itrip.pojo.House;
import org.itrip.pojo.Level;
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
		String house = request.getParameter("house");
		List<House> hotel = brandService.querylist(house);
		int  count = brandService.queryList();
		request.setAttribute("count",count);
		request.setAttribute("hotel",hotel);
		request.setAttribute("ist",house);
		return "product-brand";
	}
	@RequestMapping("product-brand-del.do")
	public int deleteDel(@RequestParam("id")Integer id,HttpServletRequest request) {
		int i = brandService.deleteDel(id);
		return i;
	}
	@RequestMapping("product-brand-delList.do")
	public int deleteDelList(HttpServletRequest request,int[] arr) {
		int i = brandService.deleteDelList(arr);
		return i;
	}
	
	/**
	 * 判断添加或修改进入页面
	 */
	@RequestMapping("product-brand-add.do")
	public String productAdd(Hotel hotel,HttpServletRequest request,@RequestParam("type")int type,@RequestParam("hotelId")int id,@RequestParam("houseId")int houseId) {
		if(type == 2) {
			Hotel hotels = this.productService.queryUpdateHotel(id);
			request.setAttribute("hotel", hotels);
			House house = brandService.queryType4(houseId);
			request.setAttribute("House",house);
			if(hotels.getLevel2() > 0) {
				request.setAttribute("types2", productService.getLevel2(hotels.getLevel1()));
			}
			if(hotels.getLevel3() > 0) {
				request.setAttribute("types3", productService.getLevel2(hotels.getLevel2()));
			}
		}
		request.setAttribute("types1", productService.queryType1());
		//查询酒店星级
		request.setAttribute("dictionarydate", productService.getQueryList());
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
	public String insertlist(House house,HttpServletRequest request) {
        int result = brandService.insertHouse(house);
        if(result>0) {
        	return "forward:/product-brand.do";
        }else {
        	return "forward:/product-brand-add.do";
        }
	}
	/**
	 * 修改房间类型
	 */
	@RequestMapping("updateHouse.do")
	public String updateHouse(House house,HttpServletRequest request) {
		int result = brandService.updateHouse(house);
		 if(result>0) {
			 System.out.println("成功");
        	return "forward:/product-brand.do";
        }else {
        	return "forward:/product-brand-add.do";
        }
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
	 * 加载二、三级分类
	 */
	@RequestMapping("level2-list2.do")
	@ResponseBody
	public String level3(Hotel hotel) throws IOException, ServletException {
		List<Hotel> list = this.brandService.querylevel4(hotel);
		return JSON.toJSONString(list);
	}
	
}
