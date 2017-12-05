<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="com.tasty.vo.Member"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
   href="${initParam.rootPath}/resource/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" media="all"
   href="${initParam.rootPath}/resource/bootstrap/css/star-rating.css">
<script type="text/javascript"
   src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
   src="${initParam.rootPath}/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
   src="${initParam.rootPath}/resource/bootstrap/js/star-rating.js"></script>

</head>
<body>



<h2>가게 이름: ${requestScope.review.storeName }</h2>
<h3>가게 주소:${requestScope.review.address } </h3>
<br>
<input id="s" name="rating" readonly="" type="text" class="rating rating-loading" value="${requestScope.review.ratings}" data-size="sm" title="">
<h4>평점 : ${requestScope.review.ratings } /5.0</h4>
<h4>제목: ${requestScope.review.title}</h4>
<h4>내용: ${requestScope.review.content}</h4>



<c:forEach items="${requestScope.review.menuList }" var="menu">
	메뉴 ${menu.menuName } : 
	<c:forEach items="${menu.mtList }" var="menuTaste">
		${menuTaste.allTaste.taste.tasteName}맛 ${menuTaste.allTaste.degree.degree} 단계,
	</c:forEach>
	<br>
</c:forEach>



<c:forEach items="${requestScope.review.reviewPhotoList}" var="reviewPhoto">
	<img src="${initParam.rootPath }/photos/review/${reviewPhoto.photoList[0].photoPath}" width="300px">
	
</c:forEach>

<br><br>




<%
	String email = ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getEmail();
	pageContext.setAttribute("email",email);

%>


<c:if test="${requestScope.review.email==email}">
		<a href="${initParam.rootPath}/review/changeReview.do?reviewNum=${requestScope.review.reviewNum}"><button>내용 수정</button></a>		
</c:if> 

</body>
</html>