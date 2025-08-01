<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
//java 영역 / 서버영역

request.setCharacterEncoding("utf-8"); 
String q = request.getParameter("q").trim(); //검색어 값 저장

//db Connection String
String driver  = "oracle.jdbc.OracleDriver"; 
String url     = "jdbc:oracle:thin:@192.168.0.43:1521:xe"; 
String dbuid   = "test"; 
String dbpwd   = "1234"; 
String sql = "";

if(q.equals("all")){
	sql = "SELECT * FROM TUSER ORDER BY ID ASC";
	
} else {
	sql = "SELECT * FROM TUSER WHERE NAME LIKE '%" + q + "%' ORDER BY ID ASC";
	//sql = "SELECT * FROM TUSER WHERE NAME LIKE '%' + ? + '%' ORDER BY ID ASC";
}

Class.forName(driver);
Connection conn = DriverManager.getConnection(url, dbuid, dbpwd);
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
String msg = "<ul>";

while( rs.next() ){
	int id = rs.getInt("id");
	String name = rs.getString("name");
	String userid = rs.getString("userid");
	String passwd = rs.getString("passwd");
	String email = rs.getString("email");
	String regdate = rs.getString("regdate");
	
	String fmt = "<li>";
	fmt += "%d %s %s %s %s %s";
	fmt += "</li>";
	msg += String.format(fmt, id, name, userid, passwd, email, regdate);
}
msg += "</ul>";

pstmt.close();
rs.close();
conn.close();
%>
<!--  html 영역 (출력위주) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
  }
  
  table {
    width: 80%; margin: 0 auto;
  }
</style>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script>
   $( function() {
 
   })
</script>
</head>
<body>
<%=msg%>
<a href="jsp02.html">HOME</a>
</body>
</html>