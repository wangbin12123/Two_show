package com.two_shop.service;

import java.util.List;

import com.two_shop.bean.Product;

public interface productService {
	//商品分页显示
	public List<Product> productPage(String name,Integer cid,int currentPage,int pageSize)throws Exception;
		
	//根据id查询
	public Product getProductById(String id)throws Exception;
		
	//查询商品数目
	public int count(String name,Integer cid)throws Exception;
		
	//添加商品
	public int productAdd(Product product)throws Exception;
		
	//删除商品
	public int productDelete(Integer id)throws Exception;
		
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
