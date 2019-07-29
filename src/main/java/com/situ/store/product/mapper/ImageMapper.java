package com.situ.store.product.mapper;

import java.util.List;

import com.situ.store.product.model.ImageModel;


public interface ImageMapper {
	
int insert(ImageModel model);
	
	int delete(int productCode);
	
	int update(ImageModel model);
	
	ImageModel select(int id);
	
	List<ImageModel> selectAll(ImageModel model);

}
