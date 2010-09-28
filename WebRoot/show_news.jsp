<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="ConBean" scope="session" class="com.mmc.bean.DBCon"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <%
  	String Nid = request.getParameter("name");//获取传过来的主键
	String sql = "select * from news where Nid ='"+Nid+"'";
	ResultSet rs = ConBean.Query(sql);
	while(rs.next()){
 %>
 <%!String title;%>
 <%title= rs.getString("Ntitle");%>
 
<body>

<table width="80%" border="1" align="center">
  <tr>
    <td width="17%" bgcolor="#99FFFF">新闻ID：</td>
    <td width="83%"><label name="Nid"><%=Nid%></label></td>
  </tr>
  <tr>
    <td bgcolor="#99FFFF">发布者：</td>
    <td><input name="Auser" type="text" value=<%=rs.getString("Auser")%> readonly="readonly" /></td>
  </tr>
  <tr>
    <td bgcolor="#99FFFF">新闻标题：</td>
    <td><%=rs.getString("Ntitle")%></td>

  </tr>
  <tr>
    <td bgcolor="#99FFFF">发布时间：</td>
    <td><%=rs.getString("Ntime").substring(0,rs.getString("Ntime").length()-2) %></td>
  </tr>
  <tr>
    <td bgcolor="#99FFFF">发布内容：</td>
    <td><textarea name="Ncontent" rows="10" readonly="readonly"><%=rs.getString("Ncontent")%></textarea></td>
  </tr>
  <tr>
    <td bgcolor="#99FFFF">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <%} %>
</table>

  </body>
  
  <head>
    
    <title><%=title%></title>
</head>
</html>
