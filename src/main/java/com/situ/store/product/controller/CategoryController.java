package com.situ.store.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.store.product.model.CategoryModel;
import com.situ.store.product.service.CategoryService;

@Controller
@RequestMapping("category")
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	/**
	 * @param productModel
	 * @return -1=商品分类编号已存在
	 */
	@ResponseBody
	@RequestMapping(value = "add")
	public String insert(CategoryModel categoryModel) {
		CategoryModel c1 = categoryService.select(categoryModel);
		if(c1!=null) {
			return "-1";
		}
		int c2=categoryService.insert(categoryModel);
		return new JSONObject(c2).toString();
	}
	
	
	@ResponseBody
	@RequestMapping(value = "list",produces = "text/html;charset=UTF-8")
	public String selectAll(CategoryModel categoryModel) {
		categoryModel.setCode("%" +categoryModel.getCode()+ "%");
		if(categoryModel.getName()==null) {
			categoryModel.setName("");
		}
		categoryModel.setName("%" +categoryModel.getName()+ "%");
		categoryModel.setPageOn(true);
		
		System.out.println(categoryModel.getPageLimit());
		System.out.println(categoryModel.getRowStart());
		
		List<CategoryModel> c1 = categoryService.selectAll(categoryModel);
		
		int s1=categoryService.selectCount(categoryModel);
		
		Map<String, Object> map = new HashMap<>();
		
        map.put("list",c1);
        map.put("count", s1);
		return new JSONObject(map).toString();
	}
	
	/**查询一级分类
	 * @param categoryModel
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "parentCodeList",produces = "text/html;charset=UTF-8")
	public String selectParentCode(CategoryModel categoryModel) {
		categoryModel.setParentCode("1");
		List<CategoryModel> c1 = categoryService.selectAll(categoryModel);
		return new JSONArray(c1).toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "parentCodeList2",produces = "text/html;charset=UTF-8")
	public String selectParentCode2(CategoryModel categoryModel) {
		List<CategoryModel> c1 = categoryService.selectAll(categoryModel);
		return new JSONArray(c1).toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "delete")
	public String delete(CategoryModel categoryModel) {
	int c1=categoryService.delete(categoryModel);
	return c1+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "update")
	public String update(CategoryModel categoryModel) {
		int c1=categoryService.update(categoryModel);
		return c1+"";
	}

	public String selectCount(CategoryModel categoryModel) {
		int s1=categoryService.selectCount(categoryModel);
		return s1+"";
	}
}
