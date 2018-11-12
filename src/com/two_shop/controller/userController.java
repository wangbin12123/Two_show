package com.two_shop.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.mysql.jdbc.StringUtils;
import com.two_shop.bean.User;
import com.two_shop.service.userService;
import com.two_shop.tools.Constants;
import com.two_shop.tools.PageUtil;

@Controller
@RequestMapping("/user")
public class userController {

	@Resource
	private userService uService;
	
	
	 
		 
	//用户添加
	@RequestMapping(value="/user/registersave.html",method=RequestMethod.POST)
	public String userAdd(User user) throws Exception {
		if(uService.insert(user)>0) {
			return "redirect:login.html";
		}else {
			return "register";
		}
	}
	
	
	//更新用户
	@RequestMapping(value="/usermodifys.html",method=RequestMethod.POST)
	public Object update(User user, HttpSession session)throws Exception{
		user.setGmt_modified(new Date());
			uService.update(user);
			return "userview";
	}
	
	
	//用户删除
	@RequestMapping(value="/delete",method=RequestMethod.GET)
    @ResponseBody
	public Object delete(@RequestParam Integer id) throws Exception {
		HashMap<String,String> result=new HashMap<>();
		if(uService.delete(id)>0) {
			result.put("","true");
		}else {
			result.put("","false");
		}
		return JSONArray.toJSONString(result);
		
	}
	
	 
	//修改密码的页面跳转
	@RequestMapping(value="/modifyPWD.html",method=RequestMethod.GET)
	public String getUserById2(HttpSession session) {
		return "usermodifyPWD";
	}
	 
	//验证
	@RequestMapping(value="/pdexist")
	@ResponseBody  //异步
	public Object userPasswordIsExist(HttpSession session,@RequestParam String userPassword) {
		//userPassword = ((User) session.getAttribute("userSession")).getUserPassword();
		HashMap<String,String> result = new HashMap<String,String>();
		
		String pwd=((User)session.getAttribute(Constants.USER_SESSION)).getPassword();
		if(pwd.equals(userPassword)) {
			 result.put("userPassword","yesexist");
		 }else {
			 result.put("userPassword","noexist");
		 }
	
		return JSONArray.toJSONString(result);
	}
		
	 //用户修改密码
	 @RequestMapping("/modifyPWDS.html")
	 public Object pwdYesIsExist(@RequestParam String rePassword,HttpSession session) throws Exception {
		 User user = ((User)session.getAttribute(Constants.USER_SESSION));
		 user.setPassword(rePassword);
		 int count =uService.update(user);
		 if(count>0) {
			session.setAttribute(Constants.USER_SESSION,null);
			 return "index";
		 }else {
			 return "usermodifyPWD";
		 }
	 }
	//用于id用户的显示
	@RequestMapping("/view.html")
	public Object view(HttpSession session,Model model)throws Exception {    
		Integer id=((User)session.getAttribute(Constants.USER_SESSION)).getId();
		User user = uService.getUserById(id);
		model.addAttribute("user",user);
			return "userview";
	
	}
	 
	//分页显示
	 @RequestMapping("userList.html")
	 public String userPage(Model model,
			 @RequestParam(value="username",required=false)String username,
			 @RequestParam(value="id",required=false)Integer id,
			 @RequestParam(value="currentPage",required=false) Integer currentPage) throws Exception {
		
	 	List<User> list=null;
		//总数量
		int totalCount=uService.count(username, id);
		Integer allPage=new PageUtil().getAllPage(totalCount);
		List list2=null;//页眉集合
		//注释upPage代表前几页,nextPage代表 后几页
		if(currentPage==null){
			currentPage=1;
		}
		list2=new PageUtil().confirmPage(allPage, currentPage);
		list=uService.userList(username, id,currentPage,PageUtil.pageSize);
		model.addAttribute("userList",list);
		model.addAttribute("username",username);
		model.addAttribute("id",id);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("allPage",allPage);
		
		return "userPage"; 
	 }
	 
	 
	//通过用户ID查地址
	 @RequestMapping("userId.html")
	 public String userId(Integer id,HttpSession session)throws Exception {
		 List<User> ulist=uService.userId(id);
		session.setAttribute("ulist",ulist);
		System.out.println(ulist.size());
		return "";
		 
	 }
		 
}
