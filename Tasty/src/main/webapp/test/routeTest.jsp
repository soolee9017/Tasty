<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.tasty.vo.Member"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


현재 로그인한 이메일: <sec:authentication property="principal.email"/>
<a href='${initParam.rootPath}/route/getXYByEmail.do?email=<sec:authentication property="principal.email"/>' class="btn btn-default">루트 좌표 확인</a>



</body>
</html>