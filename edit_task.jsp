<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.Db.DBConnect" %> <%@ page import="com.DAO.taskDao" %> <%@ page import="com.entities.*" %>
	<%@ page import="com.servlets.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Task Page</title>
<%@include file="all_js_css.jsp"%>
<style type="text/css">
h1 {
	text-align: center;
	color: black;
	font-family: "Times New Roman", Times, serif;
}

body {
	align: center;
}

.button2 {
	background-color: #b3b3cc;
	border-radius: 12px;
	border: none;
	color: black;
	padding: 7px 30px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}
</style>
</head>
<body>
	<%@include file="navbar3.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4">
					<div class="card-header text-center text-black bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4>Task</h4>

					</div>

					<div class="card-body">
					<% 
					int id=Integer.parseInt(request.getParameter("id"));
					
					taskDao dao = new taskDao(DBConnect.getConn());
					task t=dao.getTaskById(id);
					%>
						<form action="update" method="post">
						
						<input type="hidden" value="<%=t.getId()%>" name="id">
						
							<div class="form-group">
								<label for="exampleInputEmail">TASK</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
											aria-describedly="emailHelp" name="task" value ="<%=t.getTask()%>" >
							</div>

							<div class="form-group">
								<label>STATUS</label> <select id="inputState"
									class="form-control" name="status">
									<%
									if("To Do".equals(t.getStatus()))
									{
									%>
									<option selected>--Select--</option>
									<option value="In Progress">In Progress</option>
									<option value="Done">Done</option>
									<option value="To Do">To Do</option>
									
									<%} 
									else if("In Progress".equals(t.getStatus()))
										{%>
										<option selected>--Select--</option>
										<option value="To Do">To Do</option>
										<option value="Done">Done</option>
										<option value="In Progress">In Progress</option>
									 	<%
									 	} else{
									%>	
									<option selected>--Select--</option>
									<option value="To Do">To Do</option>
									<option value="In Progress">In Progress</option>
									<option value="Done">Done</option>
									<%}
									%>
								</select>
							</div>

							<button type="submit" class="button button2">UPDATE</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
</body>
</html>