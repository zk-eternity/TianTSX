package com.zk.controller;

import com.zk.pojo.Goods;
import com.zk.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/goods")
public class GoodsController {
    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/goodsDetail")
    public String getAllGoods(Integer id, HttpServletRequest request) {
        Goods goods = goodsService.queryById(id);
        request.getSession().setAttribute("goods", goods);
        return "detail";
    }
}
