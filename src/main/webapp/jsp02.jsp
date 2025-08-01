<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  // http://192.168.0.11:8080/PrjJSP01/jsp02.jsp?q=123&r=abc
    request.setCharacterEncoding("utf-8");    
   // 한글 인코딩 처리, 최신버전 필요X, 과거 filter 로 생략가능
    
    String  q = request.getParameter("q");
    String  r = request.getParameter("r");
%>    
    
<!DOCTYPE html>
 <html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h2>넘어온 값 : <%= q %></h2>
  <p><%= r %></p>
</body>
</html>