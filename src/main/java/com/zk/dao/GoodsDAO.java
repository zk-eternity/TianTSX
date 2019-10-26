package com.zk.dao;

import com.zk.pojo.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsDAO {
    //添加商品
    Integer insertGoods(Goods goods);

    //查询所有商品
    List<Goods> queryAllGoods();

    //通过商品id查询商品
    Goods queryGoodsById(@Param("id") Integer id);

    List<Goods> queryByTypeid(@Param("typeid") Integer id, @Param("on") String on);

    //搜索框检索查询
    List<Goods> queryGoodsByName(@Param("name") String name);
}
