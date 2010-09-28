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
  <%
      Object obj = session.getAttribute("privilege");
      if(obj.equals("3"))
      { 
  %>
  <jsp:useBean id="candi" scope="session" class="com.mmc.bean.Candidate" />
  <%
	String username = request.getParameter("username");
	String sql = "SELECT * FROM candidates WHERE Yuser="+"'"+username+"'";
	ResultSet rs = candi.searchCandidate(sql);
	
	String password = null;
	String sex = null;
	String tel = null;
	String email = null;
	String intro = null;
	
	while (rs.next())
		{
			password = rs.getString("Ypassword");
			sex = rs.getString("Ysex");
			tel = rs.getString("Ytel");
			email = rs.getString("Ymail");
			intro = rs.getString("Yintro");
		}
	if (password == null) password = "";
	if (sex == null) sex = "";
	if (tel == null) tel = "";
	if (email == null) email = "";
	if (intro == null) intro = "";
  %>

  <!-- 下面这段代码，用来更新数据库信息 -->
  <%
	if (username == null)
		{
			// 获取修改后的信息
			String m_username = request.getParameter("m_username");
			String m_password = request.getParameter("m_password");
			String m_sex = request.getParameter("m_sex");
			String m_tel = request.getParameter("m_tel");
			String m_mail = request.getParameter("m_mail");
			String m_intro = request.getParameter("m_intro");

			if (m_password == null)	m_password = "";
			if (m_sex == null) m_sex = "";
			if (m_tel == null) m_tel = "";
			if (m_mail == null) m_mail = "";
			if (m_intro == null) m_intro = "";

			boolean modifyFlag = true;
			boolean first = true; // 数据库第一个记录标记
			String m_sql = null;

			// 判断是否对数据进行了更改
			if (m_password.equals(password) && m_sex.equals(sex) &&
				m_tel.equals(tel) && m_mail.equals(email) &&
				m_intro.equals(intro))
				modifyFlag = false;

			if (modifyFlag == true)		// 修改了信息
				{
					m_sql = "UPDATE candidates SET ";
					if (!m_password.equals(password))
						{
							m_sql += "Ypassword='"+m_password+"'";
							first = false;
						}
					if (!m_sex.equals(sex))
						{
							if (first == true)
								{
									m_sql += "Ysex='"+m_sex+"'";
									first = false;
								}
							else
								m_sql += ",Ysex='"+m_sex+"'";
						}
					if (!m_tel.equals(tel))
						{
							if (first == true)
								{
									m_sql += "Ytel='"+m_tel+"'";
									first = false;
								}
							else
								m_sql += ",Ytel='"+m_tel+"'";
						}
					if (!m_mail.equals(email))
						{
							if (first == true)
								{
									m_sql += "Ymail='"+m_mail+"'";
									first = false;
								}
							else
								m_sql += ",Ymail='"+m_mail+"'";
						}
					if (!m_intro.equals(intro))
							if (first == true)
								{
									m_sql += "Yintro='"+m_intro+"'";
									first = false;
								}
							else
								m_sql += ",Yintro='"+m_intro+"'";

					m_sql += " WHERE Yuser='"+m_username+"'";
				}
			// 现在，把修改了的信息写入 MySQL 数据库
			candi.updateCandidate(m_sql);

			sql = "SELECT * FROM candidates WHERE Yuser="+"'"+m_username+"'";
			// 确保返回的结果集是最新的
			rs = candi.searchCandidate(sql);
			// 现在,从 MySQL 数据库中拿出数据
			while (rs.next())
				{
					username = rs.getString("Yuser");
					password = rs.getString("Ypassword");
					sex = rs.getString("Ysex");
					tel = rs.getString("Ytel");
					email = rs.getString("Ymail");
					intro = rs.getString("Yintro");
				}
		}
  %>

  <body>
	<center>
	  <font size="5" color="blue">修改信息</font>
	  <form action="./admin/modify_candidate.jsp">
		<table border="1">
		  <tr>
			<td>用户名：</td>
			<td><input name="m_username" value="<%= username %>" readonly /></td>
		  </tr>
		  <tr>
			<td>密码：</td>
			<td><input type="text" name="m_password" value="<%= password %>" /></td>
		  </tr>
		  <tr>
			<td>性别：</td>
			<td>
			  <%
			  if (sex.equals("M")) {
			  %>
			  <input type="radio" name="m_sex" value="M" checked="checked" />男
			  <input type="radio" name="m_sex" value="F" />女
			  <%
				} else {
			  %>
			  <input type="radio" name="m_sex" value="F" checked="checked" />女
			  <input type="radio" name="m_sex" value="M" />男
			  <% } %>
			</td>
		  </tr>
		  <tr>
			<td>电话：</td>
			<td><input type="text" name="m_tel" value="<%= tel %>" /></td>
		  </tr>
		  <tr>
			<td>邮箱：</td>
			<td><input type="text" name="m_mail" value="<%= email %>" /></td>
		  </tr>
		  <tr>
			<td>简介：</td>
			<td><input type="text" name="m_intro" value="<%= intro %>" /></td>
		  </tr>
		  <tr>
			<td><input type="submit" value="修改" /></td>
			<td><input type="reset" value="重置" /></td>
		  </tr>
		</table>
	  </form>
	</center>
  </body>
  <%
       }
  %>
</html>
