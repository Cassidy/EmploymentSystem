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
protected String encoding;          // �����ַ�����
protected boolean ignore;            // �Ƿ���Դ�Сд
protected FilterConfig filterConfig; // ��ʼ������
public void init(FilterConfig filterConfig) throws ServletException 
{
// ��web.xml�ļ��ж�ȡencoding��ֵ
encoding = filterConfig.getInitParameter("encoding"); 
// ��web.xml�ļ��ж�ȡignore��ֵ
String value = filterConfig.getInitParameter("ignore"); 
// �������������Ϊ���Դ�Сд
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
// doFilter����
public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
{
if(ignore || request.getCharacterEncoding() == null) 
{
// ���Ϊ���ȴ�web.xml�еõ�
   String encoding = selectEncoding(request); 
if(encoding != null) 
{
// �����ַ�������
    request.setCharacterEncoding(encoding); 
}
}
// ����ִ��
chain.doFilter(request, response); 
} 
// �õ��ַ�����
private String selectEncoding(ServletRequest request) 
{ 
return encoding; 
} 
public void destroy() 
{ 
} 
}
