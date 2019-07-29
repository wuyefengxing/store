package com.situ.store.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.store.order.mapper.CarMapper;
import com.situ.store.order.model.CarModel;

@Service
public class CarService {

	@Autowired
	private CarMapper carMapper;
	
	public int insert(CarModel carModel) {
		return carMapper.insert(carModel);
	}
	
	public int delete(CarModel carModel) {
		return carMapper.delete(carModel);
	}
	
	public int update(CarModel carModel) {
		return carMapper.update(carModel);
	}
	
	public List<CarModel> selectAll(CarModel carModel){
		return carMapper.selectAll(carModel);
	}
}
