<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
   // 넘어오는 값 받기
   // http://localhost:8080/PrjJSP01/userlist.jsp?name=all
    String  name = request.getParameter("name");
	if( name == null ) 
		name = "all";
	System.out.println( name ); 
   
    // 연결 문자열
    // db Connection String
	String  driver  = "oracle.jdbc.OracleDriver";
	String  url     = "jdbc:oracle:thin:@192.168.0.22:1521:xe";
	String  dbuid   = "test";
	String  dbpwd   = "1234";	
	
	String  tag     =  "";
	
   // db 조회
    if( name.equals("all")  ) {
       Class.forName(driver);
       Connection         conn    = DriverManager.getConnection(url, dbuid, dbpwd);
       String             sql     = "";
       sql   += "SELECT * FROM TUSER ";
       sql   += " ORDER BY ID ASC";
       PreparedStatement  pstmt   = conn.prepareStatement( sql );
       ResultSet          rs      = pstmt.executeQuery();
       
       tag       = "<table>";
       while( rs.next() ) {  
    	   tag  +=  "<tr>";
    	   tag  +=  "<td>" +  rs.getInt(   "id"   )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("name" )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("userid" )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("passwd" )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("email" )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("regdate" )  +  "</td>";
    	   tag  +=  "</tr>";
       }
       tag           +=  "</table>";
       
       rs.close();
       pstmt.close();
       conn.close();
       
    } else {
    	
 	   Class.forName(driver);
       Connection         conn    = DriverManager.getConnection(url, dbuid, dbpwd);
       String             sql     = "";
       sql   += "SELECT * FROM TUSER ";
       sql   += " WHERE NAME LIKE ? ";
       sql   += " ORDER BY ID ASC ";
       PreparedStatement  pstmt   = conn.prepareStatement( sql );
       pstmt.setString( 1, "%" + name + "%" );
       ResultSet          rs      = pstmt.executeQuery();
       
       tag       = "<table>";
       while( rs.next() ) {  
    	   tag  +=  "<tr>";
    	   tag  +=  "<td>" +  rs.getInt(   "id"   )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("name" )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("userid" )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("passwd" )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("email" )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("regdate" )  +  "</td>";
    	   tag  +=  "</tr>";
       }
       tag           +=  "</table>";
       
       rs.close();
       pstmt.close();
       conn.close();	
    	
    }

   // 출력할 html 만들기

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   table, th, td { 
      border:1px solid black;
      border-collapse: collapse;
   }
   table  { width :80%; margin:0 auto;}
   td     { padding: 10px; }  
   h2     { text-align: center; }  
</style>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script>
   $( function() {
	   $('tr').on( {
		   mouseover : function() {
			   $(this).css({
				   background : 'cyan',
				   color      : 'white'
			   })
		   },
		   mouseout  : function() {
			   $(this).css({
				   background : 'white',
				   color      : 'black'
			   })
		   }		   
	   })
   })
</script>
</head>
<body>
   <h2>사용자 목록</h2>
   <p><%=tag %></p>
   
   <a href="tuserlist.html">Home</a>
</body>
</html>












