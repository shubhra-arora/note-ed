package com.entities;

public class task {
	private int id;
	private String task;
	private String status;
	public int getId() 
	{
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Entity [id=" + id + ", task=" + task + ", status=" + status + "]";
	}
	
}