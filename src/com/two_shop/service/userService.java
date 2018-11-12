package com.two_shop.service;

import java.util.List;

import com.two_shop.bean.User;

public interface userService {

	//用户登录
	public User Login(String username,String password)throws Exception;
	
	//添加用户
	public int insert(User user)throws Exception;
	
	//删除用户
	public int delete(Integer id)throws Exception;
	
	//更新用户
	public int update(User user)throws Exception;
	
	//分页显示
	public List<User> userList(String username,Integer id,int currentPage,int pageSize)throws Exception;
	
	//查询用户数目
	public int count(String username,Integer id)throws Exception;
	
	//修改密码
	public int pwdUpadte(String password,Integer id)throws Exception;
	
	//根据id查询用户
	public User getUserById(Integer id)throws Exception;
	
	//通过用户ID查地址
	public List<User> userId(Integer id)throws Exception;
}
