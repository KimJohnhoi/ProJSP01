<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 넘어온 정보를 변수에 받는다
    request.setCharacterEncoding("utf-8");  // 넘어온 한글처리
    String    userid   = request.getParameter("userid");
    
    // db 연결
    String  driver  = "oracle.jdbc.OracleDriver";
    String  url     = "jdbc:oracle:thin:@192.168.0.22:1521:xe";
    String  dbuid   = "test";
    String  dbpwd   = "1234"; 
    
    // db 에 저장
    Class.forName(driver);
    Connection         conn    = DriverManager.getConnection(url, dbuid, dbpwd);
    String             sql     = "";
    sql   += "DELETE FROM TUSER ";
    sql   += " WHERE ID = ? ";
   
    PreparedStatement  pstmt   = conn.prepareStatement( sql );
    pstmt.setInt( 1, Integer.parseInt(userid) );
    
    pstmt.executeUpdate();   // insert, delete, update
    pstmt.close();
    conn.close();
      
    // 돌아간다
    String   loc = "http://localhost:8080/PrjJSP01/user/userlist.jsp?name=all";
    response.sendRedirect(loc);
%>