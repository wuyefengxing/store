package com.situ.store.order.mapper;

import java.util.List;

import com.situ.store.order.model.CarModel;

public interface CarMapper {

	int insert (CarModel carModel);
	
	int delete (CarModel carModel);
	
	int update (CarModel carModel);
	
	List<CarModel> selectAll (CarModel carModel);
}
