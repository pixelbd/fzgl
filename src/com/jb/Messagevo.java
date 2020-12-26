package com.jb;

public class Messagevo implements java.io.Serializable
{
	private String name,title,content;
	private java.sql.Date date;
	
	public void setName(String name)
	{
		this.name=name;
	}

	public void setTitle(String title)
	{
		this.title=title;
	}
	
	public void setContent(String content)
	{
		this.content=content;
	}
	
	public String getName()
	{
		return this.name;
	}
	
	public String getContent()
	{
		return this.content;
	}
	
	public String getTitle()
	{
		return this.title;
	}
	
	public java.sql.Date getDate()
	{
		return this.date;
	}
	
	public void setDate(java.sql.Date date)
	{
		this.date=date;
	}
}
