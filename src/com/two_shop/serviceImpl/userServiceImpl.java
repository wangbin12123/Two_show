package com.two_shop.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.two_shop.bean.User;
import com.two_shop.dao.userMapper;
import com.two_shop.service.userService;

@Service
public class userServiceImpl implements userService{
	
	@Resource
	private userMapper uMapper;

	@Override
	//用户登录
	public User Login(String username, String password)throws Exception {
		User user=null;
		user=uMapper.getLoginUser(username);
		if(user!=null) {
			if(!password.equals(user.getPassword())) {
				user=null;
			}
		}
		return user;
	}

	@Override
	//添加用户
	public int insert(User user) throws Exception {
		int count =uMapper.insert(user);
		return count;
	}

	@Override
	//删除用户
	public int delete(Integer id) throws Exception {
		int count =uMapper.delete(id);
		return count;
	}

	@Override
	//更新用户
	public int update(User user) throws Exception {
		int count =uMapper.update(user);
		return count;
	}

	@Override
	//分页显示
	public List<User> userList(String username, Integer id, int currentPage, int pageSize) throws Exception {
		currentPage =(currentPage -1) * pageSize;
		List<User> userList=uMapper.userList(username, id, currentPage, pageSize);
		return userList;
	}

	@Override
	//用户数目
	public int count(String username, Integer id) throws Exception {
		int count =uMapper.count(username, id);
		return count;
	}

	@Override
	//修改密码
	public int pwdUpadte(String password, Integer id) throws Exception {
		int count=uMapper.pwdUpdate(password, id);
		return count;
	}

	@Override
	public User getUserById(Integer id) throws Exception {
		// TODO Auto-generated method stub
		User user = new User();
		user = uMapper.getUserById(id);
		return user;
	}
	
	@Override
	//通过用户ID查地址
	public List<User> userId(Integer id) throws Exception {
		return uMapper.userId(id);
	}
	
}
