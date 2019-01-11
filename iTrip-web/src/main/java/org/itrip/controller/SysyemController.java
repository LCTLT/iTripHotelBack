package org.itrip.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.itrip.pojo.Dictionarydate;
import org.itrip.pojo.Order;
import org.itrip.pojo.User;
import org.itrip.service.SystemService;
import org.itrip.utils.CheckUtil;
import org.itrip.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SysyemController {
	@Autowired
	SystemService systemService;
	
	private static SimpleDateFormat forms = null;
	static {
		forms = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	}
	/**
	 * 字典表查询
	 * @param request
	 * @return
	 */
	@RequestMapping("system-data.do")
	public String list(HttpServletRequest request) {
		List<Dictionarydate> list= systemService.listdictionarydate();
		PageUtil.pageCount=systemService.systemCount();
		
		request.setAttribute("count", PageUtil.pageCount);
		request.setAttribute("systemlist", list);
		return "system-data";
	}
	/**
	 * 点击编辑
	 * @param request
	 * @param type
	 * @param id
	 * @return
	 */

	@RequestMapping("system-add.do")
	public String systemAdd(HttpServletRequest request,@RequestParam("id")int id) {
		request.setAttribute("system", systemService.SystemId(id));
		return "system-add";
	}
	
	/**
	 * 修改数据
	 * @param dictionarydate
	 * @return
	 */
	@RequestMapping("system-role-add.do")
	@ResponseBody
	public 	String systemRoleAdd(Dictionarydate dictionarydate) {
		int result=this.systemService.systemdictionarydate(dictionarydate);
		System.out.println("修改状态值="+result);
		if(result > 0) {
			return "1";
		}else {
			return "0";
		}
	}
	/**
	 * 字典表删除
	 * @param id
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("system-delete.do")
	@ResponseBody
	public int memberRoleUser(@RequestParam("id")Integer id) throws UnsupportedEncodingException{
		int i =systemService.systemdelete(id);
		return i;
	}
	@RequestMapping("system-deleteUser.do")
	@ResponseBody
	public int memberRoleUserList(HttpServletResponse response, HttpServletRequest request,int[] arr) throws IOException, ServletException {
		int result = systemService.systemroledelete(arr);
		return result;
	}
	
	/**
	 * 添加数据
	  */
	@RequestMapping("system-role—add.do")
	@ResponseBody
	public String systemAdd(Dictionarydate dictionarydate) {
		int add=this.systemService.systemroleadd(dictionarydate);
		if(add>0) {
			return "1";
		}else {
			return "0";
		}
		
	}
	/**
	 * 敏感操作密码验证
	 */
	@RequestMapping("boolpwd.do")
	@ResponseBody
	public String checkBoolPwd(@RequestParam("pwd")String pwd,HttpSession session) {
		try {
			//获取session
			User user = (User)session.getAttribute("userSession");
			
			if(user.getPwd().equals(CheckUtil.getSha1(pwd))) {
				//验证成功
				return "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "0"; //验证失败
	}
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 订单查询
	 * @param request
	 * @return
	 */
	@RequestMapping("picture-list.do")
	public String order(HttpServletRequest request) {
		List<Order> list=systemService.orderQuery();
		
		PageUtil.pageCount=systemService.countorder();
		request.setAttribute("count", PageUtil.pageCount);
		
		request.setAttribute("pricture", list);
		return "picture-list";
	}
	
	/**
	 * 点击编辑
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping("picture-add.do")
	public String orderlist(HttpServletRequest request,@RequestParam("id")int id) {
		List<Dictionarydate> list=systemService.Orderlist();
		Order orderUpdata = systemService.OrderUpdata(id);
		//格式化时间
		orderUpdata.setCheckInDates(forms.format(orderUpdata.getCheckInDate()));
		orderUpdata.setCheckOutDates(forms.format(orderUpdata.getCheckOutDate()));
		request.setAttribute("picture", orderUpdata);
		request.setAttribute("dictionarydate", list);
		return "picture-add";
	}
	
	
	
	@RequestMapping("picture-addList.do")
	@ResponseBody
	public 	String OrderListupdate(Order order) {
		int result=this.systemService.OrderListUpdate(order);
		System.out.println("修改状态值="+result);
		if(result > 0) {
			return "1";
		}else {
			return "0";
		}
	}
	
	
	
	
	
	
	
	
	
	
}












