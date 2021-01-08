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
           sql="use `members`";
           con.createStatement().execute(sql);
           String new_id=new String(request.getParameter("id").getBytes("ISO-8859-1"),"UTF-8");
           String new_pwd=new String(request.getParameter("pwd").getBytes("ISO-8859-1"),"UTF-8");



//Step 4: 執行 SQL 指令	
           sql="INSERT memberbook (`id`, `pwd`) ";
           sql+="VALUES ('" + new_id + "', ";
		   sql+="'"+new_pwd+"\', ";

		
			
           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("viewaccount.jsp");
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
