<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href="${initParam.rootPath }/resource/jquery/jquery-ui.theme.min.css">
<script type="text/javascript" src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resource/jquery/jquery-ui.min.js"></script>
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
   
     
	$("#regmisBtn").on("click", function(){
		if("${requestScope.outcome}"==0){
			alert("이미 참여한 미션입니다.");
		}else{
		alert("미션에 참여하셨습니다.");
		}
	});//end of regmisBtn
	
	$("#cancelmisBtn").on("click", function(){
		if("${requestScope.outcome}"==0){
			alert("참여하지 않은 미션입니다.");
		}else{
		alert("미션에 참여를 취소하셨습니다.");
		}
	});//end of regmisBtn
	$("#delMisBtn").on("click", function(){
		alert("삭제 성공");
	});
	
	var dateFormat = "yy-mm-dd",
    from = $( "#startDate" )
      .datepicker({	         
        dateFormat: dateFormat,
        changeYear: true,
        changeMonth: true	          
      })
      .on( "change", function() {
        to.datepicker( "option", "minDate", getDate( this ) );
      }),
    to = $( "#endDate" )
    	.datepicker({	         
        dateFormat: dateFormat,
        changeYear: true,
        changeMonth: true	          
      })
    .on( "change", function() {
      from.datepicker( "option", "maxDate", getDate( this ) );
    });

  function getDate( element ) {
    var date;
    try {
      date = $.datepicker.parseDate( dateFormat, element.value );
    } catch( error ) {
      date = null;
    }

    return date;
  }	
   
});//end of document.ready

</script>
</head>
<body>
	<br>
	<br>
	<br>
	<h1>미션 수정페이지</h1>
	<fmt:formatDate var="startDate" pattern = "yyyy-MM-dd" value = "${requestScope.result.startDate }" />
	<fmt:formatDate var="endDate" pattern = "yyyy-MM-dd" value = "${requestScope.result.endDate }" />
	
	<form action="${initParam.rootPath }/mission/modifyMission.do" method="post" enctype="multipart/form-data">
	<sec:csrfInput/>
		<input type="hidden" name="missionNum" value="${requestScope.result.missionNum }" />
		미션이름 : <input type="text" name="missionName" value="${requestScope.result.missionName }" /><br>
		미션 내용 :<br> 
		<textarea name="missionContent" cols="40" rows="8" >${requestScope.result.missionContent }</textarea><br>
		<input type="hidden" name="currentPeople" value="${requestScope.result.currentPeople }" />
		최대인원 : <input type="number" name="maxPeople" value="${requestScope.result.maxPeople }" /> <br>
		미션 시작일 : <input type="text" name="startDate" id="startDate" value="${startDate }" /> <br>
		미션 종료일 : <input type="text" name="endDate" id="endDate" value="${endDate }" /><br>
		
	<%-- <c:forEach var="missionPhoto" items="${requestScope.result.missionPhotoList}">
		<img src="${initParam.rootPath }/photos/mission/${missionPhoto.photo.photoPath }" width="300px">
	</c:forEach> --%>
	
		<!-- <table id="photoList">
			<tr>
				<td><input type="file" name="upImage"></td>
				<td><button type="button" class="deletePhoto">사진삭제</button></td>
			</tr>
		</table> -->
		<button type="submit">수정하기</button>
	</form>
		
	<!-- 미션 삭제하기 -->
	<h2>미션 삭제하기</h2>
	<form id="delMisForm" action="${initParam.rootPath }/mission/removeMissionByMissionNum.do" method="get">
		<input type="hidden" name="missionNum" value="${requestScope.result.missionNum}">
		<button type="submit" id="delMisBtn">미션 삭제하기</button>
	</form>
	<br>
	<br>
	<p>
	<p>
	<br>
	<br>인증글 게시판
	<br>

	<table class="table" style="width: 50%;">
		<thead>
			<tr>
				<th>인증번호</th>
				<th>제목</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="missionCert" items="${requestScope.certList}">
				<tr>
					<td>${missionCert.missionCertNum}</td>
					<td><a
						href='${initParam.rootPath}/missionCert/getMissionCertByNum.do?missionCertNum=${missionCert.missionCertNum}'>${missionCert.title}</a></td>
					<td>${missionCert.email}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table> 

</body>
</html>