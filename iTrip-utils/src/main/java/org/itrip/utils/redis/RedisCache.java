package org.itrip.utils.redis;

import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import org.apache.ibatis.cache.Cache;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * 
 * @author Administrator
 *
 */
public class RedisCache implements Cache{
	    private Jedis redisClient = createClient();
	    /** The ReadWriteLock. */
	    private final ReadWriteLock readWriteLock = new ReentrantReadWriteLock();
	 
	    private String id;
	    public RedisCache() {}
	    public RedisCache(final String id) {
	        if (id == null) {
	            throw new IllegalArgumentException("Cache instances require an ID");
	        }
	        this.id = id;
	    }
	 
	    public String getId() {
	        return this.id;
	    }
	 
	    public int getSize() {
	        return Integer.valueOf(redisClient.dbSize().toString());
	    }
	 
	    public void putObject(Object key, Object value) {
	        redisClient.set(SerializeUtil.serialize(key.toString()), SerializeUtil
	                .serialize(value));
	        //设置超时时间
	        //redisClient.expire(SerializeUtil.serialize(key.toString()),10);
	    }
	 
	    public Object getObject(Object key) {
	    //	System.out.println("Object key>> " + key);
	        Object value = SerializeUtil.unserialize(redisClient.get(SerializeUtil
	                .serialize(key.toString())));
	        return value;
	    }
	    
	 
	    public Object removeObject(Object key) {
	    	System.out.println("removeObject>>>>>key>>>" + key);
	        return redisClient.expire(SerializeUtil.serialize(key.toString()), 0);
	    }
	 
	    public void clear() {
	        redisClient.flushDB();
	    }
	 
	    public ReadWriteLock getReadWriteLock() {
	        return readWriteLock;
	    }
	 
	    protected static Jedis createClient() {
	        try {
	            JedisPool pool = new JedisPool(new JedisPoolConfig(),
	            		"43.226.150.225",6379);
	            
	            return pool.getResource();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        throw new RuntimeException("初始化连接池错误");
	    }

}