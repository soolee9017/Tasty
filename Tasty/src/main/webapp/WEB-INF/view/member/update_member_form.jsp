<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>정보 수정</h2>
<c:if test="${not empty requestScope.errorMessage}">
	<div class="well text-danger">
		${requestScope.errorMessage }
	</div>
</c:if>
<form id="updateForm" action="${initParam.rootPath }/member/update_profile.do" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="id">사용자 ID</label>
		<input type="text" name="userId" id="id" class="form-control" value='<sec:authentication property="principal.userId"/>' readonly="readonly">
	</div>
	<div class="form-group">
		<label for="oldPassword">기존 패스워드</label>
		<input type="password" name="oldUserPassword" id="oldPassword" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="password">변경할 패스워드</label>
		<input type="password" name="userPassword" id="password" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="name">이름</label>
		<input type="text" name="userName" id="name" class="form-control" value='<sec:authentication property="principal.userName"/>' required="required">
	</div>
	<div class="form-group">
		<label for="email">이메일 주소</label>
		<input type="text" name="userEmail" id="email" class="form-control" value='<sec:authentication property="principal.userEmail"/>' required="required">
	</div>
	<div class="row">
		<div class="col-sm-12">
			<span id="changeSpan">
				<button id="imgChangeBtn" type="button" class="btn btn-success">사진변경</button>
				<img id="userImage" src="${initParam.rootPath }/memberImage/<sec:authentication property='principal.userImage'/>" class="img-responsive" width="350px">
			</span>
			<span id="cancelSpan" style="display: none;">
				<button id="cancelImgChangeBtn" type="button" class="btn btn-success">사진변경취소</button>
				<input type='file' name='memberImage' id='memberImage' class='form-control'>
			</span>
		</div>
	</div>
	<button type="submit" class="btn btn-default">정보수정</button>
	<sec:csrfInput/><%-- csrf 토큰 --%>
</form>


<script>