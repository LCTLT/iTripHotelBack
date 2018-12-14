package org.itrip.controller;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.Inet4Address;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.itrip.pojo.User;
import org.itrip.service.UserService;
import org.itrip.utils.ImageUtil;
import org.itrip.utils.LoginDate;
import org.itrip.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
/**
 * 用户管理
 * @author Administrator
 *
 */
@Controller
public class IndexController {
	@Autowired
	UserService userService;
	
	/**
	 * 进入index
	 */
	@RequestMapping("index.do")
	public String index() {
		return "index";
	}
	/**
	 * 加载我的桌面
	 */
	@RequestMapping("welcome.do")
	public String welcome() {
		return "welcome";
	}
	/**
	 * 进入角色管理
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("admin-role.do")
	public String adminRole(HttpServletRequest request) throws UnsupportedEncodingException {
		//当前页
		String pageNo = request.getParameter("pageNo");
		if(pageNo == null || pageNo.equals("")) {
			PageUtil.pageNo = 1;
		}else {
			PageUtil.pageNo = Integer.valueOf(pageNo);
		}
		
		//查询所有用户角色
		List<User> userList = userService.getQueryUserList(PageUtil.pageNo,PageUtil.pageSize);
		//计算用户数据量
		PageUtil.pageCount = userService.getcountUser();
		//计算总页数
		PageUtil.pageTotel = PageUtil.pageCount % PageUtil.pageSize == 0 ? PageUtil.pageCount / PageUtil.pageSize : (PageUtil.pageCount / PageUtil.pageSize) +1;
		//分页保存
		request.setAttribute("count", PageUtil.pageCount);
		request.setAttribute("pageNo", PageUtil.pageNo);
		request.setAttribute("pageTotel", PageUtil.pageTotel);
		
		request.setAttribute("userList", userList);
		return "admin-role";
	}
	/**
	 * 添加角色
	 */
	@RequestMapping("admin-role-add.do")
	public String adminRoleAdd(HttpServletRequest request,@RequestParam("type")int type,@RequestParam("id")int id) {
		if(type == 2) {
			request.setAttribute("user", userService.queryUpdate(id));
		}
		request.setAttribute("type", type);
		return "admin-role-add";
	}
	/**
	 * 登录
	 */
	@RequestMapping("login.do")
	public String login() {
		return "login";
	}
	/**
	 * 处理登入
	*/
	@RequestMapping("loginlist.do")
	@ResponseBody
	public String loginlist(HttpServletRequest request,User user) throws UnsupportedEncodingException {
		//判断图片验证码
		String numb = (String)request.getSession().getAttribute("code");
		if(numb != null && numb.equalsIgnoreCase(user.getNumbs())) {
			user = userService.getloginUser(user);
			if(user != null) {
				request.getSession().setAttribute("userSession", user);
				return "2"; //成功
			}else {
				return "1"; //失败账号或密码不正确
			}
		}else {
			return "0";  //失败验证码输入错误
		}
	}
	
	/**
	 * 图片验证码
	 */
	@RequestMapping("code.do")
    public String getCode(HttpServletRequest request, HttpServletResponse response) throws Exception{
        response.setContentType("image/jpeg");
        //禁止图像缓存
        response.setHeader("Pragma","no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        ImageUtil imageUtil = new ImageUtil(120, 40, 5,30);
        request.getSession().setAttribute("code", imageUtil.getCode());
        imageUtil.write(response.getOutputStream());
        return null;
    }
	/**
	 * 退出和切换用户
	 */
	@RequestMapping("exit.do")
	@ResponseBody
	public int exit(HttpServletRequest request) {
		int status = -1;
		request.getSession().removeAttribute("user");
		if(request.getSession().getAttribute("user") == null) {
			status = 1;
		}else {
			status = 0;
		}
		return status;
	}
	/**
	 * 删除
	 * @param id
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("admin-delete.do")
	@ResponseBody
	public int adminRoleUser(@RequestParam("id")Integer id) throws UnsupportedEncodingException{
		int i =userService.deleteUser(id);
		return i;
	}
	
	@RequestMapping("admin-deleteUser.do")
	@ResponseBody
	public int adminRoleUserList(HttpServletResponse response, HttpServletRequest request,int[] arr) throws IOException, ServletException {
		int result = userService.deleteUserList(arr);
		return result;
	}
	
	/**
	 * 权限管理
	 */
	@RequestMapping("admin-permission.do")
	public String adminPremission() {
		return "admin-permission";
	}
	
	/**
	 * 添加用户
	 */
	@RequestMapping("insertUser.do")
	@ResponseBody
	public String insertUser(User user,HttpServletRequest request) {
		int result = this.userService.insertUser(user);
		if(result > 0) {
			return "1";
		}else {
			return "0";
		}
	}
	/**
	 * 修改用户
	 */
	@RequestMapping("updateUser.do")
	@ResponseBody
	public String updateUser(User user,HttpServletRequest request) {
		int result=this.userService.updateUser(user);
		System.out.println("修改状态值="+result);
		if(result > 0) {
			return "1";
		}else {
			return "0";
		}
	}
	/**
	 * 用户管理
	 */
	@RequestMapping("member-list.do")
	public String memberList() {
		return "member-list";
	}
	/**
	 * 添加用户
	 */
	@RequestMapping("member-add.do")
	public String memberAdd() {
		return "member-add";
	}
	/**
	 * 删除的用户
	 */
	@RequestMapping("member-del.do")
	public String memberDel() {
		return "member-del";
	}
	/**
	 * 修改用户密码
	 */
	@RequestMapping("change-password.do")
	public String changePassword() {
		return "change-password";
	}
	/**
	 * 数据字典管理
	 */
	@RequestMapping("system-data.do")
	public String systemData() {
		return "system-data";
	}
	
	/**
	 * 获取本机ip
	 * @throws UnknownHostException 
	 
	@RequestMapping("welcomeIp.do")
	@ResponseBody
	public String ip(HttpServletRequest request) throws UnknownHostException {
		InetAddress addr = InetAddress.getLocalHost();
		//本机ip
		
		SimpleDateFormat simpl = new SimpleDateFormat();
		
		//获得本次登录时间
		LoginDate.benTime = simpl.format(new Date());
		//判断上次登录时间
		if(LoginDate.shanTime.equals("")) { //第一次登录
			LoginDate.shanTime = LoginDate.benTime;
		}
		request.setAttribute("shanTime", LoginDate.shanTime);
		LoginDate.shanTime = LoginDate.benTime;
		//计算登录次数
		LoginDate.count++;
		request.setAttribute("count", LoginDate.count);
		return "";
	}
	*/
	
}