package com.two_shop.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.two_shop.bean.Product;
import com.two_shop.dao.productMapper;
import com.two_shop.service.productService;

@Service
public class productServiceImpl implements productService{

	@Resource
	private productMapper pMapper;

	@Override
	//商品分页显示
	public List<Product> productPage(String name, Integer cid, int currentPage, int pageSize) throws Exception {
		currentPage=(currentPage-1)*pageSize;
		List<Product> pList=pMapper.productPage(name, cid, currentPage, pageSize);
		return pList;
	}

	@Override
	//根据id查询
	public Product getProductById(String id) throws Exception {
		Product product=pMapper.getProductById(id);
		return product;
	}

	@Override
	//查询商品数目
	public int count(String name, Integer cid) throws Exception {
		int count=pMapper.count(name, cid);
		return count;
	}

	@Override
	//添加商品
	public int productAdd(Product product) throws Exception {
		int count=pMapper.productAdd(product);
		return count;
	}

	@Override
	//删除商品
	public int productDelete(Integer id) throws Exception {
		int count=pMapper.productDelete(id);
		return count;
	}

	@Override
	//修改商品
	public int productUpdate(Product product) throws Exception {
		int count=pMapper.productUpdate(product);
		return count;
	}
	
	@Override
	//商品库存
	public List<Product> getStock() throws Exception {
		return pMapper.getStock();
	}

	@Override
	//查询商品价格
	public List<Product> getPrice() throws Exception {
		return pMapper.getPrice();
	}

	@Override
	//查询商品更新时间
	public List<Product> getTime() throws Exception {
		return pMapper.getTime();
	}

	@Override
	//查询商品数量
	public List<Product> getNum() throws Exception {
		return pMapper.getNum();
	}
	
}
