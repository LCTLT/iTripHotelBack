package org.itrip.service;

import java.util.List;

import org.itrip.pojo.User;

public interface UserService {
	
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
}
