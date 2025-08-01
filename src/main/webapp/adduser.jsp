<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 넘어온 정보를 변수에 받는다
    request.setCharacterEncoding("utf-8");  // 넘어온 한글처리
    String    name     =  request.getParameter("name");
    String    userid   =  request.getParameter("userid");
    String    passwd   =  request.getParameter("passwd");
    String    email    =  request.getParameter("email");
    
    // db 연결
    String  driver  = "oracle.jdbc.OracleDriver";
	String  url     = "jdbc:oracle:thin:@192.168.0.22:1521:xe";
	String  dbuid   = "test";
	String  dbpwd   = "1234";	
    
    // db 에 저장
    Class.forName(driver);
    Connection         conn    = DriverManager.getConnection(url, dbuid, dbpwd);
    String             sql     = "";
    sql   += "INSERT INTO  TUSER ( ID,           NAME, USERID, PASSWD, EMAIL ) ";  
    sql  +=	 "  VALUES           ( SEQID.NEXTVAL, ?,   ?,      ?,      ?     )";
   
    PreparedStatement  pstmt   = conn.prepareStatement( sql );
    pstmt.setString( 1,  name     );
    pstmt.setString( 2,  userid   );
    pstmt.setString( 3,  passwd   );
    pstmt.setString( 4,  email    );
    
    pstmt.executeUpdate();   // insert, delete, update
    
    pstmt.close();
    conn.close();
      
    // 돌아간다
    String   loc = "http://localhost:8080/PrjJSP01/userlist.jsp?name=all";
    response.sendRedirect(loc);
%>















