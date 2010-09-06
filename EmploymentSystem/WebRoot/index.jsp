<%@ page contentType="text/html;charset=utf-8"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="ConBean" scope="session" class="com.mmc.bean.DBCon"/>
<html>
<head>
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<META content="" name=keywords>
<META content="" name=description>  
<title>网上人才招聘管理系统V1.0</title>
</head>
<body leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<link href="style/style.css" rel="stylesheet" type="text/css">
<table width="900" height="71" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="237" align="center" background="images/banner.gif"><img src=images/banner.jpg  width=200   height=71   border=0></td>
    <td background="images/banner.gif">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td width="100%" height="36" align="right"><a href="" onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://localhost/');return false;"><strong> 设为首页</strong></a>
			<a href="" onClick="window.external.addFavorite('http://localhost/','人才招聘');return false;"><strong> 加人收藏</strong></a>
			<a href="./admin/admin.jsp"><strong>后台入口</strong></a>		</td>
			<td width="0%"></td>
		  </tr>
		  <tr>
		    <td width="100%" height="30">&nbsp;</td>
			<td width="0%"></td>
		  </tr>
		</table>
	</td>
  </tr>
</table>
<table width="900" height="38" border="0" align="center" cellpadding="0" cellspacing="0" background="images/s1.gif">
  <tr>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="4%">&nbsp;</td>
        <td width="63%">
<table height=38 border=0 cellpadding=0 cellspacing=0 >
   
  <tr>
 
    
    <td width="100" align='center' background="http://www.zhanshuw.com/zhaopin/templates/J003/images/menunow.gif"  style="padding-top:5px">
	
	<a href="index.php" class="menunow"  target="_self">首页</a>
	</td>
   
 
    <td width=10 align="center"><img src="images/line.gif" width="4" height="38"></td>

		<td width="100" align='center'   style="padding-top:5px">
		
			
			<a href="person/main/index.php"  class="menu" target="_self">个人服务</a>
			
		
	</td>

     
    <td width=10 align="center"><img src="images/line.gif" width="4" height="38"></td>

		<td width="100" align='center'   style="padding-top:5px">
		
			
			<a href="company/main/index.php"  class="menu" target="_self">企业服务</a>
			
		
	</td>

     
    <td width=10 align="center"><img src="images/line.gif" width="4" height="38"></td>

		<td width="100" align='center'   style="padding-top:5px">
		
			
			<a href="college/main/index.php"  class="menu" target="_self">院校专区</a>
			
		
	</td>

     
    <td width=10 align="center"><img src="images/line.gif" width="4" height="38"></td>

		<td width="100" align='center'   style="padding-top:5px">
		
			
			<a href="train/main/index.php"  class="menu" target="_self">培训机构</a>
			
		
	</td>

     
    <td width=10 align="center"><img src="images/line.gif" width="4" height="38"></td>

		<td width="100" align='center'   style="padding-top:5px">
		
			
			<a href="news/main/index.php"  class="menu" target="_self">资讯</a>
			
		
	</td>

     
    <td width=10 align="center"><img src="images/line.gif" width="4" height="38"></td>

		<td width="100" align='center'   style="padding-top:5px">
		
			
			<a href="member.php"  class="menu" target="_self">会员中心</a>
			
		
	</td>

     
    <td width=10 align="center"><img src="images/line.gif" width="4" height="38"></td>
 
</table>
</td>
        <td width="33%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<TABLE height=6 cellSpacing=0 cellPadding=0 width=900 align=center bgColor=#ffffff border=0>
 <TR>
	<TD></TD>
 </TR>
</TABLE>
<table width="900" height="188" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="194" height="138" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/login.gif" width="194"></td>
        </tr>
      </table>
        <table width="100%" height="157"  border="0" cellpadding="0" cellspacing="0" background="images/x4.gif">
          <tr>
            <td width="5%" height="157">&nbsp;</td>
            <td width="92%" valign="top">
            
            
              <%
       Object obj = session.getAttribute("user");
       if(obj == null)
       {
       %>
       <form action="loginservlet" name="login" onsubmit ="return validate_form(this)" method="post">
        <table border="0">
          <tr>
            <td>账号：</td><td><input name="user" type="text" size="15" maxlength="10"></td></tr>
          <tr><td>密码：</td><td><input name="password" type="password" size="15" maxlength="10"></td></tr>
          <tr><td>权限：</td><td><select name="privilege" size="1">
          <option value="1" selected>普通会员</option>
          <option value="2">企业会员</option></select></td></tr>
          <tr><td><input type="submit" value="登录" ></td>
          <td><input type="reset" value="重置"></td></tr>
        </table>
        <a href="register.jsp">没有账号？点击注册</a>！<br>
   </form>
       <%
       } else {
   %>
    欢迎您！<h1><%=obj %></h1>
    <p>
    <a href="./data/userdata.jsp">修改个人资料</a>
    <p>
     <a href="logout.jsp">退出</a>
   <%}%>
</td>
            <td width="3%">&nbsp;</td>
          </tr>
        </table>
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/x8.gif" width="194" height="6"></td>
          </tr>
      </table></td>
      <form name="search" method="get" action="search.jsp">
    <td width="208" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/jobsearch.gif" width="208"></td>
      </tr>
    </table>
    
      <table width="100%" height="138"  border="0" cellpadding="0" cellspacing="0" background="images/x9.gif">

          <td width="5%" height="138">&nbsp;</td>
          <td width="90%" valign="top"><table width="100%" height="157" border="0">
            <tr>
              <td width="50%">关键字:</td>
              <td width="50%"><input name="key" type="text" value="" size="12"></td>
            </tr>
            <tr>
              <td><input type=radio name="name"  value="Ztitle"checked>发布标题</td>
              <td><input type=radio name="name" value="Zgrade">要求学历</td>
            </tr>
            <tr>
              <td><input type=radio name="name" value="Zcontent" >发布内容</td>
              <td><input type=radio name="name" value="lucky" >看运气咯！~</td>
            </tr>
            <tr>
                          <td><input type=radio name="name" value="show" >显示全部</td>
              <td><input type="submit" name="search" value="搜索" ></td>

            </tr>
          </table></td>
          <td width="5%">&nbsp;</td>
        </tr>
      </table>
      
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="images/x1.gif" width="208" height="7"></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
      </form>
    <td width="498" valign="top"><table width="100%" height="202"  border="0" cellpadding="0" cellspacing="0" background="images/k1.gif">
      <tr>
        <td height="188" align="center"><table width="100%" height="163"  border="0" cellpadding="3" cellspacing="3">
          <tr>
            <td align="center" valign="middle">
<img src="images/play.jpg" alt="" width="449" height="189"></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="692" height="272" valign="top" background="images/x6.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/recommend_e.gif" width="692"></td>
      </tr>
    </table>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" background="images/x6.gif">
        <tr>
          <td width="2%" height="200">&nbsp;</td>
          <td width="96%" valign="top">
	
<table width="100%" border="0" cellspacing="0" cellpadding="0">
   
    <td align=center >
		
	     <table  height="48" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#e5e5e5">
            <tr>
              <td align="center" bgcolor="#FFFFFF"><a href="company/html/?134.html" target="_self">
			  <img src="images/company001.gif" border="0" width="104" height="48"></a></td>
            </tr>
          </table>
		
	</td>
 
    <td align=center >
		
	     <table  height="48" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#e5e5e5">
            <tr>
              <td align="center" bgcolor="#FFFFFF"><a href="company/html/?134.html" target="_self"><img src="images/company001.gif" alt="" width="104" height="48" border="0"></a><a href="company/html/?108.html" target="_self"></a></td>
            </tr>
          </table>
		
	</td>
 
    <td align=center >
		
	     <table  height="48" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#e5e5e5">
            <tr>
              <td align="center" bgcolor="#FFFFFF"><a href="company/html/?134.html" target="_self"><img src="images/company001.gif" alt="" width="104" height="48" border="0"></a><a href="company/html/?107.html" target="_self"></a></td>
            </tr>
          </table>
		
	</td>
 
    <td align=center >
		
	     <table  height="48" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#e5e5e5">
            <tr>
              <td align="center" bgcolor="#FFFFFF"><a href="company/html/?134.html" target="_self"><img src="images/company001.gif" alt="" width="104" height="48" border="0"></a><a href="company/html/?106.html" target="_self"></a></td>
            </tr>
          </table>
		
	</td>
 
    <td align=center >
		
	     <table  height="48" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#e5e5e5">
            <tr>
              <td align="center" bgcolor="#FFFFFF"><a href="company/html/?134.html" target="_self"><img src="images/company001.gif" alt="" width="104" height="48" border="0"></a><a href="company/html/?105.html" target="_self"></a></td>
            </tr>
          </table>
		
	</td>
 
    <td align=center >
		
	     <table  height="48" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#e5e5e5">
            <tr>
              <td align="center" bgcolor="#FFFFFF"><a href="company/html/?134.html" target="_self"><img src="images/company001.gif" alt="" width="104" height="48" border="0"></a><a href="company/html/?104.html" target="_self"></a></td>
            </tr>
          </table>
		
	</td>
 
</tr>
<tr>
<td height="5"></td>
</tr>
 
    <td align=center >
		
	     <table  height="48" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#e5e5e5">
            <tr>
              <td align="center" bgcolor="#FFFFFF"><a href="company/html/?134.html" target="_self"><img src="images/company001.gif" alt="" width="104" height="48" border="0"></a><a href="company/html/?103.html" target="_self"></a></td>
            </tr>
          </table>
		
	</td>
 
    <td align=center >
		
	     <table  height="48" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#e5e5e5">
            <tr>
              <td align="center" bgcolor="#FFFFFF"><a href="company/html/?134.html" target="_self"><img src="images/company001.gif" alt="" width="104" height="48" border="0"></a><a href="company/html/?102.html" target="_self"></a></td>
            </tr>
          </table>
		
	</td>
 
    <td align=center >
		
	     <table  height="48" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#e5e5e5">
            <tr>
              <td align="center" bgcolor="#FFFFFF"><a href="company/html/?134.html" target="_self"><img src="images/company001.gif" alt="" width="104" height="48" border="0"></a><a href="company/html/?101.html" target="_self"></a></td>
            </tr>
          </table>
		
	</td>
 
    <td align=center >
		
	     <table  height="48" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#e5e5e5">
            <tr>
              <td align="center" bgcolor="#FFFFFF"><a href="company/html/?134.html" target="_self"><img src="images/company001.gif" alt="" width="104" height="48" border="0"></a><a href="company/html/?100.html" target="_self"></a></td>
            </tr>
          </table>
		
	</td>
 
    <td align=center >
		
	     <table  height="48" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#e5e5e5">
            <tr>
              <td align="center" bgcolor="#FFFFFF"><a href="company/html/?134.html" target="_self"><img src="images/company001.gif" alt="" width="104" height="48" border="0"></a><a href="company/html/?99.html" target="_self"></a></td>
            </tr>
          </table>
		
	</td>
 
    <td align=center >
		
	     <table  height="48" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#e5e5e5">
            <tr>
              <td align="center" bgcolor="#FFFFFF"><a href="company/html/?134.html" target="_self"><img src="images/company001.gif" alt="" width="104" height="48" border="0"></a><a href="company/html/?98.html" target="_self"></a></td>
            </tr>
          </table>
		
	</td>
 
</tr>
<tr>
  <td height="5"></td>
</tr>
 
    </table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr align="right"> 
      <td><a href="" class="more"></a></td>
    </tr>
  </table>
 </td>
          <td width="2%">&nbsp;</td>
        </tr>
      </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/x2.gif" width="692"></td>
        </tr>
      </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/newest_postion.gif" width="692"></td>
        </tr>
      </table>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" background="images/x6.gif">
        <tr>
          <td width="2%" height="85">&nbsp;</td>
          <td width="96%" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 
 <td  style="padding-left:20px; padding-top:10px;">
	<a href="company/html/?151.html" target="_self"><strong>浙江软件有限公司</strong></a><br/>
	<a href='company/jobhtml/?71.html'><font color='red'>LINUX系统工程师</font></a>&nbsp;<a href='company/jobhtml/?70.html'><font color='red'>mysql数据库工程师</font></a>&nbsp;<a href='company/jobhtml/?69.html'><font color='red'>phpweb项目</font></a>&nbsp;	
</td>
 
 <td  style="padding-left:20px; padding-top:10px;">
	<a href="company/html/?134.html" target="_self"><strong>上海大众汽车有限公司</strong></a><br/>
	<a href='company/jobhtml/?67.html'><font color='red'>财务管理</font></a>&nbsp;	
</td>
 
 <td  style="padding-left:20px; padding-top:10px;">
	<a href="company/html/?107.html" target="_self"><strong>德国SEW-传动设备有限公司</strong></a><br/>
	<a href='company/jobhtml/?40.html'><font color='red'>维修工程师</font></a>&nbsp;	
</td>
 
</tr>
 
 <td  style="padding-left:20px; padding-top:10px;">
   <a href="company/html/?64.html" target="_self"><strong>上海智联招聘有限公司</strong></a><br/>
   <a href='company/jobhtml/?25.html'><font color='red'>销售总监</font></a>&nbsp;	
  </td>
   
   <td  style="padding-left:20px; padding-top:10px;">
     <a href="company/html/?65.html" target="_self"><strong>杭州名人服饰有限公司</strong></a><br/>
     <a href='company/jobhtml/?27.html'><font color='red'>行政管理</font></a>&nbsp;<a href='company/jobhtml/?26.html'><font color='red'>区域销售经理</font></a>&nbsp;	
  </td>
   
   <td  style="padding-left:20px; padding-top:10px;">
     <a href="company/html/?62.html" target="_self"><strong>杭州PHPWIND有限公司</strong></a><br/>
     <a href='company/jobhtml/?20.html'><font color='red'>高级信息技术专员-产品文档</font></a>&nbsp;	
  </td>
   
</tr>
 
 </table>
</td>
          <td width="2%">&nbsp;</td>
        </tr>
      </table>
    </td>
    <td width="208" valign="top" background="images/x12.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/nearly_recruitment.gif" width="208"></td>
      </tr>
    </table>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" background="images/x9.gif">
        <tr>
          <td width="5%" height="118">&nbsp;</td>
          <td width="91%" valign="top">
          <marquee direction="up" onMouseOver="this.stop();" onMouseOut="this.start();"> 
<table width="98%"  border="0" cellspacing="0" cellpadding="0">


  <tr >
    <td width="22" align="center"><img src="images/x10.gif" width="9" height="9"></td>
    <td height="21"><a href="news/html/?52.html" class="tList" target="_self"   >忽悠招聘会</a>&nbsp;</td>
  </tr><tr>
    <td colspan=2 background="http://www.zhanshuw.com/zhaopin/templates/J003/images/line.gif" height=3></td>
  </tr>




  <tr >
    <td width="22" align="center"><img src="images/x10.gif" alt="" width="9" height="9"></td>
    <td height="21"><a href="news/html/?51.html" class="tList" target="_self"   >舟山市委党校教师招聘公告</a>&nbsp;</td>
  </tr><tr>
    <td colspan=2 background="http://www.zhanshuw.com/zhaopin/templates/J003/images/line.gif" height=3></td>
  </tr>




  <tr >
    <td width="22" align="center"><img src="images/x10.gif" alt="" width="9" height="9"></td>
    <td height="21"><a href="news/html/?50.html" class="tList" target="_self"   >2009年4月份人才招聘活</a>&nbsp;</td>
  </tr><tr>
    <td colspan=2 background="http://www.zhanshuw.com/zhaopin/templates/J003/images/line.gif" height=3></td>
  </tr>




  <tr >
    <td width="22" align="center"><img src="images/x10.gif" alt="" width="9" height="9"></td>
    <td height="21"><a href="news/html/?49.html" class="tList" target="_self"   >浙江理工大学公开招聘人员公</a>&nbsp;</td>
  </tr><tr>
    <td colspan=2 background="http://www.zhanshuw.com/zhaopin/templates/J003/images/line.gif" height=3></td>
  </tr>




  <tr >
    <td width="22" align="center"><img src="images/x10.gif" alt="" width="9" height="9"></td>
    <td height="21"><a href="news/html/?48.html" class="tList" target="_self"   >浙江科技学院公开招聘人员公</a>&nbsp;</td>
  </tr><tr>
    <td colspan=2 background="http://www.zhanshuw.com/zhaopin/templates/J003/images/line.gif" height=3></td>
  </tr>



</table>
</marquee>


<table width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr align="right"> 
      <td><a href="news/class/?27.html" class="more"></a></td>
  </tr>
</table>
</td>
          <td width="4%">&nbsp;</td>
        </tr>
      </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/x1.gif" width="208" height="6"></td>
        </tr>
      </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/newest_school.gif" width="208" height="39"></td>
        </tr>
      </table>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" background="images/x12.gif">
        <tr>
          <td width="6%" height="95">&nbsp;</td>
          <td width="90%" valign="top">
          <marquee direction="up" onMouseOver="this.stop();" onMouseOut="this.start();"> 
<table width="98%"  border="0" cellspacing="0" cellpadding="0">

	<% 
	ResultSet rs1 = ConBean.Query("select * from News");
	while(rs1.next()){
		%>
		
		<tr>
		<td width="22" align="center"><img src="images/x10.gif" alt="" width="9" height="9"></td>
		<td><a href="show_news.jsp?name=<%=rs1.getInt("Nid") %> "><%=rs1.getString("Ntitle") %></a>
		</td>
		
		
	<%}%>

 

</table>
</marquee>
</td>
          <td width="4%">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/x2.gif" width="900"></td>
  </tr>
</table>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/recommend_enterprise.gif" width="900"></td>
  </tr>
</table>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" background="images/x13.gif">
  <tr>
    <td width="10" height="136">&nbsp;</td>
    <td width="881" valign="top">
	
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 
 <td  style="padding-left:20px; padding-top:10px;">
	

<a href="company/html/?151.html"  target="_self">浙江软件有限公司</a><font color="red"> 招聘</font>


</td>
  
 <td  style="padding-left:20px; padding-top:10px;">
	

<a href="company/html/?134.html"  target="_self">上海大众汽车有限公司</a><font color="red"> 招聘</font>


</td>
  
 <td  style="padding-left:20px; padding-top:10px;">
	

<a href="company/html/?108.html"  target="_self">世界蝴蝶生态园</a><font color="red"> 招聘</font>


</td>
  
 <td  style="padding-left:20px; padding-top:10px;">
	

<a href="company/html/?107.html"  target="_self">德国SEW-传动设备有限公司</a><font color="red"> 招聘</font>


</td>
  
</tr>
 
 <td  style="padding-left:20px; padding-top:10px;">
   
   
  <a href="company/html/?106.html"  target="_self">第一视频信息有限公司</a><font color="red"> 招聘</font>
   
   
  </td>
   
   <td  style="padding-left:20px; padding-top:10px;">
     
     
  <a href="company/html/?105.html"  target="_self">新东方教育科技集团</a><font color="red"> 招聘</font>
     
     
  </td>
   
   <td  style="padding-left:20px; padding-top:10px;">
     
     
  <a href="company/html/?104.html"  target="_self">佳能(中国)有限公司</a><font color="red"> 招聘</font>
     
     
  </td>
   
   <td  style="padding-left:20px; padding-top:10px;">
     
     
  <a href="company/html/?103.html"  target="_self">伽蓝(集团)股份有限公司</a><font color="red"> 招聘</font>
     
     
  </td>
   
</tr>
 
 </table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr align="right"> 
      <td><a href="" class="more"></a></td>
    </tr>
  </table>
 </td>
    <td width="10">&nbsp;</td>
  </tr>
</table>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/x14.gif" width="900"></td>
  </tr>
</table>
<table width="900" height="105" border="0" align="center" cellpadding="0" cellspacing="0" background="images/s2.gif" style="border:1px #F3D8C4 solid;">
  <tr>
    <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="40" align="center">
<table border="0" cellspacing="0" cellpadding="0" >
 
<tr>

<td width=1> </td>

<td class="btmenu"  style="padding-left:8px;padding-right:8px;" align=center nowrap >

<a href="#"  target="_self">关于我们</a> 

</td>

<td width=1> </td>

<td class="btmenu"  style="padding-left:8px;padding-right:8px;" align=center nowrap >

<a href="#"  target="_self">联系方式</a> 

</td>

<td width=1> </td>

<td class="btmenu"  style="padding-left:8px;padding-right:8px;" align=center nowrap >

<a href="page/advs/index.jsp"  target="_self">广告业务</a> 

</td>

<td width=1> </td>

<td class="btmenu"  style="padding-left:8px;padding-right:8px;" align=center nowrap >

<a href="page/link/index.jsp"  target="_self">友情链接</a> 

</td>

<td width=1> </td>

<td class="btmenu"  style="padding-left:8px;padding-right:8px;" align=center nowrap >

<a href="page/help/index.jsp"  target="_self">帮助中心</a> 

</td>

<td width=1> </td>
 
</table>
</td>
      </tr>
      <tr>
        <td height="31" align="center">
        <P><font color="#333333">人才招聘网站管理系统<BR>
          Copyright@2009-2010&nbsp; </font></P></td>
      </tr>
      <tr>
        <td height="23" align="center"><font color="#000000"><script>document.write("<script src=stat.php?nowpage="+window.location.href+"&reffer="+escape(document.referrer)+"><\/script>")</script></font></td>
      </tr>
    </table></td>
  </tr>
</table>
</body></html>
