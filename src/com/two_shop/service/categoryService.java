package com.two_shop.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.two_shop.bean.Category;
import com.two_shop.bean.Product;

public interface categoryService {
	//分页查询
	public List<Category> selectPage(Integer id,String name,Integer currentPage,Integer pageSize)throws Exception;
	
	//查询数目
	public int count(Integer id,String name)throws Exception;
	
	//添加商品类别
	public int categoryAdd(Category category)throws Exception;
	
	//删除商品类别
	public int categoryDelete(Integer id)throws Exception;
	
	//查询商品表
	public List<Product> productById(Integer id)throws Exception;
	
	//一对多查询商品
	public List<Category> categoryList(String name)throws Exception;
	
	//查询商品类别
	public List<Category> selectList()throws Exception;
	
	//后台：
	//修改商品表
	public int categoryUpdate(Category category)throws Exception;
	//后台：
	public Category getnameByid(Integer id)throws Exception;
}
