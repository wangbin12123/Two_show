package com.two_shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import com.two_shop.bean.User;

public interface userMapper {

	//用户登录
	public User getLoginUser(@Param("username") String username)throws Exception;
	

	//添加用户
	@Insert("insert into user(username,password,role_name,name,email,tel,birthday,sex,state,gmt_create,gmt_modified)"
			+ "values(#{username},#{password},#{role_name},#{name},#{email},#{tel},#{birthday},#{sex},#{state},#{gmt_create},#{gmt_modified})")
	public int insert(User user)throws Exception; 
	
	//删除用户
	public int delete(Integer id)throws Exception;
	
	//更新用户
	public int update(User user)throws Exception;
	
	//分页显示
	public List<User> userList(@Param("username")String username,@Param("id")Integer id,
			@Param("currentPage")int currentPage,@Param("pageSize")int pageSize)throws Exception;
	
	//查询用户数目
	public int count(@Param("username")String username,@Param("id")Integer id)throws Exception;
	
	//修改密码
	public int pwdUpdate(@Param("password")String password,@Param("id") Integer id)throws Exception;
	
	//查询用户单个
	public User getUserById(@Param("id")Integer id)throws Exception;
	
	
	//通过用户ID查地址
	public List<User> userId(@Param("id")Integer id)throws Exception;
}
