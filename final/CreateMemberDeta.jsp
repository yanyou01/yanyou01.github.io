<!-- Step 0: import library -->
<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<title>create table</title>
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
         else
           {
//Step 4: 執行 SQL 指令	        
           sql="DROP DATABASE IF EXISTS `member`";
           con.createStatement().execute(sql);
		   sql="CREATE DATABASE `member`";
           con.createStatement().execute(sql);
//Step 5: 顯示結果           
            out.println(" member建立成功");           
//Step 3: 選擇資料庫           
            sql="USE `member`";
            con.createStatement().execute(sql);
//Step 4: 執行 SQL 指令	        
            sql="CREATE TABLE `memberbook`";
            sql+="(`MemberNO` TINYINT(4) AUTO_INCREMENT,";
			sql+="`MemberID` VARCHAR(10),";
			sql+="`MemberPassword` VARCHAR(10),";
            sql+="`MemberName` VARCHAR(10),";
            sql+="`MemberSex` VARCHAR(30),";
            sql+="`MemberPhone` VARCHAR(30),";
			sql+="`Mail` VARCHAR(30),";
            sql+="`MemberAddress` TEXT,";
			sql+="`Putdate` DATE,";
            sql+="primary key(MemberNO))";
            con.createStatement().execute(sql);
//Step 5: 顯示結果           
            out.println("member建立成功");
        }
//Step 6: 關閉連線        
        con.close();
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
	