package com.zk.service;

import com.zk.pojo.Goods;

import java.util.List;

public interface GoodsService {
    List<Goods> queryAllGoods();

    Goods queryById(Integer id);
}
