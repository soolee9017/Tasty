<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="container" style="font-size: 20px;">
	<div class="row">
		<div class="col-sm-12">
			<h1>본인정보 조회결과</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2">사용자 ID</div>
		<div class="col-sm-10"><sec:authentication property="principal.email"/></div>
	</div>
	<div class="row">
		<div class="col-sm-2">이름</div>
		<div class="col-sm-10"><sec:authentication property="principal.name"/></div>
	</div>
	<div class="row">
		<div class="col-sm-2">닉네임</div>
		<div class="col-sm-10"><sec:authentication property="principal.nickname"/></div>
	</div>
	<div class="row">
		<div class="col-sm-2">연락처</div>
		<div class="col-sm-10"><sec:authentication property="principal.phoneNum"/></div>
	</div>
	<div class="row">
		<div class="col-sm-2">성별</div>
		<div class="col-sm-10"><sec:authentication property="principal.gender"/></div>
	</div>

	
	<div class="row" style="margin-top:20px">
		<div class="col-sm-12">
			<a href="${initParam.rootPath }/review/getAllTaste3.do" class="btn btn-default">정보수정</a>
		</div>
	</div>
</div>