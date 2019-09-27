package com.shana.ssm.utils;

import com.shana.ssm.pojo.Good;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * 功能描述:<br>
 * 〈〉
 *
 * @author xiana
 * @create 2019/9/26
 * @since 1.0.0
 */
public class AddImg {

    public static void addImg(HttpServletRequest req, Good good, MultipartFile uploadImg) throws IOException {

        //获取文件路径
        String path=req.getServletContext().getRealPath("/images");
        File f=new File(path);
        if(!f.exists()){
            f.mkdir();
        }

        //删除旧图
        if(good.getGoodimg()!=null && !good.getGoodimg().equals("")){
            File f1=new File(f,good.getGoodimg());
            f1.delete();
        }

        //新文件名字
        String fileName=uploadImg.getOriginalFilename();
        UUID uuid=UUID.randomUUID();
        String suffix=fileName.substring(fileName.lastIndexOf("."));
        String newFileName=uuid.toString()+suffix;

        //创建新图
        File file=new File(f,newFileName);
        uploadImg.transferTo(file);
        good.setGoodimg(newFileName);
    }
}

