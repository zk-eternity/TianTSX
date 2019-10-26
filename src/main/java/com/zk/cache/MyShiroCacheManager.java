package com.zk.cache;

import lombok.Getter;
import lombok.Setter;
import org.apache.shiro.cache.AbstractCacheManager;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.springframework.data.redis.core.RedisTemplate;

@Getter
@Setter
public class MyShiroCacheManager extends AbstractCacheManager {
    private RedisTemplate<String,Object> template;

    /**
     * 当shiro中需要缓存数据（身份数据，权限数据），都会需要一个CacheManager
     * CacheManage核心工作之一：创建一个缓存对象
     * @param s ：权限信息的标识字符串
     * @return
     * @throws CacheException
     */
    @Override
    protected Cache createCache(String s) throws CacheException {
        System.out.println("标识："+s);
        MyShiroCache cache = new MyShiroCache(s);
        cache.setTemplate(template);
        return cache;
    }
}
