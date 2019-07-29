package com.situ.store.product.model;

import com.situ.store.util.Pager;

public class ProductModel extends Pager{

	
	    private Integer id;
	    private String  code;
	    private String  name;
	    private String price;
	    private String describe;
	    private int number;
	    private String state;
	    private String categoryCode;
	    
	    private String url;

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

		public String getDescribe() {
			return describe;
		}

		public void setDescribe(String describe) {
			this.describe = describe;
		}

		public int getNumber() {
			return number;
		}

		public void setNumber(int number) {
			this.number = number;
		}

		public String getState() {
			return state;
		}

		public void setState(String state) {
			this.state = state;
		}

		public String getCategoryCode() {
			return categoryCode;
		}

		public void setCategoryCode(String categoryCode) {
			this.categoryCode = categoryCode;
		}

		public String getUrl() {
			return url;
		}

		public void setUrl(String url) {
			this.url = url;
		}

		@Override
		public String toString() {
			return "ProductModel [id=" + id + ", code=" + code + ", name=" + name + ", price=" + price + ", describe="
					+ describe + ", number=" + number + ", state=" + state + ", categoryCode=" + categoryCode + ", url="
					+ url + "]";
		}
	    
}
