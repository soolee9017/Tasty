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
<br><br><br>
<c:forEach items="${requestScope.missionCert.missionCertPhotoList}" var="missionCertPhoto">
	<img src="${initParam.rootPath }/photos/missionCert/${missionCertPhoto.photo.photoPath }" width="300px">
</c:forEach>


<form action="${initParam.rootPath }/missionCert/moveToModifyMisCert.do" method="get">
	<input type="hidden" name="missionCertNum" value="${requestScope.missionCert.missionCertNum }">
	<button type="submit" id="modMisCBtn">미션 인증글 수정하기</button>
</form>

<form id="remMisCForm" action="${initParam.rootPath }/missionCert/removeMissionCertByMCN.do" method="get">
	<input type="hidden" name="missionCertNum" value="${requestScope.missionCert.missionCertNum }">
	<button type="button" id="remMisCBtn" onclick="button_event()">삭제하기</button>
</form>
<button type="submit" onclick="window.location.href='getMissionCertByMN.do?missionNum=${requestScope.missionCert.missionNum}'">미션상세페이지로 돌아기</button>

</div>
</body>
</html>