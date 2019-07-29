package com.situ.store.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.situ.store.product.model.ImageModel;
import com.situ.store.product.service.ImageService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("image")
public class ImageController {

    @Autowired
    private ImageService imageService;

    private String PATH = "D:/aa/store/";

    @RequestMapping("upload")
    @ResponseBody
    public String upload(HttpServletRequest request, String productCode) throws IllegalStateException, IOException {
        // 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        // 检查form中是否有enctype="multipart/form-data"
        if (multipartResolver.isMultipart(request)) {
            // 将request变成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            // 获取multiRequest 中所有的文件名
            Iterator<String> iter = multiRequest.getFileNames();
            // 一次遍历所有文件
            while (iter.hasNext()) {
                MultipartFile file = multiRequest.getFile(iter.next().toString());
                if (file != null) {
                    String filename = file.getOriginalFilename();
                    String saveName = UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
                    String path = PATH + saveName;
                    file.transferTo(new File(path));// 上传
                    ImageModel i2=new ImageModel();
                    i2.setProductCode(productCode);
                    i2.setUrl(saveName);
                    i2.setType("2");
                    imageService.insert(i2);
                }
            }
        }
        Map<String, String> result = new HashMap<>();
        result.put("code", "0");
        return JSONObject.fromObject(result).toString();
    }

    @RequestMapping(value = "list", produces = "application/json;charset=utf-8")
    @ResponseBody
    private String List(ImageModel imageModel) {
    	
    	System.out.println("商品编号="+imageModel.getProductCode());
//    	imageModel.setOrderby("type");
        Map<String, Object> map = new HashMap<>();
        map.put("list", imageService.selectAll(imageModel));
        return JSONObject.fromObject(map).toString();
    }

    
    @RequestMapping(value = "xiangqingList", produces = "application/json;charset=utf-8")
    @ResponseBody
    private String xiangqingList(ImageModel imageModel) {
    	imageModel.setType("1");
//    	imageModel.setOrderby("type");
        Map<String, Object> map = new HashMap<>();
        map.put("list", imageService.selectAll(imageModel));
        return JSONObject.fromObject(map).toString();
    }
    
    @RequestMapping(value = "carList", produces = "application/json;charset=utf-8")
    @ResponseBody
    private String carList(ImageModel imageModel) {
    	imageModel.setType("1");
//    	imageModel.setOrderby("type");
        Map<String, Object> map = new HashMap<>();
        map.put("list", imageService.selectAll(imageModel));
        return JSONObject.fromObject(map).toString();
    }
    
    @RequestMapping(value = "liebiaoList", produces = "application/json;charset=utf-8")
    @ResponseBody
    private String liebiaoList(ImageModel imageModel) {
    	imageModel.setType("1");
//    	imageModel.setOrderby("type");
        Map<String, Object> map = new HashMap<>();
        map.put("list", imageService.selectAll(imageModel));
        return JSONObject.fromObject(map).toString();
    }
    
    @RequestMapping(value = "getList", produces = "application/json;charset=utf-8")
    @ResponseBody
    private String getList(ImageModel imageModel) {
        return JSONObject.fromObject(imageService.select(imageModel.getId())).toString();
    }
    
    
    @RequestMapping("delete")
    @ResponseBody
    public String delete(ImageModel imageModel) {
    	ImageModel i1 = imageService.select(imageModel.getId());
        File file = new File(PATH + i1.getUrl());
        file.delete();
        return imageService.delete(i1.getId()) + "";
    }

    @RequestMapping("setMain")
    @ResponseBody
    public String setMain(ImageModel imageModel) {
        Integer id = imageModel.getId();
        ImageModel t = new ImageModel();
        t.setProductCode(imageModel.getProductCode());
        // t.setType("2");
        // productPicService.updateActive(t);
        // t = new ProductPicModel();
        // t.setId(id);
        // t.setType("1");
        // productPicService.updateActive(t);
        List<ImageModel> list = imageService.selectAll(imageModel);
        for (ImageModel ppm : list) {
            // if (id.equals(ppm.getId())) {
            // ppm.setType("1");
            // } else {ppm.setType("2");}
            if (id.equals(ppm.getId())) {
                ppm.setType("1");
            } else if (ppm.getType().equals("1")) {
                ppm.setType("2");
            } else {
                continue;
            }
            imageService.update(ppm);
        }
        return "1";
    }
}

