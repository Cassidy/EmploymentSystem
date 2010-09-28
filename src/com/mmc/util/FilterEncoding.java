package com.mmc.util;

import java.io.IOException; 
import javax.servlet.Filter; 
import javax.servlet.FilterChain; 
import javax.servlet.FilterConfig; 
import javax.servlet.ServletException; 
import javax.servlet.ServletRequest; 
import javax.servlet.ServletResponse; 
public class FilterEncoding implements Filter 
{ 
protected String encoding;          // 接收字符编码
protected boolean ignore;            // 是否忽略大小写
protected FilterConfig filterConfig; // 初始化配置
public void init(FilterConfig filterConfig) throws ServletException 
{
// 从web.xml文件中读取encoding的值
encoding = filterConfig.getInitParameter("encoding"); 
// 从web.xml文件中读取ignore的值
String value = filterConfig.getInitParameter("ignore"); 
// 以下三种情况均为忽略大小写
if(value == null) 
{ 
ignore = true; 
}
else if(value.equalsIgnoreCase("yes")) 
{ 
ignore = true; 
} 
else if(value.equalsIgnoreCase("true")) 
{ 
ignore = true; 
} 
} 
// doFilter方法
public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
{
if(ignore || request.getCharacterEncoding() == null) 
{
// 如果为空先从web.xml中得到
   String encoding = selectEncoding(request); 
if(encoding != null) 
{
// 设置字符集编码
    request.setCharacterEncoding(encoding); 
}
}
// 继续执行
chain.doFilter(request, response); 
} 
// 得到字符编码
private String selectEncoding(ServletRequest request) 
{ 
return encoding; 
} 
public void destroy() 
{ 
} 
}
