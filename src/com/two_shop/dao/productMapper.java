package com.two_shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.two_shop.bean.Product;

public interface productMapper {

	//商品分页显示
	public List<Product> productPage(@Param("name")String name,@Param("cid")Integer cid,
			@Param("currentPage")int currentPage,@Param("pageSize")int pageSize)throws Exception;
	
	//根据id查询
	public Product getProductById(@Param("id")String id)throws Exception;
	
	//查询商品数目
	public int count(@Param("name")String name,@Param("cid")Integer cid)throws Exception;
	
	//添加商品
	public int productAdd(Product product)throws Exception;
	
	//删除商品
	public int productDelete(@Param("id")Integer id)throws Exception;
	
	//修改商品
	public int productUpdate(Product product)throws Exception;
	
	//商品库存
	public List<Product> getStock()throws Exception;
	
	//查询商品价格
	public List<Product> getPrice()throws Exception;
	
	//查询商品更新时间
	public List<Product> getTime()throws Exception;
	
	//查询商品数量
	public List<Product> getNum()throws Exception;
 }
