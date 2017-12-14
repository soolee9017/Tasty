<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
   /*사진추가 button*/
   $("#addPhoto").on("click",function() {
      var html = '<tr><td>'
      + '<input type="file" name="upImage">'
      + '</td>';
      html += '<td><button type="button" class="deletePhoto">사진삭제</button>';
      html += '</td></tr>';
      $("#photoList").append(html);
      });//end of addPhoto


   $("#photoList").on("click",".deletePhoto", function() {
      $(this).parent().parent().remove();
   });//end of photoList
});
</script>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h1>미션 인증글 수정 페이지</h1>
	<div>
		<form
			action="${initParam.rootPath }/missionCert/modifyMissionCertByMCN.do"
			method="post" enctype="multipart/form-data">
			<sec:csrfInput/>
			<input type="hidden" name="missionCertNum" value="${requestScope.missionCert.missionCertNum }"> 
			제목 : <input type="text" name="title" value="${requestScope.missionCert.title}"><br>
			내용 : <textarea name="content">${requestScope.missionCert.content}</textarea>
			<input type="hidden" name="missionNum" value="${requestScope.missionCert.missionNum }">
			<table id="photoList">
			<tr>
				<td><input type="file" name="upImage"></td>
				<td><button type="button" class="deletePhoto">사진삭제</button></td>
			</tr>
		</table>
		<button type="button" id="addPhoto">사진추가</button>
		<br>
		<button type="submit">수정하기</button>

		</form>
		<br>
		<br>
		<br>
		<c:forEach var="missionCertPhoto" items="${requestScope.missionCert.missionCertPhotoList}">
			<c:if test="${missionCertPhoto.photoNum ne 0}">
				<form method="get" action="${initParam.rootPath }/missionCert/deleteMissionCertPhoto.do">
					<input type="hidden" name="missionCertNum" value="${requestScope.missionCert.missionCertNum }" /> 
					<input type="hidden" name="photoNumber" value="${missionCertPhoto.photo.photoNum }" /> 
					<img src="${initParam.rootPath }/photos/missionCert/${missionCertPhoto.photo.photoPath }" width="300px">
					<button type="submit">사진 삭제</button>
				</form>
			</c:if>
		</c:forEach>
		
		
		<form action="${initParam.rootPath }/missionCert/getMisisonCertByMCN">
		<input type="hidden" name="missionCertNum" value="${requestScope.missionCert.missionCertNum }">
		<button type="submit" id="">이전페이지로 이동하기</button>
		</form>

	</div>
</body>
</html>