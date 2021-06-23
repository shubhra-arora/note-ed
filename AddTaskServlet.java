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
import com.entities.task;

@WebServlet("/add_task")
public class AddTaskServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String task=req.getParameter("task");
		String status=req.getParameter("status");
		
		taskDao dao= new taskDao(DBConnect.getConn());
		boolean f = dao.addtask(task, status);
		HttpSession session = req.getSession();
		
		if(f)
		{
			session.setAttribute("success", "added successfully");
			resp.sendRedirect("task-list.jsp");
		}
		else {
			session.setAttribute("error", "error");
			System.out.println("task-form.jsp");
		}
		
	}
	
}
	


