package org.itrip.service;

import java.util.List;
import org.itrip.pojo.Dictionarydate;
import org.itrip.pojo.Order;

public interface SystemService {

	List<Dictionarydate> listdictionarydate();
	Dictionarydate SystemId(int id);
	int systemdictionarydate(Dictionarydate dictionarydate);
	int systemdelete(int id);
	Integer systemroledelete(int[] idarr);
	int systemroleadd(Dictionarydate dictionarydate);
	int systemCount();
	
	
	
	
	List<Order> orderQuery();
	Order OrderUpdata(int id);
	List<Dictionarydate> Orderlist();
	int OrderListUpdate(Order order);
	int countorder();
}
