package com.zk.dao;

import com.zk.pojo.GoodsType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsTypeDAO {
    //查询所有商品类型
    List<GoodsType> selectAllGoodsType();

    //通过id查询商品
    GoodsType selectGoodsTypeById(@Param("id") Integer id);

    GoodsType selectAllGoodsTypeById(@Param("id") Integer id, @Param("on") String on);
}
