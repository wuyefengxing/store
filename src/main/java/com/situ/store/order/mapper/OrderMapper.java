package com.situ.store.order.mapper;

import java.util.List;

import com.situ.store.order.model.OrderModel;

public interface OrderMapper {
	
	int insert (OrderModel model);
	
	int delete (OrderModel model);
	
	int update (OrderModel model);
	
	List<OrderModel> selectAll (OrderModel model);
	
	int selectCount (OrderModel model);

}
