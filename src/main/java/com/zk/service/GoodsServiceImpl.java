package com.zk.service;

import com.zk.dao.GoodsDAO;
import com.zk.pojo.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private GoodsDAO goodsDAO;

    @Override
    public List<Goods> queryAllGoods() {
        return goodsDAO.queryAllGoods();
    }

    @Override
    public Goods queryById(Integer id) {
        return goodsDAO.queryGoodsById(id);
    }
}
