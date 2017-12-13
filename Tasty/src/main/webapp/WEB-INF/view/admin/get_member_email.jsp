<%@page import="com.tasty.vo.MemberTaste"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% List<MemberTaste> tasteList = (List<MemberTaste>)request.getAttribute("tasteList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet"
	href="${initParam.rootPath}/resource/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="${initParam.rootPath}/resource/sweetalert/css/sweetalert2.css">
<link type="text/css" rel="stylesheet"
	href="${initParam.rootPath}/resource/animate/animate.css">
<script type="text/javascript"
	src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${initParam.rootPath}/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${initParam.rootPath}/resource/sweetalert/js/sweetalert2.min.js"></script>
<script charset="UTF-8">


</script>
<title>YOLTY50:관리자:회원조회</title>
<style type="text/css">
thead{
	text-align:center;
}
tbody{
	text-align: center;
}
th{
	padding-left:40px;
	padding-right:50px;
	border-bottom:3px #000 solid;
}
td{
	border-bottom:1px #000 solid;
	line-height:30px;
	padding:10px;
	font-size:18px;
}
</style>
</head> 
<body>
<div style="margin-top:50px;">
	<h2>회원조회(Email)</h2>

		<p>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>연락처</th>
				<th>성별</th>
				<th>총 추천 수</th>
				<th>총 비추천 수</th>
				<th>인증 여부</th>
				<th>선호하는 맛</th>
				<th><form action="${initParam.rootPath }/admin/member_management.do" method='get'>
				<button type="submit" class="btn btn-info" style="margin-bottom:10px;">돌아가기</button>
				</form>
				</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${!empty requestScope.result }">
					<%-- <c:forEach var="result" items="${requestScope.result }"> --%>

						<tr>
							<td>${result.email }</td>
							<td>${result.name }</td>
							<td>${result.nickname }</td>
							<td>${result.phoneNum }</td>
							<td>${result.gender }</td>
							<td>${result.totalUps }</td>
							<td>${result.totalDowns }</td>
							<td>${result.memberCert }</td>
							<td>
							<c:forEach var="tastes" items="${result.memberTasteList}" varStatus="cnt">
									${tastes.taste.tasteName}
									<c:choose>
										<c:when test="${cnt.count == fn:length(result.memberTasteList)}">
												맛
										</c:when>
										<c:otherwise>
												맛 |
										</c:otherwise>
									</c:choose>
							</c:forEach>
								
							</td>
							<td>
							<form action="${initParam.rootPath }/admin/remove_member.do">
								<input type="hidden" name="email" value="${result.email }">
 							<button type="submit" class="btn btn-danger" >삭제</button>
							</form>
							</td>
						</tr>
					<%-- </c:forEach> --%>
				</c:when>
				<c:otherwise>
					<tr>
					<td>조회된 회원이 없습니다.</td>
					</tr>
				</c:otherwise>
				
			</c:choose>
		</tbody>
	</table>
</div>
</body>
</html>








