package com.two_shop.tools;

import java.util.ArrayList;
import java.util.List;

public class PageUtil {
	public static final Integer pageSize=3;
	public static final Integer yemei=6;
	//前几页返回当前currentPage
	public  Integer previewPage(Integer currentPage){
		
		if(currentPage-yemei<=0){
			currentPage=1;
		}else{
			currentPage=currentPage-yemei;
		}
		return currentPage;
	}
	
	
	
	//从 from下标开始
	public Integer getFrom(Integer currentPage){
		return (currentPage-1)*pageSize;
	}
	
	
	//根据总数量计算出总页数
	public  Integer getAllPage(Integer count){
		Integer allPage=null;
		if(count%pageSize!=0){
			allPage=count/pageSize+1;
		}else{
			allPage=count/pageSize;
		}
		
		return allPage;
		
	}
	
	
	//判断当前的页眉数是否是奇数
	public Integer returnYemei(Integer yemei){
		
		if(yemei%2!=0){
			yemei=yemei/2+1;
		}else{
			yemei=yemei/2;
		}
		
		return yemei;
	}
	
	//当直接点击页面的页数
	
	public List<Integer> confirmPage(Integer sum,Integer currentPage){
		//sum总页数
		List<Integer> list=new ArrayList();
		Integer start=null;
		Integer end=null;
		Integer ban=yemei/2;
		if(sum<=yemei){//如果连每页分的页数都不够
			start=1;
			end=sum;
		}else{
			if(currentPage>ban){//当前页数大于页眉分页的一半
				if(currentPage>(sum-returnYemei(yemei)+1)){//当是最后sum-ban+1页
					/**
					 * 
					 * 最后推论:**************************************remenber!!!!!!!!!！！
					 * 除掉自己当前本身的数量
					 * 此时判断出当前页数后面的数量小于yemei/2-1   {注意如果页眉是奇数则需要对其加1在/2-1[因为都是包括了本身]}
					 * 公式:(allPage【总页数】-currentPage【当前页数】)<yemei/2-1变换公司可得currentPage>allPage-yemei/2+1
					 *
					 *开始的页数:start=currentPage-(yemei-(allPage-currentPage)-1);
					 *解释:b=allPage-currentPage代表当前页数后面还有多少页 yemei-b-1代表除掉当前页数再向前前进页眉减去已有的页数
					 *结束页数: end=currentPage+(allPage-currentPage);
					 *
					 **/
					start=currentPage-(yemei-(sum-currentPage)-1);
					end=currentPage+(sum-currentPage);
					
				}else{
				start=currentPage-ban;
				end=start+yemei-1;
				}
				
			}else{
				start=1;
				end=yemei;
			}
		}
		
		
		for(int i=start;i<=end;i++){
			if(i<=(sum)){
				list.add(i);//把每大页全部添加进去
			}
			
			System.out.println(i+"--");
		}
		
		System.out.println(list.size()+"长度");
		return list;
		
	
	}

}
