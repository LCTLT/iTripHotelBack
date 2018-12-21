package org.itrip.utils;

import redis.clients.jedis.Jedis;
/**
 * redis
 * @author Administrator
 *
 */
public class JedisUitl {
	public static void main(String[] args) {
		Jedis jed = new Jedis("43.226.150.225",6379);
		jed.connect();
		System.out.println("连接成功！");
		jed.close();
	}	
}
