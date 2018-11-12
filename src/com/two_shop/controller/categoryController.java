package com.two_shop.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.two_shop.bean.Category;
import com.two_shop.bean.Product;
import com.two_shop.service.categoryService;
import com.two_shop.service.productService;
import com.two_shop.tools.PageUtil;

@Controller
public class categoryController {

	@Resource
	private categoryService cService;
	@Resource
	private productService pService;
	
	//分页查询
	@RequestMapping("/categroyPage")
	public String categroyPage(Model model,
			@RequestParam(value="id",required=false) Integer id,
			@RequestParam(value="name",required=false)String name,
			@RequestParam(value="currentPage",required=false)Integer currentPage)throws Exception{
			
		//总数量
		int totalCount=cService.count(id, name);
		Integer allPage=new PageUtil().getAllPage(totalCount);
		if(currentPage==null){
			currentPage=1;
		}
		
		List<Category> list=cService.selectPage(id, name, currentPage,20);
		//页眉集合
		List list2=new PageUtil().confirmPage(allPage, currentPage);
		List<Product> product1 =pService.getNum();
		list.forEach(v->{
			System.err.println(v);
		});
		model.addAttribute("product1",product1);
		List<Product> product2 =pService.getPrice();
		model.addAttribute("product2",product2);
		List<Product> product3 =pService.getTime();
		model.addAttribute("product3",product3);
		model.addAttribute("clist",list);
		model.addAttribute("name",name);
		model.addAttribute("id",id);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("allPage",allPage);
		
		return "index";
	}
	//显示商品类别
		@RequestMapping("/aaa")
		public Object selectList(HttpSession session)throws Exception{
			List<Category> category=cService.selectList();
			session.setAttribute("clist",category);
			return "category/categoryList";
		}
	
	
	
	//一对多查询商品
	@RequestMapping("/categroyPage.html")
	public String categoryList(@RequestParam String name,HttpSession session)throws Exception{
		List<Category> categoryList=cService.categoryList(name);
		categoryList.forEach(v->{
			System.out.println(v.toString());
		});
		session.setAttribute("testt", categoryList);
		
		return "sortgoods";
	}
	//后台:显示商品类别
		@RequestMapping("/aaa2")
		@ResponseBody
		public Object selectList2() throws Exception{
			return cService.selectList();
		}
		
		//后台:跳转修改商品类别
		@RequestMapping("/bg/cview")
		public String Update (@RequestParam Integer id,Model model) throws Exception{
			Category c=cService.getnameByid(id);
			model.addAttribute("c",c);
			return "category/categoryModify";
		}
		//后台:修改商品类别
		@RequestMapping("/categoryUpdate")
		public String categoryUpdate(Category category) throws Exception{
			 cService.categoryUpdate(category);
			return "redirect:/aaa";
		}
		//后台:删除商品类别
			@RequestMapping(value="/delete",method=RequestMethod.GET)
			@ResponseBody
			public String delete(@RequestParam Integer id) throws Exception {
				HashMap<String,String> result=new HashMap<>();
				
					int count=cService.categoryDelete(id);
					if(count>0) {
						result.put("delResult","ture");
					}else {
						result.put("delResult","false");
					}
				
				return JSONArray.toJSONString(result);
			}
			//后台:跳转添加页面
			@RequestMapping(value="/categoryAdd.html")
			public String add(){
				return "category/categoryAdd";
			}
			//后台:添加商品类别
			@RequestMapping(value="/categoryAddSave.html")
			public String categoryAdd(Category category) throws Exception {
				int count = cService.categoryAdd(category);
					return "redirect:/aaa";	
			}
}
