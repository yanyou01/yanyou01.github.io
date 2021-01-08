<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>insert</title>
</head>
<body>
<%!
String newline(String str)
{
	int index=0;
	while((index=str.indexOf("\n"))!=-1)
	str=str.substring(0,index)+"<br>"+str.substring(index+1);
	return(str);
}
%>
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
           sql="use `member`";
           con.createStatement().execute(sql);
           String new_name=new String(request.getParameter("MemberName").getBytes("ISO-8859-1"),"UTF-8");
		   String new_id=new String(request.getParameter("MemberID").getBytes("ISO-8859-1"),"UTF-8");
		   String new_password=new String(request.getParameter("MemberPassword").getBytes("ISO-8859-1"),"UTF-8");
           String new_mail=request.getParameter("Mail");
           String new_memberSex=new String(request.getParameter("MemberSex").getBytes("ISO-8859-1"),"UTF-8");
           String new_memberPhone=new String(request.getParameter("MemberPhone").getBytes("ISO-8859-1"),"UTF-8");
		   String new_memberAddress=new String(request.getParameter("MemberAddress").getBytes("ISO-8859-1"),"UTF-8");	   
           java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());


		   
//Step 4: 執行 SQL 指令	
           sql="INSERT memberbook (`MemberID`, `MemberPassword`, `MemberName`, `Mail`, `MemberSex`, `MemberPhone`, `MemberAddress`, `Putdate`) ";
           sql+="VALUES ('" + new_id + "', ";
		   sql+="'"+new_password+"\', ";
		   sql+="'"+new_name+"\', ";
		   sql+="'"+new_mail+"\', ";
		   sql+="'"+new_memberSex+"\', ";
		   sql+="'"+new_memberPhone+"\', ";
		   sql+="'"+new_memberAddress+"\', ";
		   sql+="'"+new_date+"\' )";
		   


		
			
           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("view1.jsp");
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
