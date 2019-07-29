package com.situ.store.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.store.product.mapper.ImageMapper;
import com.situ.store.product.model.ImageModel;

@Service
public class ImageService {
	

		@Autowired
		private ImageMapper imageMapper;
		
		public int insert(ImageModel model) {
			return imageMapper.insert(model);
		}
		
		public int delete(int id) {
			return imageMapper.delete(id);
		}
		
		
		
		public int update(ImageModel model) {
			return imageMapper.update(model);
		}
		
		
		public ImageModel select(int id) {
			return imageMapper.select(id);
		}
		
		public List<ImageModel> selectAll(ImageModel model){
			return imageMapper.selectAll(model);
		}
	}
