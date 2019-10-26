package com.zk.controller;

import com.zk.pojo.GoodsType;
import com.zk.service.GoodsTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/goodstype")
public class GoodsTypeController {
    @Resource
    private GoodsTypeService goodsTypeService;

    @RequestMapping("/getGoodstype")
    public String getGoodsType(HttpServletRequest request) {
        List<GoodsType> goodsTypes = goodsTypeService.selectAllGoodsType();
        request.getSession().setAttribute("goodsTypes", goodsTypes);
        return "goodstype";
    }

    @RequestMapping("/getGoodstypeById")
    public String getGoodsById(Integer id, HttpServletRequest request) {
        GoodsType goodsType = goodsTypeService.selectGoodsTypeById(id);
        request.getSession().setAttribute("goodsType", goodsType);
        return "goods";
    }

    @RequestMapping("/getGoodstypeById2")
    public String getGoodstypeById2(Integer id, HttpServletRequest request, String open, Integer pageNum, Integer pageSize) {
        if (pageNum == null || pageNum < 0) {
            pageNum = 1;
        }
        request.setAttribute("open", open);
        GoodsType goodsTypes = goodsTypeService.selectAllGoodsTypeById(id, open, pageNum, 10, request);
        request.getSession().setAttribute("goodsTypes3", goodsTypes);
        return "list";
    }

}
