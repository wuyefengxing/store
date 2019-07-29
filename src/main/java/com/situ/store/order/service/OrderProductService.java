package com.situ.store.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.store.order.mapper.OrderProductMapper;
import com.situ.store.order.model.OrderProductModel;

@Service
public class OrderProductService {

	@Autowired
	private OrderProductMapper orderProductMapper;
	
	public int insert(OrderProductModel model) {
		return orderProductMapper.insert(model);
	}

	
	public int delete(OrderProductModel model) {
		return orderProductMapper.delete(model);
	}
	
	public int update(OrderProductModel model) {
		return orderProductMapper.update(model);
	}
	
	public List<OrderProductModel> selectAll(OrderProductModel model) {
		return orderProductMapper.selectAll(model);
	}

}
