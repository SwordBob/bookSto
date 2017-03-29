package com.book.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.dao.UserMapper;
import com.book.pojo.User;
@Controller
@RequestMapping(value="user")
public class UserController {
	
	@Autowired
	UserMapper userMapper;
	
	@RequestMapping(value="/login")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		String nameString = (String)request.getParameter("username");
		String password = (String)request.getParameter("password");
		User user=new User();
		user.setUsername(nameString);
		user.setPasswrd(password);
		HttpSession session = request.getSession(true);
		User correctUser= userMapper.login(user);
		if(correctUser!=null) {
			//把这些东西都加到session中去;
			//在session的数据， 在界面中也可以直接通过${}获取到;
			session.setAttribute("name", nameString);
			session.setAttribute("id", correctUser.getUserid());
			if( 1==correctUser.getUserroleid()) {
				session.setAttribute("role", 1 );
			}else{
				session.setAttribute("role", 0);
			}
		}
		return "index";
	}
}
