<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<h2>관리자 등록</h2>
<form action="${initParam.rootPath }/admin/register_admin.do" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="id">사용자 ID</label>
		<input type="text" name="userId" id="id" class="form-control">
	</div>
	<div class="form-group">
		<label for="password">패스워드</label>
		<input type="password" name="userPassword" id="password" class="form-control">
	</div>
	<div class="form-group">
		<label for="name">이름</label>
		<input type="text" name="userName" id="name" class="form-control">
	</div>
	<div class="form-group">
		<label for="email">이메일 주소</label>
		<input type="text" name="userEmail" id="email" class="form-control">
	</div>
	
	<button type="submit" class="btn btn-default">가입</button>
	<sec:csrfInput/><%-- csrf 토큰 --%>
</form>