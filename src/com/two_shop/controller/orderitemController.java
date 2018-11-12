package com.two_shop.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.two_shop.bean.Order_item;
import com.two_shop.service.orderItemlService;
import com.two_shop.tools.PageUtil;

@Controller
@RequestMapping("/orderitem")
public class orderitemController {

	@Resource
	private orderItemlService oitemService;
	
	//分页显示订单明细
	@RequestMapping("orderitemPage")
	public String orderitemPage(Model model,
			@RequestParam(value="oid",required=false) Integer oid,
			@RequestParam(value="currentPage",required=false)Integer currentPage)throws Exception{
		//总数量
		int totalCount=oitemService.count(oid);
		Integer allPage=new PageUtil().getAllPage(totalCount);
		if(currentPage==null){
			currentPage=1;
		}
		
		List<Order_item> list=oitemService.orderById(oid, currentPage, PageUtil.pageSize);
		//页眉集合
		List list2=new PageUtil().confirmPage(allPage, currentPage);
		model.addAttribute("orderitemList",list);
		model.addAttribute("oid",oid);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("allPage",allPage);
		
		return "orderitemList";
	}
}
