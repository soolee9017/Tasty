<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#testBtn").on("click",function(){
	 	if($('input:checkbox[name="tastes"]:checked').length > 3){
			alert("맛추가안됨다");
			$('input:checkbox[name="tastes"]').prop("checked", false);
			return;
		}
	});

});

</script>

<h2>정보 수정 가입</h2>
<c:if test="${not empty requestScope.errorMessage}">
	<div class="well text-danger">
		${requestScope.errorMessage }
	</div>
</c:if>
<form id="updateForm" action="${initParam.rootPath }/member/update_profile.do" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="id">사용자 ID</label>
		<input type="text" name="email" id="id" class="form-control" value='<sec:authentication property="principal.email"/>' readonly="readonly">
	</div>
	<div class="form-group">
		<label for="oldPassword">기존 패스워드</label>
		<input type="password" name="oldPassword" id="oldPassword" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="password">변경할 패스워드</label>
		<input type="password" name="NewPassword" id="password" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="name">이름</label>
		<input type="text" name="name" id="name" class="form-control" value='<sec:authentication property="principal.name"/>' required="required">
	</div>
	<div class="form-group">
		<label for="nickname">닉네임</label>
		<input type="text" name="nickname" id="nickname" class="form-control" value='<sec:authentication property="principal.nickname"/>' required="required">
	</div>
	<div class="form-group">
		<label for="phoneNum">전화번호</label>
		<input type="text" name="phoneNum" id="phoneNum" class="form-control" value='<sec:authentication property="principal.phoneNum"/>' required="required">
	</div>
    <div class="form-group">
      <label for="gender">성별</label>
      <label><input type='radio' name='gender' value='female'/>여성</label>
      <label><input type='radio' name='gender' value='male'/>남성</label>
   </div>
	
	<div class="form-group">
      <label for="tastes">맛</label><br>
      <span id="tastes">
      <c:forEach items="${requestScope.tasteList}" var='taste'>
				<label><input type="checkbox" name="tastes" id="tastes" required="required">${taste.tasteName}</label>
		</c:forEach>
		</span>
   </div>
	
	<sec:csrfInput/><%-- csrf 토큰 --%>
	<button type="submit" id="testBtn" class="btn btn-default">정보수정</button>
</form>




