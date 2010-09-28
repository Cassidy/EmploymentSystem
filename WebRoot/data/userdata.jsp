<%@page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="ConBean" scope="session" class="com.mmc.bean.DBCon"/>
  <head>    
    <title>个人资料：</title>

  </head>
  
  <% 
    Object Yuser = session.getAttribute("user");//获取当前登录用户名
  	String sql = "select * from candidates where Yuser = '"+Yuser+"'";
  	ResultSet rs = ConBean.Query(sql);
  	while(rs.next())
  	{
  		String Ypassword = rs.getString("Ypassword");
  		String Ysex = rs.getString("Ysex");
  		String Ytel = rs.getString("Ytel");
  		String Ymail = rs.getString("Ymail");
  		String Yintro = rs.getString("Yintro");  
  	%>
  
  <body>
	<form action="userdata2.jsp">
	<table width="80%" border="1" align="center">
  <tr>
    <td width="16%" bgcolor="#99CCFF">用户名：</td>
    <td width="84%"><label name="Yuser"><%=Yuser%></label></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">密码：</td>
    <td><input type="text" name="Ypassword" value=<%=Ypassword%> /></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">性别：</td>
    <td>   
    <%if(Ysex.equals("F")){%>
    	
    
    <input type="radio" name="Ysex" value="男" checked="checked" />男
    <input type="radio" name="Ysex" value="女" />女
    
    <%}else{
    %>
    
   <input type="radio" name="Ysex" value="男" />男
    <input type="radio" name="Ysex" value="女" checked="checked" />女
    <%} %>
    </td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">电话：</td>
    <td><input type="text" name="Ytel" value=<%=Ytel%> /></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">邮箱：</td>
    <td><input type="text" name="Ymail" value=<%=Ymail%>></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">自我介绍：</td>
    
    <td bgcolor="#CCCCFF"><textarea name="Yintro" rows="10" ><%=Yintro%></textarea>
	</td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF"><input type="submit" value="修改"  /></td>
    <td><input type="reset" value="重置" /></td>
  </tr>
</table>	
</form>

<%}

%>
  

  
  </body>
