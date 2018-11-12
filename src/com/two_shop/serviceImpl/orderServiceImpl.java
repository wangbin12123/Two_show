package com.two_shop.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.two_shop.bean.Order;
import com.two_shop.dao.orderMapper;
import com.two_shop.service.orderService;

@Service
public class orderServiceImpl implements orderService{

	@Resource
	private orderMapper oMapper;
	
	@Override
	//分页查询订单
	public List<Order> orderById(Integer uid,Integer state, int currentPage, int pageSize) throws Exception {
		currentPage=(currentPage-1)*pageSize;
		System.err.println("/"+uid+"--"+state);
		List<Order> order=oMapper.orderById(uid, state, currentPage, pageSize);
		return order;
	}

	@Override
	//查询订单数目
	public int count(Integer uid,Integer state) throws Exception {
		int count=oMapper.count(uid,state);
		return count;
	}

	@Override
	//添加订单
	public int addOrder(Order order) throws Exception {
		// TODO Auto-generated method stub
		int count = oMapper.addOrder(order);
		return count;
	}

	@Override
	public Order findOrder(Integer id) throws Exception {
		// TODO Auto-generated method stub
		Order order = oMapper.findOrder(id);
		return order;
	}

	@Override
	public int deleteOrder(Integer id) throws Exception {
		// TODO Auto-generated method stub
		int count = oMapper.deleteOrder(id);
		return count;
	}

	

}
