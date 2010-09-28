package com.mmc.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mmc.bean.DBCon;

public class NewsServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException
	{
		int Nid = Integer.valueOf(req.getParameter("Nid"))+1;
		String Auser = req.getParameter("Auser");
		String Ntitle    = req.getParameter("Ntitle");
		
		SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String datetime = tempDate.format(new java.util.Date());
		String Ncontent    = req.getParameter("Ncontent");
		System.out.print(Ncontent);
		DBCon conBean = new DBCon();
				String sql = "INSERT INTO news (Nid,Auser,Ntitle,Ntime,Ncontent) VALUES ('"+Nid+"','"+Auser+"','"+Ntitle+"','"+datetime+"','"+Ncontent+"')";
				conBean.Update(sql);
				resp.sendRedirect("admin/news.jsp");
			}
}
