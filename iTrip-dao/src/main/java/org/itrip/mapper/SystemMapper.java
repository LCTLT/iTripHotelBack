package org.itrip.mapper;

import java.util.List;

import org.itrip.pojo.Dictionarydate;
import org.springframework.stereotype.Component;

@Component
public interface SystemMapper {
	
	/**
	 * 字典表页面查询
	 */
	List<Dictionarydate> listdictionarydate();
	/**
	 * 点击添加
	 */
	Dictionarydate SystemId(int id);
	/**
	 * 修改数据
	 */
	int systemdictionarydate(Dictionarydate dictionarydate);
	/**
	 * 字典表删除
	 */
	int systemdelete(int id);
	/**
	 * 批量删除
	 */
	Integer systemroledelete(int[] idarr);
	/**
	 * 添加数据
	 */
	int systemroleadd(Dictionarydate dictionarydate);
	/**
	 * 数据总和
	 */
	int systemCount();
}


