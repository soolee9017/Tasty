<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
a:link {
	/*방문하지 않은 링크 설정.*/
	text-decoration: none; /*밑줄 안나오도록 처리.*/
}

a:visited {
	/*방문한 링크 설정*/
	text-decoration: none;
}

a:hover {
	/*마우스 포인터가 올라간 시점의 설정.*/
	text-decoration: underline;
}

a:active {
	/*마우스를 링크에 클릭하는 시점*/
	color: blue;
}

table, td, th {
	border: 1px solid gray;
}

table {
	left:31%;
	position:relative; 
	margin-top : 100px;
	border-collapse: collapse;
	width: 500px;
	margin-top: 50px;
}

td, th {
	padding: 10px;
}


</style>

<style>
body{
	background-color:rgb(235,235,235);
}
.leftTile {
	float: left;
	padding-left: 40px;
	width: 40%;
}

.rightTile {
	width: 60%;
	margin-left: 240px;
}
.leftMenuList > div > ul{
	width:100%;
}
.leftMenuList > div > ul > li{
	width:100%;
	height:50px;
	border-bottom:1px #000 solid;
}
.leftMenuList > div > ul > li:hover{
	background-color:rgb(245,245,245);
}
.leftMenuList > div > ul > li > a{
	line-height:50px;
	color:#000;
	text-decoration:none;
	-webkit-transition:1s;
	font-size:15px;
}
.row > div > div{
	border-bottom:1px #000 solid;
	height:60px;
}
.row > div > div > div{
	line-height:60px;
}
</style>
<body>
<div class="leftMenuList" style="margin-top: 50px; float: left; width: 250px; position:absolute; left:10%; top:12%;">
	<div>
		<ul>
			<li><a
				href='${initParam.rootPath }/review/getReviewByEmail.do?email=<sec:authentication property="principal.email"/>'>내가
					작성한 리뷰 보기</a></li>
			<li><a
				href='${initParam.rootPath}/route/getRouteByEmail.do?email=<sec:authentication property="principal.email"/>'>내가 작성한 루트 보기</a></li>
			
				<li><a
				href='#'>내가 참여중인 미션 보기</a></li>
			
			
			
			<li><a href="${initParam.rootPath }/review/getAllTaste3.do">정보수정</a></li>
			<li><a onclick="return confirm('정말 탈퇴하시겠습니까?');"
				href="${initParam.rootPath }/member/withdraw_member.do?email=<sec:authentication property="principal.email"/>">탈퇴</a></li>
		</ul>
	</div>
</div>
<br><br><br><br>



<table>
<thead>
	<tr>
		<th width="15%;">NO.</th>
		<th width="85%;" style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${requestScope.map.bigList}" var="Route">
		<tr>
			<td>${Route.routeNum}</td>
			<td><a href='${initParam.rootPath}/route/getRouteByNum2.do?number=${Route.routeNum}'>${Route.routeName}</a></td>
		</tr>
	</c:forEach>
</tbody>

</table>

<%String email = (String)request.getAttribute("email"); %>
<%-- 페이징 처리 --%>
	<p>
		<%--첫페이지로 이동--%>
		<a href="${initParam.rootPath }/route/getRouteByEmail.do?page=1&email=<%=email%>">첫페이지&nbsp;&nbsp;</a>


		<%--
		이전 페이지 그룹 처리.
		만약에 이전페이지 그룹이 있으면 링크처리하고 
		없으면 화살표만 나오도록 처리.
	 --%>

		<c:choose>
			<c:when test="${requestScope.map.pageBean.previousPageGroup }">
				<a
					href="${initParam.rootPath }/route/getRouteByEmail.do?page=${requestScope.map.pageBean.beginPage-1}&email=<%=email%>">
					◀ </a>
			</c:when>
			<c:otherwise>
		◀
		</c:otherwise>
		</c:choose>

		<%-- 
		현재 page가 속한 page 그룹내의 페이지들 링크.
		현재 pageGroup의 시작page ~ 끝 page
		- 만약에 p가 현재페이지면 링크처리를 하지 않고 p가 현재페이지가 아니라면 링크처리.
	 --%>
		<c:forEach begin="${requestScope.map.pageBean.beginPage }"
			end="${requestScope.map.pageBean.endPage }" var="num">
			<c:choose>
				<c:when test="${num == requestScope.map.pageBean.page }">
				${num }
			</c:when>
				<c:otherwise>
					<a
						href="${initParam.rootPath }/route/getRouteByEmail.do?page=${num}&email=<%=email%>">${num }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>




		<%-- 
		다음페이지 그룹으로 이동
		만약에 다음페이지 그룹이 있으면 링크 처리 없으면 화살표만 나오도록 처리
	 --%>
		<c:choose>
			<c:when test="${requestScope.map.pageBean.nextPageGroup }">
				<a
					href="${initParam.rootPath }/route/getRouteByEmail.do?page=${requestScope.map.pageBean.endPage+1}&email=<%=email%>">▶</a>
			</c:when>
			<c:otherwise>
	 	▶
	 	</c:otherwise>
		</c:choose>



		<%-- 마지막 페이지로 이동 --%>
		<a
			href="${initParam.rootPath }/route/getRouteByEmail.do?page=${requestScope.map.pageBean.totalPage }&email=<%=email%>">마지막페이지</a>

	</p>

</body>
</html>


