<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> <%@ page import="java.sql.Connection" %>
<%@ page import="com.Db.*" %> <%@ page import=" com.DAO.taskDao" %> <%@ page import=" com.entities.task" %> <%@ page import =" java.util.List"%>
<html>
<head>
<title>task</title>
<style type="text/css">
.btn-sm1 {
  background-color:#80ccff; 
  border-radius: 12px;
  border: none;
  color: black;
  padding: 7px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
}
.btn-sm2 {
  background-color:#b3b3cc; 
  border-radius: 12px;
  border: none;
  color: black;
  padding: 7px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
}
</style>
</head>

</head>
<body>
<%@include file="navbar3.jsp"%>

<%
	String success = (String) session.getAttribute("success");
	
	if(success != null)
	{%>
		<div class="alert alert-success" role="alert"><%=success %></div>
		
	<%
	session.removeAttribute("success");
	}
	%>
	
	<%
	String error = (String) session.getAttribute("error");
	
	if(error != null)
	{%>
		<div class="alert alert-danger" role="alert"><%=error %></div>
		
	<%
	session.removeAttribute("error");
	}
	%>

<h1 class="text-center ">Task</h1>
<div class="container">
<div class="container-fluid div-color">
<div class="card mt-4">

<table class="table table-stripped" >

  <thead class="thead-light">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">TASK</th>
      <th scope="col">STATUS</th>
      <th scope="col">ACTION</th>
    </tr>
  </thead>
  <tbody>
    	<%
    	taskDao dao = new taskDao(DBConnect.getConn());
    	List<task> task = dao.getTask();
    	for (task t : task) {
    	%>
    	<tr>
      <th scope="row"><%=t.getId() %></th>
      <th><%=t.getTask() %></th>
      <td><%=t.getStatus() %></td>
      <td><a href="edit?id=<%=t.getId() %>" class="btn btn-sm1">EDIT</a>
      <a href="delete?id=<%=t.getId() %>" class="btn btn-sm2">DELETE</a></td>
    </tr>
    	<%
    	}
       	%>
	</tbody>
	</table>
	 </div>
	</div>
	</div>
</body>
</html>
