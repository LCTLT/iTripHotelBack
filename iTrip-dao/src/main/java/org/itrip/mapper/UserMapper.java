package org.itrip.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.itrip.pojo.User;
import org.springframework.stereotype.Component;

@Component
public interface UserMapper {
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
}
