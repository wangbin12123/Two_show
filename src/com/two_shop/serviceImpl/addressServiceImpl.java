package com.two_shop.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.two_shop.bean.Address;
import com.two_shop.dao.addressMapper;
import com.two_shop.service.addressService;

@Service
public class addressServiceImpl implements addressService{

	@Resource
	private addressMapper aMapper;
	
	@Override
	//查询地址
	public Address selectById(String id) throws Exception {
		Address address = aMapper.selectById(id);  
		return address;
	}

	@Override
	//添加地址
	public int addressAdd(Address address) throws Exception {
		int count = aMapper.addressAdd(address);
		return count;
	}

	@Override
	//删除地址
	public int addressDelete(Integer id) throws Exception {
		int count = aMapper.addressDelete(id);
		return count;
	}

	@Override
	//修改地址
	public int addressUpdate(Address address) throws Exception {
		int count = aMapper.addressUpdate(address);
		return count;
	}

	@Override
	public List<Address> selectByUid(Integer uid) throws Exception {
			List<Address> list=aMapper.selectByUid(uid);
			System.err.println(list.size());
		return list;
	}
	
}
