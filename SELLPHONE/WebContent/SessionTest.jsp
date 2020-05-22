<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
세션ID:
<%= session.getId() %><br>
authUser : <%= session.getAttribute("authUser") %><br>
authUserId : <%= session.getAttribute("authUserId") %><br>
authUserName : <%= session.getAttribute("authUserName") %><br>
</body>
</html>
