package com.zk.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GoodsType {
    private Integer id;
    private String gtname;
    private String gttype;
    private Date gttimes;
    private String gtpicture;
    private List<Goods> goods;
}
