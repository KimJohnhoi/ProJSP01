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
       
       tag     = "<table id='t2'>";
       while( rs.next() ) {  
    	   tag  +=  "<tr>";
    	   tag  +=  "<td>" +  rs.getInt(   "id"   )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("name" )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("userid" )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("passwd" )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("email" )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("regdate" )  +  "</td>";
    	   tag  +=  "<td><a href='deluser.jsp?id=" + rs.getInt("id") + "'>❌</a></td>";
    	   tag  +=  "</tr>";
       }
       tag    +=  "</table>";
       
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
       
       tag    = "<table id='t2'>";
       while( rs.next() ) {  
    	   tag  +=  "<tr>";
    	   tag  +=  "<td>" +  rs.getInt(   "id"   )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("name" )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("userid" )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("passwd" )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("email" )  +  "</td>";
    	   tag  +=  "<td>" +  rs.getString("regdate" )  +  "</td>";
    	   tag  +=  "<td><a href='deluser.jsp?id=" + rs.getInt("id") + "'>❌</a></td>";
    	   tag  +=  "</tr>";
       }
       tag    +=  "</table>";
       
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
   a {text-decoration: none; }
   table, th, td { 
      border:1px solid black;
      border-collapse: collapse;
   }
   table  { width :80%; margin:0 auto;}
   td     { padding: 10px; }  
   h2     { text-align: center; }  
   
   #t1   td  { text-align : center; }
   #t1   td:nth-of-type(1) input  {width:40px;}
   #t1   td:nth-of-type(2) input  {width:120px;}
   #t1   td:nth-of-type(3) input  {width:120px;}
   #t1   td:nth-of-type(4) input  {width:120px;}
   #t1   td:nth-of-type(5) input  {width:120px;}
   #t1   td:nth-of-type(6) input  {width:120px;}
    
   #t1   [name="name"], [name="passwd"], [name="email"] { border:2px solid red;   }
</style>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script>
   $( function() {
	   //console.log($('tr'))
	   $('#t2 tr').on( {
		   mouseover : function() {
			   $(this).css({
				   background : 'cyan',
				   color      : 'red'
			   })
		   },
		   mouseout  : function() {
			   $(this).css({
				   background : 'white',
				   color      : 'black'
			   })
		   },
		   dblclick : function() {
			 //alert('ggg');
			  console.dir(this) //dblclick 한 tr
			  
			  for(var i=0; i < this.childNodes.length-1; i++){
				  let td = this.childNodes[i]
				  const input = document.querySelectorAll('#t1 input')[i]
				  input.value = td.innerHTML
			  }
			  
			  /*this.childNodes.forEach(function(td, i){
				  $('#t1 input').eq(i).val( td.innerHTML ) 
	      })*/
	      //name = this.childNodes[1].innerHTML
       //$('#t1  [name="name"]').val(name)
       // alert(name)
		   }
	   })
   })
</script>
</head>
<body>
   <h2>사용자 목록</h2>
   <!-- 수정 -->
   <form action="updateuser.jsp" method="post">
   <table id="t1">
	   <tr>
		   <td><input type="text" name="id" readonly /></td>
		   <td><input type="text" name="name" /></td>
		   <td><input type="text" name="userid" readonly/></td>
		   <td><input type="text" name="passwd" /></td>
		   <td><input type="text" name="email" /></td>
		   <td><input type="text" name="regdate" readonly/></td>
		   <td><input type="submit" value="수정" /></td>
	   </tr>
   </table>
   </form>
   <!--  목록  -->
   <p><%=tag %></p>
   <a href="tuserlist.html">Home</a>
</body>
</html>












