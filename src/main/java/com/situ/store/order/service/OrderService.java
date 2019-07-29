package com.situ.store.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.store.order.mapper.OrderMapper;
import com.situ.store.order.model.OrderModel;

@Service
public class OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	public int insert(OrderModel model) {
		return orderMapper.insert(model);
	}
	
	public int delete(OrderModel model) {
		return orderMapper.delete(model);
	}
	
	public int update(OrderModel model) {
		return orderMapper.update(model);
	}
	
	public List<OrderModel> selectAll(OrderModel model){
		return orderMapper.selectAll(model);
	}
	
	public int selectCount(OrderModel model) {
		return orderMapper.selectCount(model);
	}
	
}
