<%@page import="com.tasty.vo.Member"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page
	import="org.springframework.security.core.context.SecurityContext"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function button_event(){
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		$("#remMisCForm").submit();
	    //document.form.submit();
	}else{   //취소
	    return;
	}
}


</script>
</head>
<body>
<div style="margin-top:60px;">
<h1> 미션 인증글 상세페이지</h1>

제목 : ${requestScope.missionCert.title}<br>
내용 : ${requestScope.missionCert.content}<br>
사진 : 
<br><br>
		<br> <br>
		<c:forEach var="missionCertPhoto"
			items="${requestScope.missionCert.missionCertPhotoList}">
			<c:if test="${missionCertPhoto.photoNum ne 0}">
				<img
					src="${initParam.rootPath }/photos/missionCert/${missionCertPhoto.photo.photoPath }"
					width="300px">
			</c:if>
		</c:forEach>
		
		<!-- 글을 작성한사람만 인증글 수정하기, 삭제하기 가능함. -->
		<sec:authorize access="isAuthenticated()">
			<%
				String email = ((Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal())
							.getEmail();
					pageContext.setAttribute("email", email);
			%>
			<c:if test="${requestScope.missionCert.email==email}">
				<!-- 삭제버튼과 내용 수정버튼 -->
				<form action="${initParam.rootPath }/missionCert/moveToModifyMisCert.do" method="get">
					<input type="hidden" name="missionCertNum" value="${requestScope.missionCert.missionCertNum}">
					<button type="submit" id="modMisCBtn">미션 인증글 수정하기</button>
				</form>

				<form id="remMisCForm" action="${initParam.rootPath }/missionCert/removeMissionCertByMCN.do" method="get">
					<input type="hidden" name="missionCertNum" value="${requestScope.missionCert.missionCertNum}">
					<button type="button" id="remMisCBtn" onclick="button_event()">삭제하기</button>
				</form>
			</c:if>
		</sec:authorize>
		<!-- 미션상세페이지로 돌아가는 button -->
		<br>
		<button type="submit" onclick="window.location.href='getMissionCertByMN.do?missionNum=${requestScope.missionCert.missionNum}'">미션상세페이지로돌아기</button>

	</div>
</body>
</html>