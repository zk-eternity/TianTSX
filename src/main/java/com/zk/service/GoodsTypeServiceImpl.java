package com.zk.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zk.dao.GoodsDAO;
import com.zk.dao.GoodsTypeDAO;
import com.zk.pojo.Goods;
import com.zk.pojo.GoodsType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class GoodsTypeServiceImpl implements GoodsTypeService {
    @Autowired
    private GoodsTypeDAO goodsTypeDAO;
    @Autowired
    private GoodsDAO goodsDAO;

    @Override
    public List<GoodsType> selectAllGoodsType() {
        return goodsTypeDAO.selectAllGoodsType();
    }

    @Override
    public GoodsType selectGoodsTypeById(Integer id) {
        GoodsType goodsType = goodsTypeDAO.selectGoodsTypeById(id);
        System.out.println("GoodsTypeService -->"+goodsType);
        return goodsType;
    }

    @Override
    public GoodsType selectAllGoodsTypeById(Integer id, String on, Integer pageNum, Integer pageSize, HttpServletRequest request) {
        GoodsType goodsType = goodsTypeDAO.selectAllGoodsTypeById(id, on);

        PageHelper.startPage(pageNum,pageSize);
        List<Goods> goods = goodsDAO.queryByTypeid(id, on);
        PageInfo<Goods> goodsPageInfo = new PageInfo<>(goods);
        request.getSession().setAttribute("goodsPageInfo", goodsPageInfo);

        return goodsType;
    }
}
