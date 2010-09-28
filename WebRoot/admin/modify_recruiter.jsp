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
  <jsp:useBean id="recru" scope="session" class="com.mmc.bean.Recruiter" />
  <%
	String username = request.getParameter("username");
	String sql = "SELECT * FROM recruiters WHERE Zuser="+"'"+username+"'";
	ResultSet rs = recru.searchRecruiter(sql);

	String password = null;
	//String tel = null;
	String email = null;
	String intro = null;
	
	while (rs.next())
		{
			password = rs.getString("Zpassword");
			//tel = rs.getString("Ztel");
			email = rs.getString("Zmail");
			intro = rs.getString("Zintro");
		}
	if (password == null) password = "";
	//if (tel == null) tel = "";
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
			//String m_tel = request.getParameter("m_tel");
			String m_mail = request.getParameter("m_mail");
			String m_intro = request.getParameter("m_intro");

			if (m_password == null)	m_password = "";
			//if (m_tel == null) m_tel = "";
			if (m_mail == null) m_mail = "";
			if (m_intro == null) m_intro = "";

			boolean modifyFlag = true;
			boolean first = true; // 数据库第一个记录标记
			String m_sql = null;

			// 判断是否对数据进行了更改
			if (m_password.equals(password) &&
				//m_tel.equals(tel) && 
				m_mail.equals(email) && m_intro.equals(intro))
				modifyFlag = false;

			if (modifyFlag == true)		// 修改了信息
				{
					m_sql = "UPDATE recruiters SET ";
					if (!m_password.equals(password))
						{
							m_sql += "Zpassword='"+m_password+"'";
							first = false;
						}
/*					if (!m_tel.equals(tel))
						{
							if (first == true)
								{
									m_sql += "Ztel='"+m_tel+"'";
									first = false;
								}
							else
								m_sql += ",Ztel='"+m_tel+"'";
						}
*/
					if (!m_mail.equals(email))
						{
							if (first == true)
								{
									m_sql += "Zmail='"+m_mail+"'";
									first = false;
								}
							else
								m_sql += ",Zmail='"+m_mail+"'";
						}
					if (!m_intro.equals(intro))
							if (first == true)
								{
									m_sql += "Zintro='"+m_intro+"'";
									first = false;
								}
							else
								m_sql += ",Zintro='"+m_intro+"'";

					m_sql += " WHERE Zuser='"+m_username+"'";
					// 现在，把修改了的信息写入 MySQL 数据库
					recru.updateRecruiter(m_sql);
				}
			// 确保返回的结果集是最新的
			sql = "SELECT * FROM recruiters WHERE Zuser="+"'"+m_username+"'";
			rs = recru.searchRecruiter(sql);
			// 现在,从 MySQL 数据库中拿出数据
			while (rs.next())
				{
					username = rs.getString("Zuser");
					password = rs.getString("Zpassword");
					//tel = rs.getString("Ztel");
					email = rs.getString("Zmail");
					intro = rs.getString("Zintro");
				}
		}
  %>

  <body>
	<center>
	  <font size="5" color="blue">修改信息</font>
	  <form action="./admin/modify_recruiter.jsp">
		<table border="1">
		  <tr>
			<td>用户名：</td>
			<td><input name="m_username" value="<%= username %>" readonly /></td>
		  </tr>
		  <tr>
			<td>密码：</td>
			<td><input type="text" name="m_password" value="<%= password %>" /></td>
		  </tr>
<!--
		  <tr>
			<td>电话：</td>
			<td><input type="text" name="m_tel" value="<%//= tel %>" /></td>
		  </tr>
  -->
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
