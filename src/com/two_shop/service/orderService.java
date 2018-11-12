package com.two_shop.service;

import java.util.List;

import com.two_shop.bean.Order;

public interface orderService {

	//分页查询订单
	public List<Order> orderById(Integer uid,Integer state,int currentPage,int pageSize)throws Exception;
		
	//查询订单数目
	public int count(Integer uid,Integer state)throws Exception;
	
	//添加订单
	public int addOrder(Order order)throws Exception;
	
	
	//根据id查寻订单
	public Order findOrder(Integer id)throws Exception;
	
	
	
	//订单删除
	public int deleteOrder(Integer id)throws Exception;
}