package com.situ.store.order.model;

public class OrderProductModel {

	
	private Integer id;
	private String orderCode;
	private String productCode;
	private String number;
	private String cost;
	
	private String name;
	private String url;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "OrderProductModel [id=" + id + ", orderCode=" + orderCode + ", productCode=" + productCode + ", number="
				+ number + ", cost=" + cost + ", name=" + name + ", url=" + url + "]";
	}

	
}
