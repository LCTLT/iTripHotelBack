package org.itrip.service;

import java.util.List;
import org.itrip.pojo.Dictionarydate;

public interface SystemService {

	List<Dictionarydate> listdictionarydate();
	Dictionarydate SystemId(int id);
	int systemdictionarydate(Dictionarydate dictionarydate);
	int systemdelete(int id);
	Integer systemroledelete(int[] idarr);
	int systemroleadd(Dictionarydate dictionarydate);
	int systemCount();
}
