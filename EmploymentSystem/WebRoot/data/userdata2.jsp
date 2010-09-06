<%@page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="ConBean" scope="session" class="com.mmc.bean.DBCon"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改成功</title>


	<%
	 Object Yuser = session.getAttribute("user");//获取当前登录的用户
	String Ypassword = request.getParameter("Ypassword");
		String Ysex = request.getParameter("Ysex");
		
  		String Ytel = request.getParameter("Ytel");
  		String Ymail = request.getParameter("Ymail");
  		String Yintro = request.getParameter("Yintro");
  		System.out.print(Yintro);
  		String sql = "update candidates set Ypassword='"+Ypassword+"',Ysex='"+Ysex+"',Ytel='"+Ytel+"',Ymail='"+Ymail+"',Yintro='"+Yintro+"' where Yuser='"+Yuser+"' ";
  		
  		System.out.print(sql);
		ConBean.Update(sql);
		out.print("<SCRIPT language=JavaScript>alert('Operate Succeed~');this.location.href='../index.jsp';</SCRIPT>");
	
	%>
  </head>
  
  
  <body>
  
  
  
  </body>
</html>
