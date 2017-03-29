package com.book.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.Time;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.book.dao.BookStoreMapper;
import com.book.dao.UserMapper;
import com.book.pojo.BookStore;
import com.book.pojo.User;
@Controller
@RequestMapping(value="bookStore")
public class BookStoreController {
		
		@Autowired
		BookStoreMapper bookStoreMapper;
		
		@Autowired
		UserMapper userMapper;
		
		@RequestMapping(value="getBooks")
		@ResponseBody
		public List<BookStore> getBooks() {
			//@ResponseBodyָ�����󷵻������Ƿ����еĽ������ָ����Ĭ����NewFile.jsp,�Ҳ����򱨴�
			//System.out.println("3");
			//BookStore bookStore=bookStoreMapper.selectByPrimaryKey("3");
			List<BookStore> bookStores=bookStoreMapper.selectAll();
    		//System.out.println(bookStores.size());
    		return bookStores;
		}
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
				//����Щ�������ӵ�session��ȥ;
				//��session�����ݣ� �ڽ�����Ҳ����ֱ��ͨ��${}��ȡ��;
				session.setAttribute("name", nameString);
				session.setAttribute("id", correctUser.getUserid());
				if( 1==correctUser.getUserroleid()) {
					session.setAttribute("role", 1 );
				}else{
					session.setAttribute("role", 0);
				}
			}
			return "login";
		}
		
		
		@RequestMapping(value="/index")
		public String index() {
			return "index";
		}


		@RequestMapping(value="addBook")
		@ResponseBody
		public int addBook(HttpServletRequest request, HttpServletResponse response) {
			SimpleDateFormat myFmt=new SimpleDateFormat("yyyyMMddHHmmss");
			String bookname = (String)request.getParameter("bookname");
			String author = (String)request.getParameter("author");
			BookStore book=new BookStore();
			book.setBookid(myFmt.format(new Date()));
			book.setAuthor(author);
			book.setBookname(bookname);
			book.setPublishdate(new Date());
			return bookStoreMapper.insert(book);
		}
		/*
		@RequestMapping(value="delType", method=RequestMethod.POST)
		@ResponseBody
		public boolean delType(HttpServletRequest request, HttpServletResponse response) {
			String id = request.getParameter("id");
			return adminDao.delType(id);
		}
		

		@RequestMapping(value="addPro", method=RequestMethod.POST)
		@ResponseBody
		public boolean addPro(HttpServletRequest request, HttpServletResponse response) {
			//String name, String depict, int price, int amount, String manufacturer, String img, String type
			String name = request.getParameter("name");
			String depict = request.getParameter("depict");
			int price = Integer.parseInt( request.getParameter("price") );
			int amount = Integer.parseInt( request.getParameter("amount") );
			String manufacturerString = request.getParameter("manufacturer");
			String img = request.getParameter("img");
			String type = request.getParameter("type");
			
			return adminDao.addPro( name,  depict,  price,  amount,  manufacturerString,  img,  type);
		}
		
		@RequestMapping(value="delPro", method=RequestMethod.POST)
		@ResponseBody
		public boolean delPro(HttpServletRequest request, HttpServletResponse response) {
			//String name, String depict, int price, int amount, String manufacturer, String img, String type
			int id = Integer.parseInt(request.getParameter("id") );
			return adminDao.delPro( id );
		}
		
		@RequestMapping(value="getAllCom", method=RequestMethod.POST)
		@ResponseBody
		public JSONArray getAllCom(HttpServletRequest request, HttpServletResponse response) {
			return JSONArray.fromObject( adminDao.getAllCom( ) );
		}
		
		@RequestMapping(value="getComByType", method=RequestMethod.POST)
		@ResponseBody
		public JSONArray getComByType(HttpServletRequest request, HttpServletResponse response) {
			String type = request.getParameter("type");
			return JSONArray.fromObject( adminDao.getComByType( type ) );
		}


		@RequestMapping(value="getComments", method=RequestMethod.POST)
		@ResponseBody
		public JSONArray getComments(HttpServletRequest request, HttpServletResponse response) {
			return JSONArray.fromObject( commentDao.getComments( ) );
		}
		@RequestMapping(value="getCommentById", method=RequestMethod.POST)
		@ResponseBody
		public JSONArray getCommentById(HttpServletRequest request, HttpServletResponse response) {
			String commodityId = request.getParameter("commodityId");
			return JSONArray.fromObject( commentDao.getCommentById( Integer.parseInt(commodityId) ) );
		}
		*/
	

}
