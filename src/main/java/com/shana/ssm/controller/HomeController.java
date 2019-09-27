package com.shana.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shana.ssm.pojo.Category;
import com.shana.ssm.pojo.Good;
import com.shana.ssm.service.IGoodService;
import com.shana.ssm.vo.QueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

/**
 * 功能描述:<br>
 * 〈〉
 *
 * @author xiana
 * @create 2019/9/26
 * @since 1.0.0
 */
@Controller
@RequestMapping("/home")
public class HomeController {

    @Autowired
    IGoodService goodService;

    @RequestMapping("/gohome")
        public String goHome(Map<String,Object> map, QueryVo queryVo, @RequestParam(value = "pageNow",defaultValue = "1") int pagenow){

            PageHelper.startPage(pagenow,2);
            List<Good> goods= goodService.showLimitedGoods(queryVo);
            PageInfo<Good> page=new PageInfo<>(goods,3);

            List<Category> categories=goodService.showCategorys();
            map.put("pageInfo",page);
            map.put("categories",categories);
            map.put("qv",queryVo);
            return "homeview";
}

    @RequestMapping("/toadd")
    public String toAdd(Map<String,Object> map){
            List<Category> categories=goodService.showCategorys();
            map.put("categories",categories);
            return "add";
    }

    @RequestMapping("/toupdate")
    public String toUpdate(String goodid,Map<String,Object> map){
        Good good=goodService.selectGoodById(goodid);
        List<Category> categories=goodService.showCategorys();
        map.put("categories",categories);
        map.put("good",good);
        return "update";
    }
}

