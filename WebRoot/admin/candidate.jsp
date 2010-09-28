<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>通过 JavaBeans 访问数据库</title>
    
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<!--
		<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <%
      Object obj = session.getAttribute("privilege");
      if(obj.equals("3"))
      { 
  %>
	<center>
	  <jsp:useBean id="candi" scope="session" class="com.mmc.bean.Candidate" />
	  <form action="./admin/candidate.jsp">
		用户：<input type="text" name="username" /><br />
		密码：<input type="text" name="password" /><br />
		性别：<input type="text" name="sex" /><br />
		电话：<input type="text" name="tel" /><br />
		邮箱：<input type="text" name="email" /><br />
		简介：<input type="text" name="intro" /><br />
		<input type="submit" name="find" value="查询" />
		<input type="reset" name="reset" value="重置" />
		<br /><br />
	  </form>

	<%
	  String username = request.getParameter("username"); // 获取用户名
	  String password = request.getParameter("password"); // 获取密码
	  String sex = request.getParameter("sex");			  // 获取性别
	  String tel = request.getParameter("tel");			  // 获取电话
	  String email = request.getParameter("email");		  // 获取邮箱
	  String intro = request.getParameter("intro");		  // 获取简介

	  if (username == null)
		  username = "";
	  if (password == null)
		  password = "";
	  if (sex == null)
		  sex = "";
	  if (tel == null)
		  tel = "";
	  if (email == null)
		  email = "";
	  if (intro == null)
		  intro = "";

	  String sql = "SELECT * FROM candidates "+
		  "WHERE Yuser LIKE '%"+username+"%' "+
		  "AND Ypassword LIKE '%"+password+"%' "+
		  "AND Ysex LIKE '%"+sex+"%' "+
		  // "AND Ytel LIKE '%"+tel+"%' "+
		  // "AND Ymail LIKE '%"+email+"%' "+
		  "AND Yintro LIKE '%"+intro+"%'"; // 当数据库里某一列为空时,查询不成功
		  
	  ResultSet rs = candi.searchCandidate(sql);
	%>

	<p>
	  <font size="4" color="red">
		<!-- 取得最后一条记录的行数 -->
		<% rs.last();	// 移至最后一条记录 %>
		<%= rs.getRow() %>
		笔记录
	  </font>
	</p>

	<table border="2">
	  <tr>
		<td><b>用户名</b></td>
		<td><b>密码</b></td>
		<td><b>性别</b></td>
		<td><b>电话</b></td>
		<td><b>邮箱</b></td>
		<td><b>简介</b></td>
		<td><b>操作</b></td>
		<td><b><a href="./admin/add_candidate.jsp">增加</a></b></td>
	  </tr>
	  <%
		rs.beforeFirst(); // 移到第一条记录之前
		// 列出数据库中的数据
		while (rs.next())
			{
	  %>
	  <tr>
		<td><%= rs.getString(1) %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(3) %></td>
		<td><%= rs.getString(4) %></td>
		<td><%= rs.getString(5) %></td>
		<td><%= rs.getString(6) %></td>
		<td><a href="./admin/modify_candidate.jsp?username=<%= rs.getString(1) %>">修改</a></td>
		<td><a href="./admin/delete_candidate.jsp?username=<%= rs.getString(1) %>">删除</a></td>
	  </tr>
	  <%
		}
		rs.close();
	  %>
	</table>
  </center>
  <%
       }
  %>
</body>
</html>
