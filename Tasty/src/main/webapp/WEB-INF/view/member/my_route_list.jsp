<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
			<li><a
				href='${initParam.rootPath }/member/withdraw_member.do?email=<sec:authentication property="principal.email"/>'>탈퇴</a></li>
		</ul>
	</div>
</div>
<br><br><br><br>



<div class="row"
	style="font-size: 20px; margin-top: 70px; width: 500px; left: 36%; position: relative;">
<table>
<thead>
	<tr>
		<th>루트번호</th>
		<th>루트제목</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${requestScope.listOfRoute}" var="Route">
		<tr>
			<td>${Route.routeNum}</td>
			<td><a href='${initParam.rootPath}/route/getRouteByNum.do?number=${Route.routeNum}'>${Route.routeName}</a></td>
		</tr>
	</c:forEach>
</tbody>

</table>
</div>


