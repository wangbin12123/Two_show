package com.two_shop.bean;

import java.util.Date;

public class Cart {
	private Integer user_id;
	private Integer product_id;
	private Integer quantity;
	private Date gmt_create;
	private Date gmt_modified;
	private Product product;
	private User user;
	
	public Product getProduct() {
		return product;
	}
	public User getUser() {
		return user;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public Integer getProduct_id() {
		return product_id;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Date getGmt_create() {
		return gmt_create;
	}
	public Date getGmt_modified() {
		return gmt_modified;
	}
	public void setGmt_create(Date gmt_create) {
		this.gmt_create = gmt_create;
	}
	public void setGmt_modified(Date gmt_modified) {
		this.gmt_modified = gmt_modified;
	}
	@Override
	public String toString() {
		return "Cart [user_id=" + user_id + ", product_id=" + product_id + ", quantity=" + quantity + ", gmt_create="
				+ gmt_create + ", gmt_modified=" + gmt_modified + "]";
	}
	
	
}
