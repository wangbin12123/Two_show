package com.two_shop.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.two_shop.bean.Category;
import com.two_shop.bean.Product;
import com.two_shop.dao.categoryMapper;
import com.two_shop.service.categoryService;

@Service
public class categoryServiceImpl implements categoryService{
	@Resource
	private categoryMapper cMapper;
	@Override
	//分页查询
	public List<Category> selectPage(Integer id, String name, Integer currentPage, Integer pageSize) throws Exception {
		
		currentPage = (currentPage-1)*pageSize;
		List<Category> clist = cMapper.selectPage(id, name, currentPage, pageSize);
		return clist;
	}

	@Override
	//查询数目
	public int count(Integer id, String name) throws Exception {
		int count = cMapper.count(id, name);
		return count;
	}

	@Override
	//添加商品类别
	public int categoryAdd(Category category) throws Exception {
		int count = cMapper.categoryAdd(category);
		return count;
	}

	@Override
	//删除商品类别
	public int categoryDelete(Integer id) throws Exception {
		int count = cMapper.categoryDelete(id);
		return count;
	}

	@Override
	//查询商品表
	public List<Product> productById(Integer id) throws Exception {
		List<Product> pList = cMapper.productById(id);
		return pList;
	}

	@Override
	//一对多查询商品
	public List<Category> categoryList(String name) throws Exception {
		List<Category> cList =cMapper.categoryList(name);
		return cList;
	}

	@Override
	public List<Category> selectList() throws Exception {
		
		return cMapper.selectList();
	}
	
	@Override
	//修改商品类别
	public int categoryUpdate(Category category) throws Exception {
		return cMapper.categoryUpdate(category);
	}

	@Override
	public Category getnameByid(Integer id) throws Exception {
		return cMapper.getnameByid(id);
	}

}
