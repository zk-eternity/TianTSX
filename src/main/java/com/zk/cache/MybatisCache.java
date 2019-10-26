package com.zk.cache;

import org.apache.ibatis.cache.Cache;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.context.ContextLoader;

import java.util.Set;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * @ClassName MyCache
 * @Description: 在mybatis完成查询后，将数据缓存起来；当查询数据时先检查缓存
 */
public class MybatisCache implements Cache {

    //自定义内容
    private String id;      //当前Mapper的namespace
    private final ReadWriteLock lock = new ReentrantReadWriteLock();
    RedisTemplate<String, Object> template;

    public MybatisCache() {
    }

    //id==>是mybatis创建此缓存组件的实例时，会传入的
    public MybatisCache(String id) {
        System.out.println("create cache instance id:" + id);
        this.id = id;
    }


    //重写的内容
    @Override
    public String getId() {
        return this.id;
    }

    /**
     * todo：当查询执行后，将结果缓存起来
     *
     * @param key   此次查询的标识，其中包含sql语句（String）
     * @param value 此次查询的结果数据 User List<User>
     */
    @Override
    public void putObject(Object key, Object value) {
        System.out.println("缓存数据，" + key + ":" + value);
        //将查询结果存入redis，缓存起来备用
        template.opsForValue().set(key.toString(), value);
    }

    @Override
    public Object getObject(Object key) {
        template = (RedisTemplate) ContextLoader.getCurrentWebApplicationContext().getBean("redisTemplate");
        System.out.println("检查缓存，key:" + key.getClass());
        Object cache = template.opsForValue().get(key.toString());
        if (cache != null) {
            return cache;
        } else {
            System.out.println("检查缓存，但未命中");
            return null;
        }
    }

    /**
     * 删除某一个缓存数据
     *
     * @param key
     * @return
     */
    @Override
    public Object removeObject(Object key) {
        template = (RedisTemplate) ContextLoader.getCurrentWebApplicationContext().getBean("redisTemplate");
        template.delete(key.toString());
        return null;
    }

    /**
     * 当一个mapper中，触发了任意一个写操作，该mapper下的苏哦有缓存都删除
     */
    @Override
    public void clear() {
        System.out.println("namespace:" + this.getId() + "发生了写操作，清空苏哦有相关缓存数据");
        template = (RedisTemplate) ContextLoader.getCurrentWebApplicationContext().getBean("redisTemplate");
        //获取当前mapper下的所有缓存key
        Set<String> keys = template.keys("*" + this.getId() + "*");
        //删除这些key
        template.delete(keys);
    }

    @Override
    public int getSize() {
        return 0;
    }

    @Override
    public ReadWriteLock getReadWriteLock() {
        return this.lock;
    }
}
