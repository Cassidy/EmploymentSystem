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

public class LoginServlet extends HttpServlet 
{
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException 
    {
    	String user = req.getParameter("user");
		String password = req.getParameter("password");
		String privilege = req.getParameter("privilege");
		HttpSession session = null;
		DBCon ConBean = new DBCon();
		
		String sqla = "select * from candidates";
		String sqlb = "select * from recruiters";
		try
		{
			if(privilege.equals("1"))
			{
				ResultSet rs1 = ConBean.Query(sqla);
				while(rs1.next())
				{
					if(rs1.getString("Yuser").equals(user)&&rs1.getString("Ypassword").equals(password))
					{
						session = req.getSession(true);
						session.setAttribute("user", user);
						session.setAttribute("privilege", privilege);
						break;
					}
				}		
			}
			else if(privilege.equals("2"))
			{
				ResultSet rs2 = ConBean.Query(sqlb);
				while(rs2.next())
				{
					if(rs2.getString("Zuser").equals(user)&&rs2.getString("Zpassword").equals(password))
					{
						session = req.getSession(true);
						session.setAttribute("user", user);
						session.setAttribute("privilege", privilege);
						break;
					}
				}
			}
			ConBean.close();
		}
		catch(Exception e)
		{}
		resp.sendRedirect("index.jsp");
    }
}
