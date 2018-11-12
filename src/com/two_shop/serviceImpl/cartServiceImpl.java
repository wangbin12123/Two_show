package com.two_shop.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.two_shop.bean.Cart;
import com.two_shop.dao.cartMapper;
import com.two_shop.service.cartService;
@Service
public class cartServiceImpl implements cartService{
	@Resource
	private cartMapper cartMapper;
	@Override
	public int cartAdd(Cart cart) throws Exception {
		int count=cartMapper.cartAdd(cart);
		return count;
	}
	@Override
	public List<Cart> cartList(Integer uid) throws Exception {
		// TODO Auto-generated method stub
		System.err.println("/"+uid+"--");
		List<Cart> cartlist=cartMapper.cartList(uid);
		return cartlist;
	}

}
