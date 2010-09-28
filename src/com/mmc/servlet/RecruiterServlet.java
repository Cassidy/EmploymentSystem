/**
 * Program: RecruiterServlet.java
 */
package com.mmc.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mmc.bean.DBCon;

public class RecruiterServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException
	{
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email    = req.getParameter("email");
		String intro    = req.getParameter("intro");

		if (username == null) username = "";
		if (password== null)  password = "";
		if (email == null)    email = "";
		if (intro == null)    intro = "";

		try
			{
				DBCon conBean = new DBCon(); // DBCon 在构造阶段已完成数据库的连接
				String sql = "INSERT INTO recruiters "+
					"VALUES('"+username+"','"+password+"','"+email+"','"+intro+"')";
				conBean.Update(sql);
			}
		catch (Exception e)
			{}
		resp.sendRedirect("admin/add_recruiter.jsp");
	}
}
/** RecruiterServlet.java ends here */
