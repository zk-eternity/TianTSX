package com.zk.pojo;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Goods {
    private Integer id;
    private String name;
    @JSONField(format = "yyyy-MM-dd")
    private Date times;
    private String picture;
    private BigDecimal price;
    private String intro;
    private Integer typeid;
    private String banner;
}
