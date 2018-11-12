package com.two_shop.service;

import java.util.List;

import com.two_shop.bean.Cart;

public interface cartService {
	public int cartAdd(Cart cart)throws Exception;
	public List<Cart> cartList(Integer uid)throws Exception;
}
