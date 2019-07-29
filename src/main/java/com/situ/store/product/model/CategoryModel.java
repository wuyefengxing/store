package com.situ.store.product.model;

import com.situ.store.util.Pager;

public class CategoryModel extends Pager {
	
	private Integer id;
	private String code;
	private String name;
	private String des;
	private String parentCode;
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
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	@Override
	public String toString() {
		return "CategoryModel [id=" + id + ", code=" + code + ", name=" + name + ", des=" + des + ", parentCode="
				+ parentCode + "]";
	}
	
}
