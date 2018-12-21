package org.itrip.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import org.itrip.mapper.UserMapper;
import org.itrip.pojo.User;
import org.itrip.service.UserService;
import org.itrip.utils.redis.RedisCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
//	private RedisCache redis = new RedisCache();
	@Autowired
	UserMapper userMapper;
	
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
}
