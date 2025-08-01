<%@page import="java.util.Date"%>    <!-- new Date() -->
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String            header = "Hello World !!!";
    Date              today  = new Date();   // import  ctrl+shoift+m
    SimpleDateFormat  sdf    = new SimpleDateFormat("yyyy년 MM 월 dd 일");
    String            now    = sdf.format( today ); 
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
  <h1><%=header %></h1>
  <p>서버의 시간(JSP)</p>
  <p><%=now %></p>
  <p>클라이언트의 시간(Javascript)<p>
  <p></p>
  
  <script>
    const lastP     = document.querySelector('p:last-of-type')
    let   today     = new Date();
    lastP.innerHTML = today.toLocaleString();  
    
  </script>
</body>
</html>







