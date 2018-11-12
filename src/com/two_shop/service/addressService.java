package com.two_shop.service;

import java.util.List;



import com.two_shop.bean.Address;

public interface addressService {
	
	//查询地址
	public Address selectById(String id)throws Exception;
	
	//添加地址
	public int addressAdd(Address address)throws Exception;
	
	//删除地址
	public int addressDelete(Integer id)throws Exception;
	
	//修改地址
	public int addressUpdate(Address address)throws Exception;
	// 根据用户id查询地址
	public List<Address> selectByUid(Integer uid)throws Exception;
}
