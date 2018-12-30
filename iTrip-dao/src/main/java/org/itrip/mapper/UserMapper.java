package org.itrip.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.itrip.pojo.User;
import org.springframework.stereotype.Component;

@Component
public interface UserMapper {
	
	int countLoginUser(@Param("phone")String phone);
	/**
	 * 查询所有用户角色
	 */
	List<User> queryUserList(@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	/**
	 * 用户登入
	 */
	User loginUser(User  user);
	/**
	 * 删除用户
	 */
	int deleteUser(int id);

	/**
	 * 删除多个用户
	 */
	Integer deleteUserList(int[] idarr);
	/**
	 * 数据总和
	 */
	int countUser();
	/**
	 * 添加用户
	 */
	int insertUser(User user);
	/**
	 * 修改
	 */
	int updateUser(User user);
	/**
	 * 显示修改数据
	 */
	User queryUpdate(int id);
	/**
	 * 条件查询删除用户
	 */
	List<User> queryDelList(@Param("datemin")String datemin,@Param("datemax")String datemax,@Param("elist")String elist);
	int countDelUser();
	/**
	 * 还原删除用户
	 */
	int updateDalUpdate(int id);
	/**
	 * 彻底删除用户
	 */
	int deleteDel(int id);

	/**
	 * 彻底多个用户
	 */
	Integer deleteDelList(int[] idarr);
	/**
	 * 查询会员用户角色
	 */
	List<User> memberUser();
	/**
	 * 修改密码1
	 */
	User memberUserid(int id);
	/**
	 * 修改密码2
	 */
	int changePasswordpwd(User user);
	/**
	 * 修改会员用户1
	 */
	User updateUserid(int id);
	/**
	 * 修改会员用户2
	 */
	int updateUserUser(User user);

	/**
	 * 添加会员用户
	 */
	int addUser(User user);
	/**
	 * 会员模糊查询
	 */
	List<User> queryUser(@Param("_query11")String query11);
	/**
	 * 会员数据总和
	 */
	int countUsers();
	
}
