package org.itrip.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.itrip.mapper.UserMapper;
import org.itrip.pojo.User;
import org.itrip.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
//	private RedisCache redis = new RedisCache();
	@Autowired
	UserMapper userMapper;
	
	public int loginUser(@Param("phone")String phone) {
		return userMapper.countLoginUser(phone);
	}
	@Override
	public List<User> getQueryUserList(int pageNo,int pageSize) {
		
		pageNo = (pageNo-1)*pageSize;
		return userMapper.queryUserList(pageNo,pageSize);
	}
	@Override
	public User getloginUser(User user) {
		return userMapper.loginUser(user);
	}
	@Override
	public int deleteUser(int id) {
		// TODO Auto-generated method stub
		return userMapper.deleteUser(id);
	}

	@Override
	public Integer deleteUserList(int[] idarr) {
		// TODO Auto-generated method stub
		return userMapper.deleteUserList(idarr);
	}
	@Override
	public int getcountUser() {
		return userMapper.countUser();
	}
	@Override
	public int insertUser(User user) {
		return userMapper.insertUser(user);
	}
	@Override
	public int updateUser(User user) {
		return userMapper.updateUser(user);
	}
	@Override
	public User queryUpdate(int id) {
		return userMapper.queryUpdate(id);
	}
	
	public static void main(String[] args) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hk?useUnicode=true&amp;characterEncoding=UTF-8&autoReconnect=true&useSSL=false", "root", "root");
			st = con.createStatement();
			rs = st.executeQuery("select name from product");
			while(rs.next()) {
				System.out.println(rs.getString("name"));
			}
		}catch(Exception e) {
			
		}
		
		
		
		
		
		
		
	}
	public boolean isBack(String name) {
		if(name != null && !name.equals("")) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public List<User> queryDelList(String datemin, String datemax, String elist) {
		// TODO Auto-generated method stub
		return userMapper.queryDelList(datemin, datemax, elist);
	}
	@Override
	public int updateDalUpdate(int id) {
		return userMapper.updateDalUpdate(id);
	}
	@Override
	public int countDelUser() {
		return userMapper.countDelUser();
	}
	@Override
	public int deleteDel(int id) {
		return userMapper.deleteDel(id);
	}
	@Override
	public Integer deleteDelList(int[] idarr) {
		return userMapper.deleteDelList(idarr);
	}
	@Override
	public User memberUserid(int id) {
		// TODO Auto-generated method stub
		return userMapper.memberUserid(id);
	}
	@Override
	public List<User> getmemberUser() {
		// TODO Auto-generated method stub
		return userMapper.memberUser();
	}
	@Override
	public int updateUserUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateUserUser(user);
	}
	@Override
	public User updateUserid(int id) {
		// TODO Auto-generated method stub
		return userMapper.updateUserid(id);
	}
	@Override
	public int changePasswordpwd(User user) {
		// TODO Auto-generated method stub
		return userMapper.changePasswordpwd(user);
	}
	@Override
	public List<User> queryUser(String query11) {
		// TODO Auto-generated method stub
		return userMapper.queryUser(query11);
	}
	@Override
	public int countUsers() {
		// TODO Auto-generated method stub
		return userMapper.countUsers();
	}
	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.addUser(user);
	}
}
