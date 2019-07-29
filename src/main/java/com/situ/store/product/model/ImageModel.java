package com.situ.store.product.model;

public class ImageModel {

	private Integer id;
	private String productCode;
	private String url;
	private String type;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Image [id=" + id + ", productCode=" + productCode + ", url=" + url + ", type=" + type + "]";
	}
	
	
	
}
