package com.shana.ssm.service;

import com.shana.ssm.mapper.CategoryMapper;
import com.shana.ssm.mapper.GoodMapper;
import com.shana.ssm.pojo.Category;
import com.shana.ssm.pojo.Good;
import com.shana.ssm.vo.QueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能描述:<br>
 * 〈〉
 *
 * @author xiana
 * @create 2019/9/26
 * @since 1.0.0
 */
@Service
public class GoodServiceImp implements IGoodService {
    @Autowired
    GoodMapper goodMapper;
    @Autowired
    CategoryMapper categoryMapper;

    @Override
    public List<Good> showGoods() {

        List<Good> goods=goodMapper.selectAll();
        return goods;
    }

    @Override
    public List<Category> showCategorys() {
        return categoryMapper.selectAll();
    }

    @Override
    public List<Good> showLimitedGoods(QueryVo queryVo) {
        return goodMapper.selectLimitedGoods(queryVo);
    }

    @Override
    public void addGood(Good good) {
        goodMapper.insert(good);
    }

    @Override
    public void delGood(String goodid) {
        int goodi=Integer.parseInt(goodid);
        goodMapper.deleteByPrimaryKey(goodi);
    }

    @Override
    public Good selectGoodById(String goodid) {
        int goodi=Integer.parseInt(goodid);
        return goodMapper.selectByPrimaryKey(goodi);
    }

    @Override
    public void updateGood(Good good) {
        goodMapper.updateByPrimaryKey(good);
    }

    @Override
    public void delSomeGoods(String[] strs) {
        goodMapper.deleteSome(strs);
    }
}

