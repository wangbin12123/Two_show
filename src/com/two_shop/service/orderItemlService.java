package com.two_shop.service;

import java.util.List;

import com.two_shop.bean.Order_item;

public interface orderItemlService {

	//分页查询订单明细
	public List<Order_item> orderById(Integer oid,int currentPage,int pageSize)throws Exception;
		
	//查询订单明细数目
	public int count(Integer id)throws Exception;
}
