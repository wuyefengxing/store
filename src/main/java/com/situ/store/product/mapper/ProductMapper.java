package com.situ.store.product.mapper;

import java.util.List;

import com.situ.store.product.model.ProductModel;

public interface ProductMapper {
	
	int insert(ProductModel model);
	
	int delete(ProductModel model);
	
	int update(ProductModel model);
	
	int updateActive(ProductModel model);
	
	ProductModel select(ProductModel model);
	
	List<ProductModel> selectAll(ProductModel model);
	
	int selectCount (ProductModel model);
	
	

}
