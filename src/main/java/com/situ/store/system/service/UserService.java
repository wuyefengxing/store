package com.situ.store.system.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.store.system.mapper.UserMapper;
import com.situ.store.system.model.UserModel;

@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	public int insert(UserModel model) {
		return userMapper.insert(model);
	}
	
	public int deleteModel(UserModel model) {
		return userMapper.deleteModel(model);
	}
	
	public int delete(String code) {
		return userMapper.delete(code);
	}
	
	public int update(UserModel userModel) {
		return userMapper.update(userModel);
	}
	
	public List<UserModel> selectAll(UserModel model) {
		return userMapper.selectAll(model);
	}
	
	public UserModel selectUser(String code) {
	   return userMapper.selectUser(code);
	}
	
	public int selectCount(UserModel model) {
		return userMapper.selectCount(model);
	}

}
