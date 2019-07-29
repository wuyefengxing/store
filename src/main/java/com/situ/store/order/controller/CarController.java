package com.situ.store.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.store.order.model.CarModel;
import com.situ.store.order.service.CarService;
import com.situ.store.util.FmtEmpty;

@Controller
@RequestMapping("car")
public class CarController {

	@Autowired
	private CarService carService;
	
	
	/**
	 * @param carModel
	 * @return 1=添加购物车成功。 2=已添加到购物车
	 */
	
	@RequestMapping("add")
	public String insert(String userCode,String productCode,CarModel carModel) {
		CarModel carModel2=new CarModel();
		carModel2.setUserCode(userCode);
		carModel2.setProductCode(productCode);
		System.out.println(carModel2);
		List<CarModel> c1 = carService.selectAll(carModel2);
		if(FmtEmpty.isEmpty(c1)) {
			int c2=carService.insert(carModel);
			return "jsp/user/car";
		}
		else {
			return "jsp/user/carError";
		}
	}
	
	/**
	 * @param carModel
	 * @return 1=删除成功 。 2=删除失败
	 */
	@ResponseBody
	@RequestMapping("delete")
	public String delete(CarModel carModel) {
		int c1=carService.delete(carModel);
		if(c1!=0) {
			return "1";
		}
		else {
			return "2";
		}
	}
	
	/**
	 * @param carModel
	 * @return 1=修改成功 。 2=修改失败
	 */
	@ResponseBody
	@RequestMapping("update")
	public String update(CarModel carModel) {
		int c1=carService.update(carModel);
		if(c1!=0) {
			return "1";
		}
		else {
			return "2";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "list",produces = "text/html;charset=UTF-8")
	public String selectAll(CarModel carModel,HttpServletRequest request) {
		List<CarModel> c1=carService.selectAll(carModel);
		
		return new JSONArray(c1).toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "orderList",produces = "text/html;charset=UTF-8")
	public String orderCar(CarModel carModel,HttpServletRequest request) {
		List<CarModel> c1=carService.selectAll(carModel);
		
		request.getSession().setAttribute("orderCar", c1);
		return new JSONArray(c1).toString();
	}
}
