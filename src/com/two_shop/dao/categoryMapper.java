package com.two_shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.two_shop.bean.Category;
import com.two_shop.bean.Product;

public interface categoryMapper {
	
	//分页查询
	public List<Category> selectPage(@Param("id")Integer id,@Param("name")String name,
			@Param("currentPage")Integer currentPage,@Param("pageSize")Integer pageSize)throws Exception;
	
	//查询数目
	public int count(@Param("id")Integer id,@Param("name")String name)throws Exception;
	
	//添加商品类别
	public int categoryAdd(Category category)throws Exception;
	
	//查询商品类别
	public List<Category> selectList()throws Exception;
	
	//删除商品类别
	public int categoryDelete(@Param("id")Integer id)throws Exception;
	
	//查询商品表
	public List<Product> productById(@Param("id")Integer id)throws Exception;
	
	//一对多查询商品
	public List<Category> categoryList(@Param("name")String name)throws Exception;
	//后台:根据id获取类别名
	public Category getnameByid(@Param("id")Integer id)throws Exception;
	//后台:修改商品表
	public int categoryUpdate(Category category)throws Exception;
}
