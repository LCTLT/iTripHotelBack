package org.itrip.service.impl;

import java.util.List;

import org.itrip.mapper.SystemMapper;
import org.itrip.pojo.Dictionarydate;
import org.itrip.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SystemServiceImpl implements SystemService  {

	@Autowired
	SystemMapper systemMapper;

	@Override
	public List<Dictionarydate> listdictionarydate() {
		return systemMapper.listdictionarydate();
	}

	@Override
	public Dictionarydate SystemId(int id) {
		return systemMapper.SystemId(id);
	}

	@Override
	public int systemdictionarydate(Dictionarydate dictionarydate) {
		return systemMapper.systemdictionarydate(dictionarydate);
	}

	@Override
	public int systemdelete(int id) {
		return systemMapper.systemdelete(id);
	}

	@Override
	public Integer systemroledelete(int[] idarr) {
		return systemMapper.systemroledelete(idarr);
	}

	@Override
	public int systemroleadd(Dictionarydate dictionarydate) {
		return systemMapper.systemroleadd(dictionarydate);
	}

	@Override
	public int systemCount() {
		return systemMapper.systemCount();
	}

	
}
