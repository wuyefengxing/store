package com.situ.store.order.mapper;

import java.util.List;

import com.situ.store.order.model.OrderProductModel;

public interface OrderProductMapper {
	
	
	int insert (OrderProductModel orderProduct);
	
	int delete (OrderProductModel model);
	
	int update(OrderProductModel model);
	
	List<OrderProductModel> selectAll (OrderProductModel model);

}
