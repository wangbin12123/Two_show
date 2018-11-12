package com.two_shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.two_shop.bean.Order_item;

public interface orderitemMapper {

	//分页查询订单明细
	public List<Order_item> orderById(@Param("oid")Integer oid,@Param("currentPage")int currentPage,@Param("pageSize")int pageSize)throws Exception;
	
	//查询订单明细数目
	public int count(@Param("id")Integer id)throws Exception;
}
 