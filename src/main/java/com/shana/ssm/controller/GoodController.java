package com.shana.ssm.controller;


import com.shana.ssm.pojo.Good;
import com.shana.ssm.service.IGoodService;
import com.shana.ssm.utils.AddImg;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 功能描述:<br>
 * 〈〉
 *
 * @author xiana
 * @create 2019/9/26
 * @since 1.0.0
 */
@Controller
@RequestMapping("/good")
public class GoodController {

    @Autowired
    IGoodService goodService;

    @RequestMapping("/addgood")
    public String addGood(Good good, HttpServletRequest req, @RequestParam("uploadImg") MultipartFile uploadImg) throws IOException {
        if(StringUtils.isNotBlank(uploadImg.getOriginalFilename())){
            AddImg.addImg(req,good,uploadImg);
        }
        goodService.addGood(good);

        return "redirect:/home/gohome";
    }

    @RequestMapping("/delgood")
    public String delGood(String goodid){
        goodService.delGood(goodid);
        return "redirect:/home/gohome";
    }

    @RequestMapping("/updategood")
    public String updateGood(Good good,@RequestParam("uploadImg") MultipartFile uploadImg,HttpServletRequest req) throws IOException {
        if(StringUtils.isNotBlank(uploadImg.getOriginalFilename())){
            AddImg.addImg(req,good,uploadImg);
        }
        goodService.updateGood(good);
        return "redirect:/home/gohome";
    }

    @RequestMapping("/delsomegoods")
    @ResponseBody
    public int delSomeGoods(String ids){
        goodService.delSomeGoods(ids.split(","));
        return 0;
    }
}

