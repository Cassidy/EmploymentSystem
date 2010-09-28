<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册会员</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
      function validate_required(field,alerttxt)
      {
          with (field)
          {
              if (value==null||value=="")
              {alert(alerttxt);return false}
              else {return true}
          }
      }

      function validate_form(thisform)
      {
          with (thisform)
          {
              if (validate_required(user,"用户名必输")==false)
              {user.focus();return false}
          }
          with (thisform)
          {
              if (validate_required(password,"密码必输")==false)
              {password.focus();return false}
          }
      }
    </script>
  </head>
  
  <body>
    注册会员: <br>
    <form action="registerservlet" name="register" onsubmit ="return validate_form(this)" method="post">
        <table border="0">
          <tr><td>用户名：</td><td><input type="text" name="user"></td></tr>
          <tr><td>密码：</td><td><input type="password" name="password"></td></tr>
          <tr><td>重输密码：</td><td><input type="password" name="repassword"></td></tr>
          <tr><td>会员类型：</td><td><select name="privilege" size="1">
          <option value="1" selected>普通会员</option>
          <option value="2">企业会员</option></select></td></tr>
          <tr><td><input type="submit" value="注册" ></td>
          <td><input type="reset" value="重置"></td></tr>
        </table>
      </form>
  </body>
</html>
