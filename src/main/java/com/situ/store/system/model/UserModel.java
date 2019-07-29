package com.situ.store.system.model;

import com.situ.store.util.Pager;

public class UserModel extends Pager {

	    private Integer id;
	    private String  code;
	    private String  password;
	    private String  name;
	    private String administrator;
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
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getAdministrator() {
			return administrator;
		}
		public void setAdministrator(String administrator) {
			this.administrator = administrator;
		}
		@Override
		public String toString() {
			return "UserModel [id=" + id + ", code=" + code + ", password=" + password + ", name=" + name
					+ ", administrator=" + administrator + "]";
		}
		
		
	    
	    
	    
	    
}
