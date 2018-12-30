package org.itrip.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.itrip.pojo.Hotel;
import org.itrip.pojo.Level;
import org.itrip.service.ProductService;
import org.itrip.utils.ProductRandomUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
/**
 * 产品管理
 * @author Administrator
 *
 */
@Controller
public class ProductController {

	@Autowired
	ProductService productService;

	@RequestMapping("productsava.do")
	@ResponseBody
	public Integer  productsava(HttpServletRequest request,Level level) {
		int sava=productService.savaLevel(level);
		return sava;
	}
	/**
	 * 分类管理
	 */
	@RequestMapping("product-category.do")
	public String productCategory(HttpServletRequest request) {
		String name = request.getParameter("name");
		request.setAttribute("name", name);
		List<Level> levels=productService.seleLevel(name);
		request.setAttribute("level", levels);
		return "product-category";
	}
	/**
	 * 分类显示
	 */
	@RequestMapping("product-category-add.do")
	public String productCategoryAdd(HttpServletRequest request) {
		request.setAttribute("types1", productService.queryType1());
		return "product-category-add";
	}
	/**
	 * 品牌管理
	 */
	@RequestMapping("product-list.do")
	public String productList(HttpServletRequest request) {
		List<Hotel> hotelList=productService.getQueryHotelList();
		int count=productService.getcountHotel();
		request.setAttribute("types1", productService.queryType1());
		request.setAttribute("types2", productService.queryType2());
		request.setAttribute("types3", productService.queryType3());
		request.setAttribute("hotelList", hotelList);
		request.setAttribute("count", count);
		return "product-list";
	}


	/**
	 * 判断添加或修改进入页面
	 */
	@RequestMapping("product-add.do")
	public String productAdd(HttpServletRequest request,@RequestParam("type")int type,@RequestParam("hotelId")int id) {
		if(type == 2) {
			Hotel hotels = this.productService.queryUpdateHotel(id);
			request.setAttribute("hotel", hotels);
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
		request.setAttribute("type", type);
		return "product-add";
	}

	@RequestMapping("add_update.do")
	public String add_update(Hotel hotel,@RequestParam(value="type",required=false)Integer type,HttpServletRequest request) {
		System.out.println("--------------add---------------update------------------"+type);
		request.setAttribute("type", type);
		if(type==1) {
			System.out.println("添加");
			return "forward:/insertHotel.do";
		}else if(type==2) {
			System.out.println("修改");
			return "forward:/updateHotel.do";
		}
		return null;
	}
	
	/**
	 * 添加
	 * @param hotel
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("insertHotel.do")
	public String insertHotel(@RequestParam("file")MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException {
		String hotelName = request.getParameter("hotelName");
		int level1 = Integer.valueOf(request.getParameter("level1"));
		String hotelAddress = request.getParameter("hotelAddress");
		String level2s = request.getParameter("level2");
		String level3s = request.getParameter("level3");
		int level2 = level2s != null && !level2s.equals("") ? Integer.valueOf(level2s) : 0 ;
		int level3 = level3s != null && !level3s.equals("") ? Integer.valueOf(level3s) : 0 ;
	    double hotelRatings =  Double.parseDouble(request.getParameter("hotelRatings"));
		String hotelphone = request.getParameter("hotelphone");
		double hotelPrice = Double.parseDouble(request.getParameter("hotelPrice"));
		String hotelIntro = request.getParameter("hotelIntro");
		String hotelRating=request.getParameter("hotelRating");
		//生成订单号
		String productNo = ProductRandomUtil.productNo();
		String fileUrl = null;
		//如果文件不为空，写入上传路径
		if(!file.isEmpty()) {
			//上传文件路径
			String path = "D:\\myHotel\\uploadFile";
			//数据库路径
			fileUrl = "/uploadFile/"+file.getOriginalFilename();

			//上传文件名
			String filename = file.getOriginalFilename();
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到目标文件夹中
			file.transferTo(filepath);
			
		}
		Hotel hotels = new Hotel( 0,productNo,hotelName,  hotelAddress,  hotelPrice,  hotelIntro,  hotelRatings,
				 level1,  level2,  level3,  fileUrl,  hotelphone,hotelRating);
		
		int result=this.productService.insertHotel(hotels);
		System.out.println(result);
		if (result>0) {
			return "forward:/product-list.do";
		}else {
			return "forward:/product-list.do";
		}
		
	}

	/**
	 * 修改酒店
	 */
	@RequestMapping("updateHotel.do")
	public String updateHotel(@RequestParam("file")MultipartFile file,HttpServletRequest request)throws IllegalStateException, IOException {
		String hotelName = request.getParameter("hotelName");
		int level1 = Integer.valueOf(request.getParameter("level1"));
		String hotelAddress = request.getParameter("hotelAddress");
		String level2s = request.getParameter("level2");
		String level3s = request.getParameter("level3");
		int level2 = level2s != null && !level2s.equals("") ? Integer.valueOf(level2s) : 0 ;
		int level3 = level3s != null && !level3s.equals("") ? Integer.valueOf(level3s) : 0 ;
	    double hotelRatings =  Double.parseDouble(request.getParameter("hotelRatings"));
		String hotelphone = request.getParameter("hotelphone");
		double hotelPrice = Double.parseDouble(request.getParameter("hotelPrice"));
		String hotelIntro = request.getParameter("hotelIntro");
		String hotelRating=request.getParameter("hotelRating");
		String id = request.getParameter("id");
		String fileUrl = null;
		//如果文件不为空，写入上传路径
		if(!file.isEmpty()) {
			//上传文件路径
			String path = "D:\\myHotel\\uploadFile";
			//数据库路径
			fileUrl = "/uploadFile/"+file.getOriginalFilename();

			//上传文件名
			String filename = file.getOriginalFilename();
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到目标文件夹中
			file.transferTo(filepath);
			
		}else {
			fileUrl = request.getParameter("fileUrl");
		}
		Hotel hotels = new Hotel(Integer.valueOf(id),"", hotelName,  hotelAddress,  hotelPrice,  hotelIntro,  hotelRatings,
				 level1,  level2,  level3,  fileUrl,  hotelphone,hotelRating);
		int result=this.productService.updateHotel(hotels);
		System.out.println("修改状态值="+result);
		if(result > 0) {
			return "forward:/product-list.do";
		}else {
			return "forward:/product-list.do";
		}
	}
	/*
	 * 加载二、三级分类
	 */
	@RequestMapping("level2-list.do")
	@ResponseBody
	public String level2(@RequestParam("id")Integer id) throws IOException, ServletException {
		List<Level> list = this.productService.getLevel2(id);
		return JSON.toJSONString(list);
	}
	
	
	/**
	 * 删除
	 * @param id
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("product-delete.do")
	@ResponseBody
	public int productDelete(@RequestParam("hotelId")Integer id) throws UnsupportedEncodingException{
		int i =productService.deleteHotel(id);
		System.out.println("int i="+id);
		return i;
	}

	@RequestMapping("product-deleteHotel.do")
	@ResponseBody
	public int productDeleteHotel(HttpServletResponse response, HttpServletRequest request,int[] arr) throws IOException, ServletException {
		int result = productService.deleteHotelList(arr);
		return result;
	}
	
	/**
	 * 修改分类
	 * @param request
	 * @param level
	 * @return
	 */
	@RequestMapping("product-updateLevel.do")
	public String productUpdateLevle(HttpServletRequest request,Level level) {
		int result=this.productService.updateLevel(level);
		System.out.println("分类修改状态值="+result);
		if(result > 0) {
			return "forward:/product-category.do";
		}else {
			return "forward:/product-category.do";
		}
	}
	
	/**
	 * 删除分类
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping("product-deleLevel.do")
	@ResponseBody
	public int productDeleLevel(@RequestParam("id")int id) {
		int resu=this.productService.deleLevel(id);
		System.out.println("int i="+id+"/");
		return resu;
	}
	/**
	 * 分类是否可被删除
	 * 作者：  lgx
	 */
	@RequestMapping("product-levelDel.do")
	@ResponseBody
	public int productDeleLevel(@RequestParam("id")Integer id) {
		int resu=this.productService.getSelectCount(id);
		return resu;
	}
}
