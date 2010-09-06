 package com.mmc.bean;

import java.sql.*;
import com.mmc.bean.DBCon;

public class Recruiter
{
	private String Zuser;    	
	private String Zpassword;
	private String Zmail;	
	private String Zintro;
	private DBCon dbRecruiter;

	public Recruiter()
	{
		setZuser();
		setZpassword();
		setZmail();
		setZintro();
		setdbRecruiter();
	}
	
	public void setdbRecruiter()
	{
		this.dbRecruiter = new DBCon();
	}

	public String getZuser() {
		return Zuser;
	}

	public void setZuser() {
		this.Zuser = null;
	}
	
	public void setZuser(String zuser) {
		Zuser = zuser;
	}

	public String getZpassword() {
		return Zpassword;
	}

	public void setZpassword() {
		this.Zpassword = null;
	}	
	
	public void setZpassword(String zpassword) {
		Zpassword = zpassword;
	}

	public String getZmail() {
		return Zmail;
	}

	public void setZmail() {
		this.Zmail = null;
	}	
	
	public void setZmail(String zmail) {
		Zmail = zmail;
	}	
	
	public String getZintro() {
		return Zintro;
	}

	public void setZintro() {
		this.Zintro = null;
	}	
	
	public void setZintro(String zintro) {
		Zintro = zintro;
	}
	
	public DBCon getdbRecruiter()
	{
		return this.dbRecruiter;
	}

	public ResultSet searchRecruiter(String sql)
	{
		return getdbRecruiter().Query(sql);
	}
	
	public void updateRecruiter(String sql)
	{
		getdbRecruiter().Update(sql);
	}
}
