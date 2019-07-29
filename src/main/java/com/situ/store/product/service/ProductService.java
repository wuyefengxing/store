package com.situ.store.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.store.product.mapper.ProductMapper;
import com.situ.store.product.model.ProductModel;

@Service
public class ProductService {
	
	@Autowired
	private  ProductMapper productMapper;

	public int insert(ProductModel model) {
		return productMapper.insert(model);
	}
	
	public int delete(ProductModel model) {
		return productMapper.delete(model);
	}
	
	public int update(ProductModel model) {
		return productMapper.update(model);
	}
	
	public int updateActive(ProductModel model) {
		
		return productMapper.updateActive(model);
	}
	
	public ProductModel select(ProductModel model) {
		return productMapper.select(model);
	}
	
	public List<ProductModel> selectAll(ProductModel model){
		return productMapper.selectAll(model);
	}
	
	public int selectCount(ProductModel model) {
		return productMapper.selectCount(model);
	}
}
