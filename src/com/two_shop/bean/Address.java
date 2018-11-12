package com.two_shop.bean;

//地址表
public class Address {
	
	private Integer id;         //地址id
	private String province;    //省份
	private String city;        //市
	private String county;      //县
	private String aname;       //地址名字
	private String atel;		//地址电话
	

	private String detailed;    //详细地址
	private Integer uid;        //用户id
	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}


	public String getDetailed() {
		return detailed;
	}

	public void setDetailed(String detailed) {
		this.detailed = detailed;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	public String getAname() {
		return aname;
	}

	public String getAtel() {
		return atel;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public void setAtel(String atel) {
		this.atel = atel;
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", province=" + province + ", city=" + city + ", county=" + county + ", aname="
				+ aname + ", atel=" + atel + ", detailed=" + detailed + ", uid=" + uid + "]";
	}

	
}
