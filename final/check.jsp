<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<title>check</title>
<%
if(request.getParameter("id") !=null && request.getParameter("pwd") != null){
    sql = "SELECT * FROM `memberbook` WHERE `MemberID`=? AND `MemberPassword`=? "; 
    PreparedStatement pstmt=null;
	pstmt=con.prepareStatement(sql);
	pstmt.setString(1,request.getParameter("id"));
	pstmt.setString(2,request.getParameter("pwd"));
	ResultSet paperrs=pstmt.executeQuery();
    
    if(paperrs.next()){            
        session.setAttribute("id",request.getParameter("id"));
		con.close();//結束資料庫連結
        response.sendRedirect("index2.jsp") ;
    }
    else{
		con.close();//結束資料庫連結
        out.println("密碼帳號不符 !! </br><a href='index.jsp'>重新登入</a></br><a href='interface.jsp'>註冊帳號</a>") ;
	}
}
%>
