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


@WebServlet("/update")
public class UpdateTaskServlet extends HttpServlet {
		
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException
	{
		int id = Integer.parseInt(req.getParameter("id"));
		String task = req.getParameter("task");
		String status = req.getParameter("status");
		
		taskDao dao = new taskDao(DBConnect.getConn());
		
		task t=new task();
		t.setId(id);
		t.setTask(task);
		t.setStatus(status);
		
		boolean f = dao.updateTask(t);
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("sucMsg",  "Task Updated Successfully");;
			resp.sendRedirect("task-list.jsp");
		}else {
			session.setAttribute("failedMsg" , "Something wrong on server");
			System.out.println("task-form.jsp");
					
		}
		
	}
}