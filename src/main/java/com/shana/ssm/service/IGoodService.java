package com.shana.ssm.service;

import com.shana.ssm.pojo.Category;
import com.shana.ssm.pojo.Good;
import com.shana.ssm.vo.QueryVo;

import java.util.List;

public interface IGoodService {

    List<Good> showGoods();

    List<Category> showCategorys();

    List<Good> showLimitedGoods(QueryVo queryVo);

    void addGood(Good good);

    void delGood(String goodid);

    Good selectGoodById(String goodid);

    void updateGood(Good good);

    void delSomeGoods(String[] strs);
}
