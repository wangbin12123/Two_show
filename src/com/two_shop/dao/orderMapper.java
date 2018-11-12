package com.two_shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.two_shop.bean.Order;

public interface orderMapper {

	//分页查询订单
	public List<Order> orderById(@Param("uid")Integer uid,@Param("state")Integer state,@Param("currentPage")int currentPage,@Param("pageSize")int pageSize)throws Exception;
	
	//查询订单数目
	public int count(@Param("uid")Integer uid,@Param("state")Integer state)throws Exception;
	
	//添加订单
	public int addOrder(Order order)throws Exception;
	
	//删除订单
	public int deleteOrder(@Param("id") Integer id)throws Exception;
	
	//修改订单
	public int orderUpdate(Order order)throws Exception;
	
	//订单查询根据id
	public Order findOrder(@Param("id") Integer id)throws Exception;
	
}
