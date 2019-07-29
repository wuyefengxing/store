package com.situ.store.order.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.store.order.model.OrderModel;
import com.situ.store.order.model.OrderProductModel;
import com.situ.store.order.service.OrderProductService;
import com.situ.store.order.service.OrderService;
import com.situ.store.util.FmtEmpty;

@Controller
@RequestMapping("order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderProductService orderProductService;
	
	/**后台添加订单
	 * @param orderModel
	 * @return null=添加订单失败
	 */
	@ResponseBody
	@RequestMapping("add")
	public String add(OrderModel orderModel) {
		
		System.out.println(orderModel);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time=df.format(new Date());
		String code = UUID.randomUUID().toString();
		 
		orderModel.setCode(code);
		orderModel.setState("待发货");
		orderModel.setTime(time);
		
		
		
		OrderProductModel orderProductModel=new OrderProductModel();
		orderProductModel.setProductCode(orderModel.getProductCode());
		orderProductModel.setNumber(orderModel.getNumber());
		orderProductModel.setCost(orderModel.getCost());
		orderProductModel.setOrderCode(code);
		System.out.println(orderProductModel);
		
		int c2=orderService.insert(orderModel);
			int o2=orderProductService.insert(orderProductModel);
		if(o2!=0&&c2!=0) {
			return ""+c2;
		}
		return null;
	}
	
	
	/**用户添加订单
	 * @param orderModel
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "userAdd",produces = "text/html;charset=UTF-8")
	public String userAdd(OrderModel orderModel) {
		
		System.out.println(orderModel);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time=df.format(new Date());
		String code = UUID.randomUUID().toString();
		 
		orderModel.setCode(code);
		orderModel.setState("待发货");
		orderModel.setTime(time);
		int c2=orderService.insert(orderModel);
		if(c2!=0) {
			return code;
		}
		return null;
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public String delete(OrderModel orderModel) {
		int o1=orderService.delete(orderModel);
		if(o1!=0) {
			return ""+o1;
		}
		return null;
		
	}
	
	/**修改订单
	 * @param orderModel
	 * @return null=没有进行修改
	 */
	@ResponseBody
	@RequestMapping("update")
	public String update(OrderModel orderModel) {
		List<OrderModel> o1 = orderService.selectAll(orderModel);
		if(FmtEmpty.isEmpty(o1)) {
			int o2=orderService.update(orderModel);
			return ""+o2;
		}
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value = "listAll", produces = "text/html;charset=UTF-8")
	public String selectAll (OrderModel orderModel,HttpServletRequest request){
		orderModel.setPageOn(true);
		List<OrderModel> o1 = orderService.selectAll(orderModel);
		
		int o2=orderService.selectCount(orderModel);
		
    Map<String, Object> map = new HashMap<>();
        map.put("list",o1);
        map.put("count", o2);
		return new JSONObject(map).toString();
	}
	
	
	@ResponseBody
	@RequestMapping(value = "userList", produces = "text/html;charset=UTF-8")
	public String userSelect (OrderModel orderModel){
		orderModel.setPageOn(true);
		List<OrderModel> o1 = orderService.selectAll(orderModel);
		int o2=orderService.selectCount(orderModel);
		Map<String, Object> map = new HashMap<>();
        map.put("list",o1);
        map.put("count", o2);
		return new JSONObject(map).toString();
	}
}
