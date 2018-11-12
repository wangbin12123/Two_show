package com.two_shop.bean;

import java.util.List;

//商品类别表
public class Category {
	private Integer id; 	//商品类别Id
	private String name;    //商品类别名称
	private List<Product> product;//商品类
	
	public List<Product> getProduct() {
		return product;
	}
	public void setProduct(List<Product> product) {
		this.product = product;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", product=" + product + "]";
	}
	
	
	
}
