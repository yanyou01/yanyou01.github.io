<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>書店購物網</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="templatemo_container">
	<div id="templatemo_menu">
    	<ul>
            <li><a href="index.jsp" class="current">首頁</a></li>
            <li><a href="search.jsp">搜尋</a></li>
            <li><a href="books.html">書籍</a></li>              
            <li><a href="member.html">組員介紹</a></li> 
            <li><a href="Productboard.jsp">留言板</a></li>
			</li><li><a href="interface.jsp">加入會員</a></li>
			</li><li><a href="interface.jsp">購物車</a></li>
    	</ul>

    </div>
    
    <div id="templatemo_header">
    	<div id="templatemo_special_offers">
        	<p>
                <span>歡慶2021</span> 現在消費滿千送百&nbsp全館全面79折起
        	</p>
			<a href="#" style="margin-left: 50px;">詳情介紹...</a>
        </div>
        
        
        <div id="templatemo_new_books">
        	<ul>
                <li>演算法圖鑑：26種演算法 + 7種資料結構</li>
                <li>鬼滅之刃 21</li>
                <li>回家：案簿錄．浮生 卷一</li>
            </ul>
            <a href="#" style="margin-left: 50px;">詳情介紹...</a>
        </div>
    </div> 
    
    <div id="templatemo_content">
    	
        <div id="templatemo_content_left">
        	<div class="templatemo_content_left_section">
            	<h1>書籍分類</h1>
                <ul>
                <li><a href="literature.jsp">文學小說</a></li>
                    <li><a href="commercial.jsp">商業理財</a></li>
                    <li><a href="design.jsp">藝術設計</a></li>
                    <li><a href="history.jsp">人文史地</a></li>
                    <li><a href="social.jsp">社會科學</a></li>
                    <li><a href="natural.jsp">自然科普</a></li>
                    <li><a href="language.jsp">語言學習</a></li>
                    <li><a href="computer.jsp">電腦資訊</a></li>
                    <li><a href="lightnovel.jsp">輕小說/漫畫</a></li>
            	</ul>
            </div>
			<div class="templatemo_content_left_section">
            	<h1>暢銷書</h1>
                <ul>
                    <li><a href="#">回家：案簿錄．浮生 卷一</a></li>
                    <li><a href="#">原子習慣：細微改變帶來巨大成就的實證法則</a></li>
                    <li><a href="#">尋找一抹藍：與自然共生的藍染記憶</a></li>
                    <li><a href="#">反智：不願說理的人是偏執，不會說理的人是愚蠢，不敢說理的人是奴隸</a></li>
                    <li><a href="#">誰偷走了他們的青春：２４年的法庭輪轉人生 一部活生生的法稅教材</a></li>
                    <li><a href="#">為什麼要睡覺？：睡出健康與學習力、夢出創意的新科學</a></li>
                    <li><a href="#">新制多益NEW TOEIC聽力／閱讀題庫解析</a></li>
                    <li><a href="#">演算法圖鑑：26種演算法 + 7種資料結構</a></li>
                    <li><a href="#">鬼滅之刃 21</a></li>
				
                    
            	</ul>
            </div>
            
            
        </div> 
        
        <div id="templatemo_content_right">
        	
           
            
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<title>會員資料</title>
<%
if(session.getAttribute("id") != null ){
    sql = "SELECT * FROM `memberbook` WHERE `MemberID`='" +session.getAttribute("id")+"';"; 
	ResultSet rs =con.createStatement().executeQuery(sql);
	String id="", pwd="",no="",name="",sex="",phone="",mail="",address="",day="";
	//讀出id, pwd當成使用者要更改時的內定值
	while(rs.next()){
	    id=rs.getString("MemberID");
		pwd=rs.getString("MemberPassword");
		no=rs.getString("MemberNO");
		name=rs.getString("MemberName");
		sex=rs.getString("MemberSex");
		phone=rs.getString("MemberPhone");
		mail=rs.getString("Mail");
		address=rs.getString("MemberAddress");
		day=rs.getString("Putdate");
	}
    con.close();//結束資料庫連結
%>
哈囉，<%=name%>，您的會員編號是<%=no%><a href='logout.jsp'>登出</a><br />
請修改會員資料：<br />
<form action="update.jsp" method="POST">
您的帳號：<input type="text" name="id" value="<%=id%>" /></br>
您的密碼：<input type="text" name="pwd" value="<%=pwd%>" /></br>
您的姓名：<input type="text" name="name" value="<%=name%>" /></br>
您的性別：<input type="text" name="sex" value="<%=sex%>" /></br>
您的電話：<input type="text" name="phone" value="<%=phone%>" /></br>
您的信箱：<input type="text" name="mail" value="<%=mail%>" /></br>
您的地址：<input type="text" name="address" value="<%=address%>" /></br>
<input type="submit" name="b1" value="更新資料" />
</form>
<%
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
			
			
             <div class="cleaner_with_height">&nbsp;</div>
            
            
            
        </div> 
    
    	<div class="cleaner_with_height">&nbsp;</div>
    </div> 
    
    <div id="templatemo_footer">
	       <a href="index.jsp">首頁</a> | <a href="search.jsp">搜尋</a> | <a href="books.html">書籍</a> | <a href="member.html">組員介紹</a> | <a href="Productboard.jsp">留言板</a><br />
        Copyright © 2021 <a href="#"><strong>哭阿書店購物網</strong></a> 
	</div> 
	
</div> 

</body>
</html>