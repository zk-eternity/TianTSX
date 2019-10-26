package com.zk.controller;

import com.zk.pojo.Cart;
import com.zk.pojo.User;
import com.zk.service.CartService;
import com.zk.service.GoodsService;
import com.zk.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private UserService userService;

    @RequestMapping("/addcart")
    @ResponseBody
    public BigDecimal addcart(Integer gid, Integer uid, Integer gnum, String money) {
        BigDecimal totals = new BigDecimal(money);

        Cart cart = cartService.queryCartByGid(gid);
        if (cart == null) {
            cartService.addCart(gid, uid, gnum, totals);
        } else {
            cartService.updateCart(cart, gnum, totals);
        }

        BigDecimal newtotals = new BigDecimal(0);
        List<Cart> carts = cartService.queryCartByUid(uid);
        for (Cart cart1 : carts) {
            newtotals = newtotals.add(cart1.getMoney());
        }

        return newtotals;
    }

    @RequestMapping("/getNum")
    @ResponseBody
    public Integer getNum(Integer uid) {
        List<Cart> carts = cartService.queryCartByUid(uid);
        return carts.size();
    }

    @RequestMapping("/getcart")
    @ResponseBody
    public String getcart(HttpServletRequest request) {
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        System.out.println(username);
        User user = userService.queryUserByUsername(username);
        Integer uid = user.getId();
        List<Cart> carts = cartService.queryAllCartByUid(uid);
        request.setAttribute("uid", uid);
        request.getSession().setAttribute("carts", carts);
        BigDecimal cartfee = new BigDecimal(0);
        for (Cart cart : carts) {
            cartfee = cartfee.add(cart.getMoney());
        }
        request.getSession().setAttribute("cartfee", cartfee);
        return "" + carts.size();
    }

    @RequestMapping("/tocart")
    public String tocart(HttpServletRequest request) {
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        System.out.println(username);
        User user = userService.queryUserByUsername(username);

        getcart(request);
        return "cart";
    }

    @RequestMapping("/delcart")
    public String delcart(Integer gid, Integer uid, HttpServletRequest request) {
        System.out.println("gid:" + gid + ",uid:" + uid);
        cartService.deleteCart(gid, uid);

        getcart(request);
        return "cart";
    }

    @RequestMapping("/querycart")
    public String querycart() {
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        User user = userService.queryUserByUsername(username);
        Integer uid = user.getId();

        List<Cart> carts = cartService.queryCartByUid(uid);
        for (Cart cart : carts) {
            System.out.println(cart.toString());
        }
        return "cart";
    }
}
