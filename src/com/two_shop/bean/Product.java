package com.two_shop.bean;

import java.math.BigDecimal;
import java.util.Date;

//商品表
public class Product {

	private Integer id;				//商品id
	private String name; 			//商品名称
	private BigDecimal price; 		//商品价格
	private String img;				//商品图片
	private String pdesc;			//商品描述
	private Integer state;			//商品状态
	private Integer stock;			//商品库存
	private Integer cid;			//类别id
	private Date gmt_create;		//创建时间
	private Date gmt_modified;		//修改时间
	
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
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
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
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", img=" + img + ", pdesc=" + pdesc
				+ ", state=" + state + ", stock=" + stock + ", cid=" + cid + ", gmt_create=" + gmt_create
				+ ", gmt_modified=" + gmt_modified + "]";
	}
	
	
	
	
}
