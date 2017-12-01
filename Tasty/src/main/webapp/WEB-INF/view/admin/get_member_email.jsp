<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YOLTY50:관리자:회원조회</title>
</head>
<body>
	<h2>회원조회(Email)</h2>
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
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${!empty requestScope.result }">
					<c:forEach var="result" items="${requestScope.result }">

						<tr>
							<td>${result.email }</td>
							<td>${result.name }</td>
							<td>${result.nickname }</td>
							<td>${result.phoneNum }</td>
							<td>${result.gender }</td>
							<td>${result.totalUps }</td>
							<td>${result.totalDowns }</td>
							<td>${result.memberCert }</td>
							<td></td>
							<td></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>
</body>
</html>