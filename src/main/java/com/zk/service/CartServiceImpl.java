package com.zk.service;

import com.zk.dao.CartDAO;
import com.zk.dao.GoodsDAO;
import com.zk.pojo.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class CartServiceImpl implements CartService {
    @Autowired
    private CartDAO cartDAO;
    @Autowired
    private GoodsDAO goodsDAO;

    @Override
    public void addCart(Integer gid, Integer uid, Integer gnum, BigDecimal total) {
        cartDAO.insertCart(gid, uid, gnum, total);
    }

    @Override
    public Cart queryCartByGid(Integer gid) {
        return cartDAO.selectCartByGid(gid);
    }

    @Override
    public void updateCart(Cart cart, Integer gnum, BigDecimal totals) {
        cart.setGnum(cart.getGnum() + gnum);
        cart.setMoney(cart.getMoney().add(totals.multiply(new BigDecimal(gnum))));
        cartDAO.updateCart(cart);
    }

    @Override
    public List<Cart> queryCartByUid(Integer uid) {
        List<Cart> carts = cartDAO.selectCartByUid(uid);
        if (carts != null) {
            for (Cart cart : carts) {
                cart.setGoods(goodsDAO.queryGoodsById(cart.getId()));
            }
        }
        return carts;
    }

    @Override
    public List<Cart> queryAllCartByUid(Integer uid) {
        List<Cart> carts = cartDAO.selectCartByUid(uid);
        if (carts != null) {
            for (Cart cart : carts) {
                cart.setGoods(goodsDAO.queryGoodsById(cart.getGid()));
            }
        }
        return carts;
    }

    @Override
    public void deleteCart(Integer gid, Integer uid) {
        cartDAO.deleteCart(gid, uid);
    }
}
