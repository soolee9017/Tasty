<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<h2>관리자 등록</h2>
<form action="${initParam.rootPath }/admin/register_admin.do" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="id">Email</label>
		<input type="text" name="email" id="email" class="form-control">
	</div>
	<div class="form-group">
		<label for="password">비밀번호</label>
		<input type="password" name="password" id="password" class="form-control">
	</div>
	<div class="form-group">
		<label for="name">이름</label>
		<input type="text" name="name" id="name" class="form-control">
	</div>
	<div class="form-group">
		<label for="email">닉네임</label>
		<input type="text" name="nickname" id="nickname" class="form-control">
	</div>
	
	<button type="submit" class="btn btn-default">가입</button>
	<sec:csrfInput/><%-- csrf 토큰 --%>
</form>