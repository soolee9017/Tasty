<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
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
});//end of document.ready

</script>
<style type="text/css">
*{
	text-decoration:none;
	list-style:none;
}
.item{
	width:600px;
	height:300px;
}
.slideImg{
	width:600px;
	height:300px;

}
</style>
</head>
<body>
<div style="margin-top:60px; margin-bottom:200px;">
	<h1>미션 상세페이지</h1>
	<fmt:formatDate var="stD" pattern = "yyyy-MM-dd" value = "${requestScope.result.startDate}" />
	<fmt:formatDate var="eD" pattern = "yyyy-MM-dd" value = "${requestScope.result.endDate}" />	
	<br> 미션번호 : ${requestScope.result.missionNum}
	<br> 미션이름 : ${requestScope.result.missionName}
	<br> 참여인원 : ${requestScope.result.currentPeople }/${requestScope.result.maxPeople }
	<br> 내용 : ${requestScope.result.missionContent}
	<br> 기간 : ${stD} ~	${eD}
	<br>
	<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:600px; height:300px;margin: 0 auto;">
  <!-- Indicators -->
  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
 <c:forEach var="missionPhoto" items="${requestScope.result.missionPhotoList}" varStatus="indexs">
  	<c:choose>
  		<c:when test="${indexs.index == 0}">
  			<div class="item active">
    		  <img class="slideImg" src="${initParam.rootPath }/photos/mission/${missionPhoto.photo.photoPath }" width="300px"height="300px">
   		 	</div>
  		</c:when>
  		<c:otherwise>
  		<div class="item">
  			<img class="slideImg" src="${initParam.rootPath }/photos/mission/${missionPhoto.photo.photoPath }" width="300px"height="300px">
  		</div>
  		</c:otherwise>
  	</c:choose>
</c:forEach>
	
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	
		


	<!--  기간이 지난 미션이면 참여하기대신 종료된 미션임을 알리고, 미션에 참여하기와, 미션 인증글 작성란을 보이지 않게 한다. -->
	<!--  미션 참여/ 취소 button -->
<c:set var="today" value="<%=new Date()%>"/>
<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today"/>
<fmt:formatDate var="eD" pattern = "yyyy-MM-dd" value = "${requestScope.result.endDate}" />	
<c:if test="${today <= eD }">
	<c:choose>
		<c:when test="${requestScope.isPeopleFull eq true}">
			<h3>미션에 참여한 인원이 가득 차있습니다.</h3>
			<c:if test="${requestScope.isMissionMember eq true}">
				<form action="${initParam.rootPath }/mission/cancelMissionMember.do"
					method="get">
					<input type="hidden" name="missionNum"
						value="${requestScope.result.missionNum}"> <input type="hidden"
						name="email" value="<sec:authentication property="principal.email"/>">
					<button type="submit" id="cancelmisBtn" class="btn btn-danger">참여한 미션 취소하기</button>
				</form>
		    </c:if>
	    </c:when>
	    <c:when test="${requestScope.isMissionMember eq false}">
			<form action="${initParam.rootPath }/mission/enterMissionMember.do"
				method="get">
				<input type="hidden" name="missionNum" value="${requestScope.result.missionNum}"> 
				<input type="hidden" name="email" value="<sec:authentication property="principal.email"/>">
				<button type="submit" id="regmisBtn" class="btn btn-primary">미션에 참여하기</button>
			</form>
	    </c:when>
	    <c:otherwise>
			<form action="${initParam.rootPath }/mission/cancelMissionMember.do"
				method="get">
				<input type="hidden" name="missionNum"
					value="${requestScope.result.missionNum}"> <input type="hidden"
					name="email" value="<sec:authentication property="principal.email"/>">
				<button type="submit" id="cancelmisBtn" class="btn btn-danger">참여한 미션 취소하기</button>
			</form>
	    </c:otherwise>
	</c:choose>
		<br>
		<br>
		<p>
		<p>
			<!-- 미션인증글 작성란 -->
		
		<c:choose>
		<c:when test="${requestScope.isMissionMember eq false}">
			<h3>미션에 참여하셔야 인증글을 작성할 수 있습니다.</h3>
	    </c:when>
	    <c:when test="${requestScope.isMissionMember eq true}">
			<!-- 여기 인증글 작성란 들어갈곳 -->
		<div
			style="width: 30%; background-color: gray; text-align: left; margin-left: 10px;">
	
			<form
				action="${initParam.rootPath }/missionCert/registerMissionCert.do"
				id="content" method="post" enctype="multipart/form-data">
				<sec:csrfInput />
				<input type="hidden" name="missionNum"
					value="${requestScope.result.missionNum }"> <input
					type="hidden" name="email"
					value='<sec:authentication property="principal.email"/>'> <input
					type="hidden" name="missionCertNum" value="0"> 제목 : <input
					type="text" name="title"><br> 인증 내용 :
				<textarea name="content" rows="5" cols="20"
					placeholder="인증글을 입력해주세요."></textarea>
				<br> 사진 등록 :
				<table id="photoList">
					<tr>
						<td><input type="file" name="upImage"></td>
						<td><button type="button" class="deletePhoto">사진삭제</button></td>
					</tr>
				</table>
				<button type="button" id="addPhoto">사진추가</button>
				<br>
				<br>
	
				<button id="missionCert" type="submit">미션 인증 완료</button>
			</form>
		</div>
	    </c:when>
	</c:choose>
	</c:if>
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
</div>
</body>
</html>