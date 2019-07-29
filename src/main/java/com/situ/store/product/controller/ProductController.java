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
import com.situ.store.product.model.ProductModel;
import com.situ.store.product.service.CategoryService;
import com.situ.store.product.service.ProductService;
import com.situ.store.util.FmtEmpty;

@Controller
@RequestMapping("product")
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	/**
	 * @param productModel
	 * @return 1=商品编号已存在
	 */
	@ResponseBody
	@RequestMapping(value = "add")
	public String insert(ProductModel productModel) {
		ProductModel p1 = productService.select(productModel);
		if(p1!=null) {
			return "-1";
		}
		int p2=productService.insert(productModel);
		return new JSONObject(p2).toString();
	}
	
	
	/**后台查询商品
	 * @param productModel
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "list",produces = "text/html;charset=UTF-8")
	public String select(ProductModel productModel) {
		System.out.println(productModel);
		if(FmtEmpty.isEmpty(productModel.getCode())) {
			productModel.setCode("");
		}
		productModel.setCode("%" +productModel.getCode()+ "%");
		
		
		if(productModel.getName().equals("null")||FmtEmpty.isEmpty(productModel.getName())) {
			productModel.setName("");
		}
		
		productModel.setName("%" +productModel.getName()+ "%");
		productModel.setPageOn(true);
		List<ProductModel> p1 = productService.selectAll(productModel);
		int p2=productService.selectCount(productModel);
		
		Map<String, Object> map = new HashMap<>();
        map.put("list",p1);
        map.put("count",p2);
		return new JSONObject(map).toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "orderList",produces = "text/html;charset=UTF-8")
	public String orderSelect(ProductModel productModel) {
		System.out.println(productModel);
		List<ProductModel> p1 = productService.selectAll(productModel);
		return new JSONArray(p1).toString();
	}
	
	/**前端查询商品
	 * @param productModel
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "productList",produces = "text/html;charset=UTF-8")
	public String selectAll(ProductModel productModel) {
		productModel.setPageOn(true);
		if(productModel.getCode()==null) {
			productModel.setCode("");
		}
		productModel.setCode("%" +productModel.getCode()+ "%");
		
		
		if(productModel.getName().equals("null")||productModel.getName()==null) {
			productModel.setName("");
		}
		System.out.println(productModel.getName());
		productModel.setName("%" +productModel.getName()+ "%");
		
		
		if(productModel.getCategoryCode().equals("null")||productModel.getCategoryCode()==null) {
			productModel.setCategoryCode("");
		}
		CategoryModel categoryModel=new CategoryModel();
		categoryModel.setParentCode("1");
		categoryModel.setCode(productModel.getCategoryCode());    
		List<CategoryModel> c1 = categoryService.selectAll(categoryModel);            //查询是否为一级分类
		 Map<String, Object> map = new HashMap<>();
		 
		if(FmtEmpty.isEmpty(c1)) {                                                           //如果不是一级分类，查询出该分类下的商品
			List<ProductModel> p1 = productService.selectAll(productModel);
			int p2=productService.selectCount(productModel);
			map.put("count", p2);
			map.put("product", p1);
			return new JSONObject(map).toString();
			
		}else {                                                                   //如果是一级分类
			
			CategoryModel categoryModel2=new CategoryModel();
			categoryModel2.setParentCode(categoryModel.getCode());
			List<CategoryModel> c2 = categoryService.selectAll(categoryModel2);            //查询出一级分类下的二级分类
			System.out.println("一级分类下的二级分类="+c2);
			int j=0;
			for(int i = 0; i < c2.size(); i++) {                                                   //遍历查出二级分类下的商品
				CategoryModel c3= (CategoryModel)c2.get(i);
				productModel.setCategoryCode(c3.getCode());
				System.out.println("二级分类="+c3.getCode());
				List<ProductModel> p2=productService.selectAll(productModel);
				int p3=productService.selectCount(productModel);
				j+=p3;
				map.put("product"+i, p2);
			}
			map.put("count", j);
			return new JSONObject(map).toString();
		}
		
	}
	
	/**商品详情
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "xiangqingList",produces = "text/html;charset=UTF-8")
	public String xiangqingSelect(String code) {
		ProductModel productModel=new ProductModel();
		productModel.setCode(code);
		List<ProductModel> p1 = productService.selectAll(productModel);
		return new JSONArray(p1).toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "delete")
	public String delete(ProductModel productModel) {
	int p1=productService.delete(productModel);
	return p1+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "update")
	public String update(ProductModel productModel) {
		int p1=productService.updateActive(productModel);
		return p1+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "getUser",produces = "text/html;charset=UTF-8")
	public String getUser(ProductModel productModel) {
		 ProductModel p1 = productService.select(productModel);
		 return new JSONObject(p1).toString();
	}
}
