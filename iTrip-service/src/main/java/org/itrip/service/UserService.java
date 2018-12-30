package org.itrip.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.itrip.pojo.User;

public interface UserService {
	
	public int loginUser(@Param("phone")String phone);
	List<User> getQueryUserList(int pageNo,int pageSize);
	/**
	 * 用户登入
	 */
	User getloginUser(User user);
	int deleteUser(int id);
	
	Integer deleteUserList(int[] idarr);
	/**
	 * 数据总和
	 */
	int getcountUser();
	int insertUser(User user);
	int updateUser(User user);
	User queryUpdate(int id);
	/**
	 * 删除页面
	 */
	List<User> queryDelList(String datemin,String datemax,String elist);
	int updateDalUpdate(int id);
	int countDelUser();
	int deleteDel(int id);
	Integer deleteDelList(int[] idarr);
	User memberUserid(int id);
	/**
	 * 会员管理
	 */
	List<User> getmemberUser();
	int updateUserUser(User user);
	User updateUserid(int id);
	int changePasswordpwd(User user);
	List<User> queryUser(String query11);
	int countUsers();
	int addUser(User user);
}
