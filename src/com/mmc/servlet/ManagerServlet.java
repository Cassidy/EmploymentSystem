package com.mmc.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mmc.bean.DBCon;

public class ManagerServlet extends HttpServlet 
{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException 
    {
		String user = req.getParameter("user");
		String password = req.getParameter("password");
		DBCon ConBean = new DBCon();
		
		try
		{
			String sql = "select * from admin";
			ResultSet rs = ConBean.Query(sql);
			while(rs.next())
			{
				if(rs.getString("Auser").equals(user)&&rs.getString("Apassword").equals(password))
				{
					HttpSession session = req.getSession(true);
					session.setAttribute("user", user);
					session.setAttribute("privilege", "3");
					break;
				}
			}

			ConBean.close();
		}
		catch(Exception e)
		{}
		resp.sendRedirect("./admin/admin.jsp");	
    }
}
