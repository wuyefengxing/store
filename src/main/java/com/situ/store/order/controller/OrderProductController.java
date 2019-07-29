package com.situ.store.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.store.order.model.OrderProductModel;
import com.situ.store.order.service.OrderProductService;

@Controller
@RequestMapping("orderProduct")
public class OrderProductController {

	@Autowired
	private OrderProductService orderProductService;
	
	
	@ResponseBody
	@RequestMapping(value = "list", produces = "text/html;charset=UTF-8")
	public String list(OrderProductModel orderProductModel) {
		
		List<OrderProductModel> o1 = orderProductService.selectAll(orderProductModel);
		return new JSONArray(o1).toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "add", produces = "text/html;charset=UTF-8")
	public String add(OrderProductModel orderProductModel) {
		System.out.println( orderProductModel);
		int o1=orderProductService.insert(orderProductModel);
		if(o1!=0) {
			return ""+o1;
		}
		return null;
	}
}
