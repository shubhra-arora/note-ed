package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.taskDao;
import com.Db.DBConnect;

@WebServlet("/delete")
public class TaskDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int id=Integer.parseInt(req.getParameter("id"));
	
	taskDao dao= new taskDao(DBConnect.getConn());
	boolean f = dao.deleteTask(id);
	HttpSession session = req.getSession();
	if(f)
	{
		session.setAttribute("success", "deleted successfully");
		resp.sendRedirect("task-list.jsp");
	}
	else {
		session.setAttribute("error", "error");
		System.out.println("task-list.jsp");
	}
	
}
}
