package com.two_shop.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.two_shop.bean.Order_item;
import com.two_shop.dao.orderitemMapper;
import com.two_shop.service.orderItemlService;
@Service
public class orderitemSeviceImpl implements orderItemlService{

	@Resource
	private orderitemMapper oitemMapper;
	@Override
	//分页查询订单明细
	public List<Order_item> orderById(Integer oid, int currentPage, int pageSize) throws Exception {
		currentPage=(currentPage-1)*pageSize;
		List<Order_item> o=oitemMapper.orderById(oid, currentPage, pageSize);
		return o;
	}

	@Override
	//查询订单明细数目
	public int count(Integer id) throws Exception {
		int count=oitemMapper.count(id);
		return count;
	}

}
