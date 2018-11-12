package com.two_shop.controller;



import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.two_shop.bean.Address;
import com.two_shop.bean.Cart;
import com.two_shop.bean.Category;
import com.two_shop.bean.Order;
import com.two_shop.bean.Product;
import com.two_shop.bean.User;
import com.two_shop.service.addressService;
import com.two_shop.service.categoryService;
import com.two_shop.service.productService;
import com.two_shop.service.userService;
import com.two_shop.service.cartService;
import com.two_shop.tools.Constants;
import com.two_shop.tools.PageUtil;


@Controller
public class productController {

	private Logger  log=Logger.getLogger(productController.class);
	@Resource
	private productService pService;
	@Resource
	private userService uService;
	@Resource
	private addressService aService;
	@Resource
	private cartService cartService;
	//商品分页
	@RequestMapping("productList.html")
	public String productPage(Model model,
			@RequestParam(value="name",required=false)String name,
			@RequestParam(value="cid",required=false)Integer cid,
			@RequestParam(value="currentPage",required=false)Integer currentPage)throws Exception {
			
		List<Product> list=null;
		//总数量
		System.err.println(name);
		int totalCount=pService.count(name, cid);
		
		Integer allPage=new PageUtil().getAllPage(totalCount);
		List list2=null;//页眉集合
		//注释upPage代表前几页,nextPage代表 后几页
		if(currentPage==null){
			currentPage=1;
		}
		list2=new PageUtil().confirmPage(allPage, currentPage);
		list=pService.productPage(name, cid, currentPage,PageUtil.pageSize+10);
		model.addAttribute("productList",list);
		model.addAttribute("name",name);
		model.addAttribute("cid",cid);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("allPage",allPage);
		return "productList";
	}
	
	//根据id查询商品
	@RequestMapping(value="goodsinfo.html",method=RequestMethod.GET)
	public String productById(Model model,@RequestParam String id) throws Exception {
		Product product=pService.getProductById(id);
		model.addAttribute(product);
		
		return "goodsinfo";
	}
	
	//商品详情跳转结算页面
	@RequestMapping(value="/product/jiesuan.html",method=RequestMethod.GET)
	public String jiesuan(Model model,@RequestParam String id,@RequestParam String countId,HttpSession session) throws Exception {
		Product product=pService.getProductById(id);
		Integer countid = Integer.parseInt(countId);
		Integer id2=((User)session.getAttribute(Constants.USER_SESSION)).getId();
		List<Address> aList=aService.selectByUid(id2);
		System.err.println("地址："+aList.size());
		model.addAttribute("usertt", aList);
		model.addAttribute("product",product);
		model.addAttribute("count",countid);
		return "jiesuan";
	}
	
	//商品详情跳转购物车页面
	@RequestMapping(value="/product/gouwu.html",method=RequestMethod.GET)
	public String gouwu(Model model,@RequestParam String id,@RequestParam String countId,HttpSession session)throws Exception {
		Integer countNum = Integer.parseInt(countId);
		Product product = pService.getProductById(id);
//	Integer ppid = Integer.parseInt(id);
		//Cart cart = new Cart();
//		Integer uuid=((User)session.getAttribute(Constants.USER_SESSION)).getId();
//		cart.setUser_id(uuid);
//		cart.setProduct_id(ppid);
//		cart.setQuantity(countNum);
//		cart.setGmt_create(new Date());
//	cartService.cartAdd(cart);
		session.setAttribute("product", product);
		model.addAttribute("countNum", countNum);
		return "cart";
	}
	
	
	
	//查询所有订单
//	@RequestMapping(value="cclist.html")
//	public String orderDetail(Model model,HttpSession session) throws Exception {
//		Integer uid=((User)session.getAttribute(Constants.USER_SESSION)).getId();
//		List<Cart> cartlist=cartService.cartList(uid);
//		model.addAttribute("ccc",cartlist);
//		return "cart";
//	}
	
	
	//跳转的商品添加页
	@RequestMapping(value="productadd.html")
	public String productadd() {
		return "product/productadd";
	}
	
	//添加商品
//	@RequestMapping(value="productAdd.html",method=RequestMethod.POST)
//	public String productAdd(@RequestParam Product product) throws Exception {
//		int count=pService.productAdd(product);
//		if(count>0) {
//			return "productList";
//		}else {
//			return "productAdd";
//		}
//	}
	
	
	
	//添加商品
		@RequestMapping(value="/product/provideraddsave.html",method=RequestMethod.POST)
		public String productAdd(Product product,HttpSession session,HttpServletRequest request,
				@RequestParam(value="a_img",required=false)MultipartFile attch) throws Exception{
			String img=null;
			//判断文件是否为空
			if(!attch.isEmpty()){
				String path=request.getSession().getServletContext().getRealPath("statics"+File.separator+"uploadfiles");
				System.err.println(path);
				String oldFileName=attch.getOriginalFilename();//原文件名
				String prefix=FilenameUtils.getExtension(oldFileName);//原文件名的后缀
				int filesize=5000000;//文件大小的上限
				if(attch.getSize()>filesize){
					request.setAttribute("uploadError","上传文件大小不得超过500k");
					return "product/productadd";
				}else{
					if(prefix.equalsIgnoreCase("jpg")
					||prefix.equalsIgnoreCase("png")
					||prefix.equalsIgnoreCase("gif")){
						String fileName=System.currentTimeMillis()+RandomUtils.nextInt(1000000)+"_Personal.jpg";
					
						File targetFile=new File(path,fileName);
						if(!targetFile.exists()){
							targetFile.mkdirs();
						}
						//保存
						try{
							attch.transferTo(targetFile);
						}catch(Exception e){
							e.printStackTrace();
							request.setAttribute("uploadError","上传文件失败");
							return "product/productadd";
						}
						img=path.substring(path.lastIndexOf("\\")-8)+File.separator+fileName;
					}else{ //文件格式不正确
						request.setAttribute("uploadError","上传文件的格式不正确");
						return "product/productadd";
					}
				}
			}
			product.setState(1);
			product.setGmt_create(new Date());
			product.setImg(img);
			int flag=pService.productAdd(product);
			if(flag>0){
				return "redirect:/productList1.html";
			}
			return "product/productadd";
			
		}
	
	
	
	//商品库存
	@RequestMapping(value="productStock.html",method=RequestMethod.GET)
	public String productStock(Model model)throws Exception{
		List<Product> product = pService.getStock();
		model.addAttribute(product);
		return "productView";
	}
	
	
	
//	//查询商品数量
//	@RequestMapping("/a1.html")
//	public String productNum(Model model)throws Exception{
//		List<Product> product1 =pService.getNum();
//		model.addAttribute(product1);
//		return "index";
//	}
	
	
	//后台:修改商品
		@RequestMapping(value="productUpdate.html",method=RequestMethod.POST)
		public String productUpdate(Product product,HttpSession session,HttpServletRequest request,
				@RequestParam(value="a_img",required=false)MultipartFile attch) throws Exception {
			String img=null;
			//判断文件是否为空
			if(!attch.isEmpty()){
				String path=request.getSession().getServletContext().getRealPath("statics"+File.separator+"uploadfiles");
				String oldFileName=attch.getOriginalFilename();//原文件名
				String prefix=FilenameUtils.getExtension(oldFileName);//原文件名的后缀
				int filesize=5000000;//文件大小的上限
				if(attch.getSize()>filesize){
					request.setAttribute("uploadError","上传文件大小不得超过500k");
					return "product/productadd";
				}else{
					if(prefix.equalsIgnoreCase("jpg")
					||prefix.equalsIgnoreCase("png")
					||prefix.equalsIgnoreCase("gif")){
						String fileName=System.currentTimeMillis()+RandomUtils.nextInt(1000000)+"_Personal.jpg";
					
						File targetFile=new File(path,fileName);
						if(!targetFile.exists()){
							targetFile.mkdirs();
						}
						//保存
						try{
							attch.transferTo(targetFile);
						}catch(Exception e){
							e.printStackTrace();
							request.setAttribute("uploadError","上传文件失败");
							return "product/productadd";
						}
						img=path.substring(path.lastIndexOf("\\")-8)+File.separator+fileName;
					}else{ //文件格式不正确
						request.setAttribute("uploadError","上传文件的格式不正确");
						return "product/productadd";
					}
				}
			}

				 product.setGmt_modified(new Date());;
				 product.setImg(img);
				 if(pService.productUpdate(product)>0) {
					 return "redirect:/productList1.html";
				 }else {
					 return "product/productmodify";
				 }
			 
			 
		 }
		
		//后台:查看商品信息
		@RequestMapping(value="/bg/view.html",method=RequestMethod.GET)
		public String productById1(Model model,@RequestParam String id) throws Exception {
			Product product=pService.getProductById(id);
			model.addAttribute(product);
			return "product/productview";
		}
	   //后台：跳转到修改页面
		@RequestMapping(value="/bg/modify.html",method=RequestMethod.GET)
		public String modify(Model model,@RequestParam String id) throws Exception {
			Product product=pService.getProductById(id);
			model.addAttribute(product);
			return "product/productmodify";
		}
	//后台:删除商品
		@RequestMapping(value="/productDelete",method=RequestMethod.GET)
		@ResponseBody
		public String productDelete(@RequestParam int id)throws Exception{
			HashMap<String,Boolean> result=new HashMap<>();
			if(pService.productDelete(id)>0) {
				result.put("delResult",true);
			}else {
				result.put("delResult",false);
			}
			System.out.println(JSONArray.toJSONString(result));
			return JSONArray.toJSONString(result);
		}
		//后台商品分页
		@RequestMapping("/productList1.html")
		public String productPage1(Model model,
				@RequestParam(value="name",required=false)String name,
				@RequestParam(value="cid",required=false)Integer cid,
				@RequestParam(value="currentPage",required=false)Integer currentPage)throws Exception {
				
			List<Product> list=null;
			//总数量
			System.err.println(name);
			int totalCount=pService.count(name, cid);
			
			Integer allPage=new PageUtil().getAllPage(totalCount);
			List list2=null;//页眉集合
			//注释upPage代表前几页,nextPage代表 后几页
			if(currentPage==null){
				currentPage=1;
			}
			list2=new PageUtil().confirmPage(allPage, currentPage);
			list=pService.productPage(name, cid, currentPage,PageUtil.pageSize);
			model.addAttribute("productList",list);
			model.addAttribute("name",name);
			model.addAttribute("cid",cid);
			model.addAttribute("currentPage",currentPage);
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("allPage",allPage);
			model.addAttribute("yeMeiList",list2);
			return "product/productlist";
		}
}