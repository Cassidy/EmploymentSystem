/**
 * Program: CandidateServlet.java
 */
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

public class CandidateServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException
	{
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String sex      = req.getParameter("sex");
		String tel      = req.getParameter("tel");
		String email    = req.getParameter("email");
		String intro    = req.getParameter("intro");

		if (username == null) username = "";
		if (password== null)  password = "";
		if (sex == null)      sex = "";
		if (tel == null)      tel = "";
		if (email == null)    email = "";
		if (intro == null)    intro = "";

		try
			{
				DBCon conBean = new DBCon(); // DBCon 在构造阶段已完成数据库的连接
				String sql = "INSERT INTO candidates "+
					"VALUES('"+username+"','"+password+"','"+sex+"','"+tel+"','"+
					email+"','"+intro+"')";

				conBean.Update(sql);
			}
		catch (Exception e)
			{}
		resp.sendRedirect("admin/add_candidate.jsp");
	}
}
/** CandidateServlet.java ends here */
