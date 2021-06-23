package com.DAO;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entities.task;

public class taskDao {
	private Connection conn;

	public taskDao(Connection conn) {
		super();
		this.conn = conn;
	}

	
	public boolean addtask(String task, String status)
	{
		boolean f = false;
		try {
			
			String sql="insert into task(task,status) values(?,?)";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, task);
			ps.setString(2, status);
			
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				f=true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public List<task> getTask()
	{
		List<task> list=new ArrayList<task>();
		task t=null;		
		
		try {
			String sql="select * from task";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				t=new task();
				t.setId(rs.getInt(1));
				t.setTask(rs.getString(2));
				t.setStatus(rs.getString(3));
				list.add(t);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public task getTaskById(int id)
	{
		task t = null;
		
		try {
			String sql="select * from task where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				t=new task();
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return t;
	}
public boolean updateTask(task t) {
	boolean f = false;
	try {
		String sql = "update task set task=?, status=? where id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, t.getTask());
		ps.setString(2, t.getStatus());
		ps.setInt(3, t.getId());
		
		int i = ps.executeUpdate();
		if (i == 1) {
			f = true;
		}
		
	}catch (Exception e) {
			e.printStackTrace();
		}
	return f;
	}

public boolean deleteTask(int id) {
	boolean f = false;
	try {
		String sql = "delete from task where id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
		
		int i = ps.executeUpdate();
		if (i == 1) {
			f = true;
		}
		
	}catch (Exception e) {
			e.printStackTrace();
		}
	return f;
	}


}




	