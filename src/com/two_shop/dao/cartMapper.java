package com.two_shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.two_shop.bean.Cart;

public interface cartMapper {
	public int cartAdd(Cart cart)throws Exception;
	public List<Cart> cartList(@Param("uid")Integer uid)throws Exception;
}
