package com.zk.service;

import com.zk.pojo.Cart;

import java.math.BigDecimal;
import java.util.List;

public interface CartService {
    void addCart(Integer gid, Integer uid, Integer gnum, BigDecimal total);

    Cart queryCartByGid(Integer gid);

    void updateCart(Cart cart, Integer gnum, BigDecimal totals);

    List<Cart> queryCartByUid(Integer uid);

    List<Cart> queryAllCartByUid(Integer uid);

    void deleteCart(Integer gid, Integer uid);
}
