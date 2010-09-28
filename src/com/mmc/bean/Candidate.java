
package com.mmc.bean;

import java.sql.*;
import com.mmc.bean.DBCon;		
public class Candidate
{
	private String Yuser;		
	private String Ypassword;	
	private String Ysex;			
	private String Ytel;	
	private String Ymail;
	private String Yintro;	
	private DBCon dbCandidate;

	public Candidate()
	{
		setYuser();
		setYpassword();
		setYsex();
		setYtel();
		setYmail();
		setYintro();
		setdbCandidate();
	}

	public void setdbCandidate()
	{
		this.dbCandidate = new DBCon();
	}

	public void setYuser()
	{
		this.Yuser = null;
	}

	public void setYuser(String user)
	{
		this.Yuser = user;
	}

	public void setYpassword()
	{
		this.Ypassword = null;
	}

	public void setYpassword(String password)
	{
		this.Ypassword = password;
	}

	public void setYsex()
	{
		this.Ysex = null;
	}

	public void setYsex(String sex)
	{
		this.Ysex = sex;
	}

	public void setYtel()
	{
		this.Ytel = null;
	}

	public void setYtel(String tel)
	{
		this.Ytel = tel;
	}

	public void setYmail()
	{
		this.Ymail = null;
	}

	public void setYmail(String mail)
	{
		this.Ymail = mail;
	}

	public void setYintro()
	{
		this.Yintro = null;
	}

	public void setYintro(String intro)
	{
		this.Yintro = intro;
	}

	public String getYuser()
	{
		return this.Yuser;
	}

	public String getYpassword()
	{
		return this.Ypassword;
	}

	public String getYsex()
	{
		return this.Ysex;
	}

	public String getYtel()
	{
		return this.Ytel;
	}

	public String getYmail()
	{
		return this.Ymail;
	}

	public String getYintro()
	{
		return this.Yintro;
	}

	public DBCon getdbCandidate()
	{
		return this.dbCandidate;
	}

	public ResultSet searchCandidate(String sql)
	{
		return getdbCandidate().Query(sql);
	}
	public void updateCandidate(String sql)
	{
		getdbCandidate().Update(sql);
	}
}
