<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>哭阿書店購物網</title>
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
            <li><a href="books.jsp">書籍</a></li>              
            <li><a href="member.html">組員介紹</a></li> 
            <li><a href="Productboard.jsp">留言板</a></li>
			</li><li><a href="interface.jsp">加入會員</a></li>
			</li><li><a href="interface.jsp">購物車</a></li>
    	</ul>
		<form method="POST" action="check.jsp">
		<p style="text-align: right;"><font size="2">會員帳號：</font><input type="text" name="id" id="id" size="10">
		<font size="2">會員密碼：</font><input type="password" name="pwd" id="pwd"  size="10">
		<input type="submit" value="登入" name="submit"></p>
	    </form>
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
<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
</head>
<body>
<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="USE `product`";
           con.createStatement().execute(sql);
//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
           /*使用getRow()查詢筆數
		   sql="SELECT * FROM `productkist` WHERE `PDClass`='lightnovel'" ; //算出共幾筆留言
           ResultSet rs=con.createStatement().executeQuery(sql);

           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
           rs.last();
           int total_content=rs.getRow();
           */
		   //使用COUNT()查詢筆數
		   sql="SELECT COUNT(*) FROM `productlist`  WHERE `PDClass`='lightnovel'"; //算出共幾筆留言
           ResultSet rs=con.createStatement().executeQuery(sql);

           //移到第一筆，使用rs.getInt(1)，1表第一個欄位，就可知道共有幾筆記錄，型別為整數
           rs.next();
		   int total_content=rs.getInt(1);
		   //int total_content=Integer.parseInt(rs.getString(1));
		   
           
           //每頁顯示5筆, 算出共幾頁
           int page_num=(int)Math.ceil((double)total_content/5.0); //無條件進位
           
           //使用超連結方式, 呼叫自己, 使用get方式傳遞參數(變數名稱為page)


           //讀取page變數
           String page_string = request.getParameter("page");
           if (page_string == null) 
               page_string = "0";          
           int current_page=Integer.valueOf(page_string);
           if(current_page==0) //若未指定page, 令current_page為1
	          current_page=1;
	       //計算開始記錄位置   
//Step 5: 顯示結果 
           int start_record=(current_page-1)*5;
           //遞減排序, 讓最新的資料排在最前面
           sql="SELECT * FROM `productlist` WHERE `PDClass`='lightnovel' ORDER BY `PDNO` ASC LIMIT ";
           sql+=start_record+",5";

// current_page... SELECT * FROM `productlist` ORDER BY `PDNO` DESC LIMIT
//      current_page=1: SELECT * FROM `productlist` ORDER BY `PDNO` DESC LIMIT 0, 5
//      current_page=2: SELECT * FROM `productlist` ORDER BY `PDNO` DESC LIMIT 5, 5
//      current_page=3: SELECT * FROM `productlist` ORDER BY `PDNO` DESC LIMIT 10, 5
           rs=con.createStatement().executeQuery(sql);
//  逐筆顯示, 直到沒有資料(最多還是5筆)
           while(rs.next())
                {
			out.print("<h1>"+rs.getString(4)+"</h1>");
            out.print("<div class='image_panel'>");
			out.print("<img src='books/"+rs.getString(2)+"' alt='CSS Template' width='100' height='150' />");
			out.print("</div>");
          out.print("<h2>"+rs.getString(4)+"</h2>");
           out.print("<ul>");
	            out.print("<li>作者："+rs.getString(6)+"<a href='#'></a></li>");
				out.print("<li>編／譯者:"+rs.getString(7)+"</li>");
            	out.print("<li>出版日期:"+rs.getString(8)+"</li>");
                out.print("<li>規格："+rs.getString(9)+"</li>");
                out.print("<li>ISBN 13:"+rs.getString(10)+"</li>");
				out.print("<h3>"+rs.getString(11)+"元</h3>");
				out.print("<li>尚存"+rs.getString(3)+"本</li>");
            out.print("</ul>");
            
			out.print("<br></br>");
		
           
			
			out.print(rs.getString(12)+"<ul></ul>");
			
			
			out.print("<div class='buy_now_button'><a href='subpage.html'>現在購買</a></div>");
			out.print("<div class='detail_button'><a href='subpage.html'>詳細內容</a></div>");

				 
          }
			for(int i=1;i<=page_num;i++) //建立1,2,...頁超連結
			out.print("<a href='lightnovel.jsp?page="+i+"'>"+i+"</a>&nbsp;"); //&nbsp;html的空白

			out.println("<p>");
//Step 6: 關閉連線
          con.close();
      }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
		   
    }
}
catch (ClassNotFoundException err) {
      out.println("class錯誤"+err.toString());
}
%>
</body>
</html>

			    
        </div> 
    
    	<div class="cleaner_with_height">&nbsp;</div>
    </div> 
    
    <div id="templatemo_footer">
	       <a href="index.jsp">首頁</a> | <a href="search.jsp">搜尋</a> | <a href="books.jsp">書籍</a> | <a href="member.html">組員介紹</a> | <a href="board.jsp">留言板</a><br />
        Copyright © 2021 <a href="#"><strong>書店購物網</strong></a> 
	</div> 
	
</div> 

</body>
</html>