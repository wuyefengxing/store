package com.situ.store.order.model;

public class CarModel {

	private Integer id;
	private String userCode;
	private String productCode;
	private String number;
	
	private String name;
	private String price;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "CarModel [id=" + id + ", userCode=" + userCode + ", productCode=" + productCode + ", number=" + number
				+ ", name=" + name + ", price=" + price + "]";
	}

	
	
}
