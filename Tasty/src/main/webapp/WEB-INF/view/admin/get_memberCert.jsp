<%@page import="com.tasty.vo.MemberTaste"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% List<MemberTaste> tasteList = (List<MemberTaste>)request.getAttribute("tasteList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YOLTY50:관리자:회원조회</title>
</head>
<body>
	<h2>회원조회(인증여부)</h2>
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
				<button type="submit" class="btn btn-default">돌아가기</button>
				</form>
				</th>
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
							<td>

							<c:forEach var="tastes" items="${result.memberTasteList }">
									${tastes.taste.tasteName}
							</c:forEach>
							</td>
							<td>
							<form action="${initParam.rootPath }/admin/remove_member.do">
								<input type="hidden" name="email" value="${result.email }">
 							<button type="submit">삭제</button>
 							</form>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
					<td>조회된 회원이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</body>
</html>