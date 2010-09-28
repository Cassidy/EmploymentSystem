<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="ConBean" scope="session" class="com.mmc.bean.DBCon" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>新闻管理</title>
  </head>
  
  <body>

	<table border="1" width="80%" border="1" align="center">
	  <tr>
		<td><b>新闻ID</b></td>
		<td><b>发布者</b></td>
		<td><b>新闻题目</b></td>
		<td><b>发布时间</b></td>
		<td><b>发布内容</b></td>
		<td><b><a href="add_news.jsp">增加</a></b></td>
	  </tr>
	  <% 
	  String sql = "select * from news";
	  ResultSet rs = ConBean.Query(sql);
		while (rs.next())
			{
	  %>
	  <tr>
		<td><%= rs.getString("Nid") %></td>
		<td><%= rs.getString("Auser") %></td>
		<td><%= rs.getString("Ntitle") %></td>
		<td><%= rs.getString("Ntime").substring(0,rs.getString("Ntime").length()-2)%></td>
		<td><%= rs.getString("Ncontent") %></td>
		<td><a href="modify_news.jsp?Nid=<%= rs.getInt("Nid") %>">修改</a></td>
		<td><a href="delete_news.jsp?Nid=<%= rs.getInt("Nid") %>">删除</a></td>
	  </tr>

<%} %>
	</table>

  </body>
</html>
