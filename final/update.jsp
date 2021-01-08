<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(session.getAttribute("id") != null ){
    if(request.getParameter("id")!=null){
    sql = "UPDATE `memberbook` SET `MemberID`='"+request.getParameter("id")+"' WHERE `MemberID`='"+session.getAttribute("id")+"'";
	con.createStatement().execute(sql);
    sql = "UPDATE `memberbook` SET `MemberPassword`='"+request.getParameter("pwd")+"' WHERE `MemberID`='"+session.getAttribute("id")+"'";
	con.createStatement().execute(sql);	
	    sql = "UPDATE `memberbook` SET `MemberName`='"+request.getParameter("name")+"' WHERE `MemberID`='"+session.getAttribute("id")+"'";
	con.createStatement().execute(sql);	
	    sql = "UPDATE `memberbook` SET `MemberSex`='"+request.getParameter("sex")+"' WHERE `MemberID`='"+session.getAttribute("id")+"'";
	con.createStatement().execute(sql);	
	    sql = "UPDATE `memberbook` SET `MemberPhone`='"+request.getParameter("phone")+"' WHERE `MemberID`='"+session.getAttribute("id")+"'";
	con.createStatement().execute(sql);	
	    sql = "UPDATE `memberbook` SET `Mail`='"+request.getParameter("mail")+"' WHERE `MemberID`='"+session.getAttribute("id")+"'";
	con.createStatement().execute(sql);	
	    sql = "UPDATE `memberbook` SET `MemberAddress`='"+request.getParameter("address")+"' WHERE `MemberID`='"+session.getAttribute("id")+"'";
	con.createStatement().execute(sql);	
	con.close();//結束資料庫連結
	out.print("更新成功!! </br><a href='user.jsp'>會員頁面</a>");
	}
	else{
	  con.close();//結束資料庫連結	
	  out.print("更新失敗!! 請填寫完整，回<a href='user.jsp'>會員頁面</a>!!");
	}
}
else{
	con.close();//結束資料庫連結
%>
<h1><font color="red">您尚未登入，請登入！</font></h1>
<form action="check.jsp" method="POST">
帳號：<input type="text" name="id" /><br />
密碼：<input type="password" name="pwd" /><br />
<input type="submit" name="b1" value="登入" />
</form>
<%
}
%>
