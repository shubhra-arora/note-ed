package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.User.UserDetails;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String email=request.getParameter("uemail");
		String pass=request.getParameter("upassword");
		
		
		UserDetails us = new UserDetails();
		us.setEmail(email);
		us.setPassword(pass);
		
		UserDAO dao = new UserDAO(DBConnect.getConn());
		boolean f = dao.loginUser(us);
		HttpSession session;
		
		if(f)
		{
			response.sendRedirect("index.jsp");
		}
		else 
		{
			session = request.getSession();
			session.setAttribute("login-failed","Invalid Email and Password");
			response.sendRedirect("login.jsp");
		}
		
		
		
		

	}

}