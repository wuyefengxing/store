package com.situ.store.order.model;

import com.situ.store.util.Pager;

public class OrderModel extends Pager{

	private Integer id;
	private String code;
	private String userCode;
	private String time;
	private String address;
	private String state;
	
	private String productCode;
	private String number;
	private String cost;
	private String name;
	private String productName;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	@Override
	public String toString() {
		return "OrderModel [id=" + id + ", code=" + code + ", userCode=" + userCode + ", time=" + time + ", address="
				+ address + ", state=" + state + ", productCode=" + productCode + ", number=" + number + ", cost="
				+ cost + ", name=" + name + ", productName=" + productName + "]";
	}

}
