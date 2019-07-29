package com.situ.store.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.store.system.model.UserModel;
import com.situ.store.system.service.UserService;
import com.situ.store.util.FmtEmpty;
import com.situ.store.util.MD5;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;

	
	@ResponseBody
	@RequestMapping(value="/reg")
	public String reg(UserModel userModel,String code,Model model) {
		System.out.println(code);
		UserModel u2=userService.selectUser(code);
		if(u2!=null) {
			return JSONObject.fromObject("0").toString();
		}
		userModel.setPassword(MD5.encode(userModel.getPassword()));
		int u1 = userService.insert(userModel);
		return JSONObject.fromObject(u1).toString();		
	}
	
	
	/**
	 * 用户注册
	 * @param userModel
	 * @param code
	 * @param request
	 * @return 0=没输账号。1=没输密码。2=该账号已被注册。3=没有填写验证码.4=验证码错误.5=注册成功. 6=两次密码输入的不同
	 */
	@ResponseBody
	@RequestMapping(value="/userReg")
	public String userReg(UserModel userModel,String code,HttpServletRequest request) {
		System.out.println(userModel+"  "+code+"  "+request.getParameter("repassword"));
		if(FmtEmpty.isEmpty(userModel.getCode())) {
			return "0";
		}
		if(FmtEmpty.isEmpty(userModel.getPassword())) {
			return "1";
		}
		String repassword=request.getParameter("repassword");
		if(!repassword.equals(userModel.getPassword())) {
			return "6";
		}
		UserModel u2=userService.selectUser(code);
		if(u2!=null) {
			return "2";
		}
		String authCode=request.getParameter("authCode");
		if(FmtEmpty.isEmpty(authCode)) {
			return "3";
		}
		if(!authCode.equals(request.getSession().getAttribute("authCode"))) {
			return "4";
		}
		userModel.setPassword(MD5.encode(userModel.getPassword()));
		int u1 = userService.insert(userModel);
		
		return "5";		
	}
	/**
	 * @param userModel
	 * @param code
	 * @param model
	 * @return 0=没输账号。1=没输密码。2=没有该账号。3=密码错误。4=登陆成功.5=没有填写验证码.6=验证码错误
	 */
	@ResponseBody
	@RequestMapping(value="/login")
	public String login(UserModel userModel,HttpServletRequest request) {
		System.out.println("userModel="+userModel);
		if(FmtEmpty.isEmpty(userModel.getCode())) {
			return "0";
		}
		if(FmtEmpty.isEmpty(userModel.getPassword())) {
			return "1";
		}
		String authCode=request.getParameter("authCode");
		if(FmtEmpty.isEmpty(authCode)) {
			
			return "5";
		}
		if(!authCode.equals(request.getSession().getAttribute("authCode"))) {
			return "6";
		}
		UserModel u1 = userService.selectUser(userModel.getCode());
		if(FmtEmpty.isEmpty(u1)) {
			return "2";
		}
		if(!MD5.encode(userModel.getPassword()).equals(u1.getPassword())) {
			return "3";
		}
		request.getSession().setAttribute("user", u1);   //将用户信息存储到session域中
		return "4";
	}
	
	@ResponseBody
	@RequestMapping(value = "list")
	public String list(UserModel userModel) {
		userModel.setCode("%" + userModel.getCode()+ "%");
		userModel.setName("%" + userModel.getName()+ "%");
		userModel.setPageOn(true);
		List<UserModel> u1 = userService.selectAll(userModel);
		int u2=userService.selectCount(userModel);
		
		 Map<String, Object> map = new HashMap<>();
	        map.put("list",u1);
	        map.put("count", u2);
	        
		return new org.json.JSONObject(map).toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "delete")
	public String delete(String code) {
		
		int u1=userService.delete(code);
		return JSONObject.fromObject(u1).toString();	
	}
	
	@ResponseBody
	@RequestMapping(value = "getUser")
	public String getUser(String code) {
		UserModel u1 = userService.selectUser(code);
		return JSONObject.fromObject(u1).toString();
	}

	@ResponseBody
	@RequestMapping(value = "update")
	public String update(UserModel userModel) {
		
		int u1 = userService.update(userModel);

		return u1+"";
	}
	
	/**
	 * @param userModel
	 * @param request
	 * @return 1=退出成功。 2=退出失败。
	 */
	@ResponseBody
	@RequestMapping("quit")
	public String quit(UserModel userModel,HttpServletRequest request) {
		if(!FmtEmpty.isEmpty(userModel.getCode())) {
			request.getSession().removeAttribute("user");
			return "1";
		}
		
		return "2";
	}
}
