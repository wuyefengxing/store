package com.situ.store.product.mapper;

import java.util.List;

import com.situ.store.product.model.CategoryModel;

public interface CategoryMapper {
	
	int insert (CategoryModel model);
	
	int delete (CategoryModel model);
	
	int deleteModel (CategoryModel model);
	
	int update (CategoryModel model);
	
	CategoryModel select (CategoryModel model);
	
	List<CategoryModel> selectAll (CategoryModel model);
	
	int selectCount (CategoryModel model);

}
