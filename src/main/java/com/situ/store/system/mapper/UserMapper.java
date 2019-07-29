package com.situ.store.system.mapper;

import java.util.List;

import com.situ.store.system.model.UserModel;

public interface UserMapper {
	
	int insert(UserModel model);                   //添加
	
	int deleteModel(UserModel model);              //按照字段删除
	
	int delete(String code);                         //按照编号删除
	
	int update(UserModel userModel);                     //按照编号修改用户信息
	
	
	List<UserModel> selectAll(UserModel model);           //按照输入的字段查询
	
	UserModel selectUser(String code);                     //按照编号查询
	
	int selectCount(UserModel model);

}
