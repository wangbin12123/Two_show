package com.two_shop.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.two_shop.bean.Address;
import com.two_shop.bean.Order;
import com.two_shop.bean.Product;
import com.two_shop.bean.User;
import com.two_shop.service.addressService;
import com.two_shop.service.orderService;
import com.two_shop.service.productService;
import com.two_shop.tools.Constants;
import com.two_shop.tools.PageUtil;

@Controller
public class orderController {

	@Resource
	private orderService oService;
	
	@Resource
	private productService pService;
	@Resource
	private addressService aService;
	
//	//分页查询订单
//	@RequestMapping("/orderPage")
//	public String orderPage(Model model,
//			@RequestParam(value="uid",required=false) Integer uid,
//			@RequestParam(value="state",required=false) Integer state,
//			@RequestParam(value="currentPage",required=false)Integer currentPage) throws Exception {
//		//总数量
//		int totalCount=oService.count(uid);
//		Integer allPage=new PageUtil().getAllPage(totalCount);
//		if(currentPage==null){
//			currentPage=1;
//		}
//		
//		List<Order> list=oService.orderById(uid,currentPage,PageUtil.pageSize,state);
//		//页眉集合
//		List list2=new PageUtil().confirmPage(allPage, currentPage);
//		model.addAttribute("orderList",list);
//		model.addAttribute("uid",uid);
//		model.addAttribute("currentPage",currentPage);
//		model.addAttribute("totalCount", totalCount);
//		model.addAttribute("allPage",allPage);
//		
//		return "orderList";
//	}
//	
	//确认购买时下个订单
	@RequestMapping(value="orderadd.html")
	public String orderadd(@RequestParam String productId,@RequestParam String addressId,@RequestParam String AllPrice,HttpSession session)throws Exception {
		Order order = new Order();
		Product product=pService.getProductById(productId);
	//	product.setStock(product.getStock()-1);
		BigDecimal allPrice=new BigDecimal(AllPrice);
		
		order.setSum_price(allPrice);
		order.setGmt_create(new Date());
		order.setAddress_id(Integer.valueOf(addressId));
		order.setProduct_id(Integer.parseInt(productId));
		Integer uid=((User)session.getAttribute(Constants.USER_SESSION)).getId();
		order.setUid(uid);
		int count = oService.addOrder(order);
		Integer oid=order.getId();
		session.setAttribute("productSession",product);
		System.err.println("------------------------------------->"+oid);
		if(count>0) {
			return "redirect:/orderfin.html?id="+oid;
		}else {
			return "jiesuan";
		}
	}
	
	
	//订单完成时的页面
	@RequestMapping(value="orderfin.html")
	public String orderfin(Model model,HttpSession session,@RequestParam Integer id) throws Exception {
		Order order=oService.findOrder(id);
		model.addAttribute("order",order);
		return "orderfin";
	}
	
	
	
	//查询所有订单
	@RequestMapping(value="/order/orderdetail.html")
	public String orderDetail(Model model,HttpSession session,
			@RequestParam(value="state",required=false) Integer state,
			@RequestParam(value="currentPage",required=false)Integer currentPage) throws Exception {
		Integer uid=((User)session.getAttribute(Constants.USER_SESSION)).getId();
		//总数量
		
		int totalCount=oService.count(uid,state);
		Integer allPage=new PageUtil().getAllPage(totalCount);
		if(currentPage==null){
			currentPage=1;
		}
		
		List<Order> list=oService.orderById(uid,state,currentPage,PageUtil.pageSize);
		//页眉集合
		List list2=new PageUtil().confirmPage(allPage, currentPage);
		 
		model.addAttribute("orderList",list);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("allPage",allPage);
		model.addAttribute("yeMeiList",list2);
		model.addAttribute("t1",oService.count(uid, 1));
		model.addAttribute("t2",oService.count(uid, 2));
		return "orderdetail";
	}
	
	
	//删除订单
	@RequestMapping(value="/order/deleteOrder.html")
	public String orderDelete(Integer id,HttpSession session) throws Exception {
		oService.deleteOrder(id);
		return "redirect:/order/orderdetail.html";
	}
}
