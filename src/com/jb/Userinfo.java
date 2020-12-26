package com.jb;

import java.util.Date;

public class Userinfo {
	//userid用户标识,password密码,name登录用户名,truename用户真实名,dept部门,zw职务
		private String userid;
		private String password;
		private String name;
		private String truename;
		private String dept;
		private String zw;
		
		public String getuserid()
		{   return this.userid;
		}
		
		public String getpassword()
		{
			return this.password;
		}
		
		public String getname()
		{
			return this.name;
		}
		
		public String gettruename()
		{
			return this.truename;
		}
		
		public String getdept()
		{
			return this.dept;
		}
		
		public String getzw()
		{
			return this.zw;
		}
		
		public void setuserid(String c)
		{
			this.userid=c;
		}
		
		public void setpassword(String c)
		{
			
			this.password=c;
		}
		
		public void setname(String c)
		{
			this.name=c;
		}
		
		public void settruename(String c)
		{
			this.truename=c;
		}
		
		public void  setdept(String c)
		{
			this.dept=c;
		}
		
		public void setzw(String c)
		{
			this.zw=c;
		}
}
