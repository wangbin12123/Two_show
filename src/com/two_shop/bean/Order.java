package com.two_shop.bean;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

//订单表
public class Order {
	
	private Integer id;    			//订单id
	private BigDecimal sum_price;   //订单总金额
	private Integer address_id;     //订单地址
	private Integer uid;            //用户id 
	private Integer state;          //订单状态
	private Date gmt_create;        //创建时间
	private Date gmt_modified;      //修改时间
	private Address address;		//地址
	private Product product;
	private User user;    
	private Integer product_id;     //订单里面的商品id
	
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	private List<Order_item> orderitem; //订单明细
	public List<Order_item> getOrderitem() {
		return orderitem;
	}
	public void setOrderitem(List<Order_item> orderitem) {
		this.orderitem = orderitem;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public BigDecimal getSum_price() {
		return sum_price;
	}
	public void setSum_price(BigDecimal sum_price) {
		this.sum_price = sum_price;
	}
	public Integer getAddress_id() {
		return address_id;
	}
	public void setAddress_id(Integer address_id) {
		this.address_id = address_id;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Date getGmt_create() {
		return gmt_create;
	}
	public void setGmt_create(Date gmt_create) {
		this.gmt_create = gmt_create;
	}
	public Date getGmt_modified() {
		return gmt_modified;
	}
	public void setGmt_modified(Date gmt_modified) {
		this.gmt_modified = gmt_modified;
	}
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
	
}
