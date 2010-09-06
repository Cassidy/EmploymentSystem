<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="ConBean" scope="session" class="com.mmc.bean.DBCon"/>
  <head>    
    <title>查询结果：</title>

  </head>
  <body>
  
  <% 
  String key = request.getParameter("key");//获取关键字
  String kind = request.getParameter("name");//获取用户所选取的搜索类型
  
  String sql = "select * from postnews where ";


  if(kind.equals("show")){//显示全部
	  sql = "select * from postnews";
	  
  }else if(kind.equals("lucky")){//判断是否位模糊查询
	  sql += "Zuser LIKE '%"+key+"%'";
 
  }else if(kind.equals("Ztitle") || kind.equals("Zgrade")){//按标题查询
  	  sql +=""+kind+"='"+key+"'";
  }else if(kind.equals("Zcontent"))//查询内容时采用模糊搜索
  {
	  sql += "Zcontent LIKE '%"+key+"%'";
	  
  }else{

	  
  }

  
  ResultSet rs = ConBean.Query(sql);
  
  %>  
 <center>
  <table border ="1">
  <tr bgcolor=orange >
  <td>发布用户</td>
  <td>发布时间</td>
  <td>发布标题</td>
  <td>需求人数</td>
  <td>招聘内容</td>
  <td>学历要求</td>
  <td>结贴时间</td>
  <td>应聘用户</td>
  
  </tr>
  
  <%
  while(rs.next()){
	  
   %>
   <tr>
   <td><%=rs.getString("Zuser") %></td>
   <td width=100"><%=rs.getString("Ztimea").substring(0,rs.getString("Ztimea").length()-2) %></td>
   <td><%=rs.getString("Ztitle") %></td>
   <td><%=rs.getInt("Znum") %></td>
   <td width=200 height=20><%=rs.getString("Zcontent") %></td>
   <td><%=rs.getString("Zgrade") %></td>
   <td><%=rs.getString("Ztimeb") %></td>
   <td><%=rs.getString("Yuser") %></td>
   </tr>
   
   
   <%} 
   %>
   
   </table>
   
   
	<h1><a href ="index.jsp">点击返回</a></h1>
   
 </center>
  

  
  </body>
