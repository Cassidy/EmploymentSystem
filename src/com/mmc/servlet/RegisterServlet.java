package com.mmc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mmc.bean.*;

public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException 
    {
		String userpassword = req.getParameter("password");
		String repassword = req.getParameter("repassword");
		if(!userpassword.equals(repassword))
		{
			resp.sendRedirect("register.jsp");
			return;
		}
		String username = req.getParameter("user");		
		String userprivilege = req.getParameter("privilege");
		
		String sqla ="Insert Into candidates(Yuser,Ypassword) values('"+username+"','"+userpassword+"')";
		String sqlb ="Insert Into recruiters(Zuser,Zpassword) values('"+username+"','"+userpassword+"')";
		DBCon ConBean = new DBCon();
		if(userprivilege.equals("1")){//如果是个人用户
			ConBean.Update(sqla);
			
			
		}else if(userprivilege.equals("2")){//如果是企业用户
			ConBean.Update(sqlb);
			
		}else{}
		
		ConBean.close();
		
		
		PrintWriter out = resp.getWriter();
		out.print("<SCRIPT language=JavaScript>alert('Operate Succeed~');this.location.href='index.jsp';</SCRIPT>");
    }	
		
}
