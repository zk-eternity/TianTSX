package com.zk.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private Integer id;
    private Integer gid;
    private Integer uid;
    private Integer gnum;
    private BigDecimal money;
    private Goods goods;
}
