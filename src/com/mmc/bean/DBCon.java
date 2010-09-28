package com.mmc.bean;

import javax.servlet.http.*;
import java.sql.*;

public class DBCon implements HttpSessionBindingListener
{
	public void valueBound(HttpSessionBindingEvent event)
	{}
	public void valueUnbound(HttpSessionBindingEvent event)
	{}
	
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
    private static final String drivername="org.gjt.mm.mysql.Driver";
    private static final String url="jdbc:mysql://localhost:3306/online?useUnicode=true&characterEncoding=UTF8";
    private static final String username="chy";
    private static final String password="chy";
	

	public DBCon()
	{
		try {
			Class.forName(drivername);
			con = DriverManager.getConnection(url,username,password);
			stmt = con.createStatement();
		} catch (ClassNotFoundException e) {
		}catch (SQLException e1) {
		}

	}	
	
	public void close() {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
			if (con != null) {
				con.close();
				con = null;
			}
		} catch (SQLException ac) {
			ac.printStackTrace();
		}
	}
	
	/**
	 * 数据库查询模块
	 */
	public ResultSet Query(String sql) {
			try {
				rs = stmt.executeQuery(sql);
			} catch (SQLException e) {
			}
		return rs;
	}
	/**
	 * 数据库执行、更新、删除模块
	 */
	public void Update(String sql){
		try {
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
		}
	
	}

}

