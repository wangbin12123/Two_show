package com.two_shop.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.two_shop.bean.User;
import com.two_shop.service.userService;
import com.two_shop.tools.Constants;

@Controller
public class loginController {

	@Resource
	private userService uService;
	
	//跳转到系统登录页
	@RequestMapping(value="/login.html")
	public String login() {
		return "redirect:categroyPage";
	}
	
	//用户登录
	@RequestMapping(value="/dologin.html",method=RequestMethod.POST)
	public String loginUser(@RequestParam String username ,@RequestParam String password, HttpSession session,HttpServletRequest request) throws Exception {
		User user=uService.Login(username, password);
		if(user!=null) {
			 //登录成功保存用户对象在session中
			 session.setAttribute(Constants.USER_SESSION,user);
			 return "redirect:/success.html";
		}else {
			 //登录失败保存到request中
			 request.setAttribute("error","用户名或密码不正确"); 
			 return "redirect:/login.html";
		 }
	}
	
	//首页显示
	@RequestMapping(value="/success.html")
	public String main(HttpSession session)throws Exception {
		session.getAttribute(Constants.USER_SESSION);
		
			return "redirect:categroyPage";	
	}

	
	
	//从首页跳转到注册页
	@RequestMapping(value="/register.html",method=RequestMethod.GET)
	public String addUser(@ModelAttribute("user") User user) {   //将入参的对象直接传入模型
		return "register";	
	}
	//用户添加
	@RequestMapping(value="/registersave.html",method=RequestMethod.POST)
	public String userAdd(User user) throws Exception {
		if(uService.insert(user)>0) {
			return "redirect:login.html";
		}else {
			return "register";
		}
	}
	
	
	//用户注销
	 @RequestMapping("/logout.do")
	 public String logout(HttpSession session) {
		 //清除Session
		 session.removeAttribute(Constants.USER_SESSION);
		 return "redirect:categroyPage";
	 }
	 //跳转到后台登录
	 @RequestMapping("/bg/login")
	 public String bglogin(){
		 return "login/login";
	 }
	 //实现后台登录
	 @RequestMapping("/bg/islogin")
	 public String islogin(@RequestParam String username ,@RequestParam String password, HttpSession session,HttpServletRequest req )throws Exception{
		 User user=uService.Login(username, password);
		 if(user!=null &&user.getRole_name().equals("卖家")) {
			 session.setAttribute(Constants.USER_SESSION,user);
			 return "frame";
		} else if(user!=null&&(!user.getRole_name().equals("卖家"))){
			req.setAttribute("errors", "权限不足!") ;
			 return "login/login";
		}
		 else {
			 //登录失败保存到request中
			 req.setAttribute("errors","用户名或密码不正确"); 
			 return "login/login";
		 } 
	 }
	 //后台注销
	 @RequestMapping("/bg/logout.do")
	 public String bglogout(HttpSession session) {
		 //清除Session
		 session.removeAttribute(Constants.USER_SESSION);
		 return "login/login";
	 }
}
