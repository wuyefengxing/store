package com.situ.store.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.store.product.mapper.CategoryMapper;
import com.situ.store.product.model.CategoryModel;

@Service
public class CategoryService {

	@Autowired
	private CategoryMapper categoryMapper;
	
	public int insert(CategoryModel model) {
		return categoryMapper.insert(model);
	}
	
	public int delete(CategoryModel model) {
		return categoryMapper.delete(model);
	}
	
	public int deleteModel(CategoryModel model) {
		return categoryMapper.deleteModel(model);
	}
	
	
	public int update(CategoryModel model) {
		return categoryMapper.update(model);
	}
	
	
	public CategoryModel select(CategoryModel model) {
		return categoryMapper.select(model);
	}
	
	public List<CategoryModel> selectAll(CategoryModel model){
		return categoryMapper.selectAll(model);
	}
	
	public int selectCount(CategoryModel model) {
		return categoryMapper.selectCount(model);
	}
}
