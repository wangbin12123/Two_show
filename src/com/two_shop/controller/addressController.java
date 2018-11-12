package com.two_shop.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.sun.net.httpserver.HttpServer;
import com.two_shop.bean.Address;
import com.two_shop.bean.User;
import com.two_shop.service.addressService;
import com.two_shop.service.userService;
import com.two_shop.tools.Constants;

@Controller
public class addressController {

	@Resource
	private addressService aService;
	@Resource
	private userService uService;
	//查询地址
	@RequestMapping(value="selectAddress",method=RequestMethod.GET)
	public String selectById(@RequestParam String id,Model model) throws Exception {
		Address address=aService.selectById(id);
		model.addAttribute("address",address);
		return "addressList";
	}
	
	//添加地址
	@RequestMapping(value="addAddress.html",method=RequestMethod.POST)
	public String Insert(Address address,HttpSession session,@RequestParam("pid") Integer pid,@RequestParam("cuu") Integer cuu) throws Exception {
		 Integer aid = ((User)session.getAttribute(Constants.USER_SESSION)).getId();
		 address.setUid(aid);
		 aService.addressAdd(address);
		 return "redirect:/product/jiesuan.html?id="+pid+"&countId="+cuu;
	}
	
	//删除地址
	@RequestMapping(value="deleteAddress",method=RequestMethod.GET)
	@ResponseBody
	public String Delete(@RequestParam Integer id) throws Exception {
		HashMap<String,String> result=new HashMap<>();
		int count =aService.addressDelete(id);
		if(count>0) {
			result.put("","");
		}else {
			result.put("","");
		}
		return JSONArray.toJSONString(result);	
	}
	
	//修改地址
	@RequestMapping(value="updateAddress.html",method=RequestMethod.POST)
	public String Update(Address address,HttpSession session,@RequestParam("pid") Integer pid,@RequestParam("cu") Integer cu)throws Exception{
		aService.addressUpdate(address);
		return "redirect:/product/jiesuan.html?id="+pid+"&countId="+cu;
	}
}
