package com.two_shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.two_shop.bean.Address;

public interface addressMapper {
	
	//查询地址
	public Address selectById(@Param("id") String id)throws Exception;
	
	//添加地址
	public int addressAdd(Address address)throws Exception;
	
	//删除地址
	public int addressDelete(@Param("id") Integer id)throws Exception;
	
	//修改地址
	public int addressUpdate(Address address)throws Exception;
	
	// 根据用户id查询地址
	public List<Address> selectByUid(@Param("uid")Integer uid)throws Exception;
}
