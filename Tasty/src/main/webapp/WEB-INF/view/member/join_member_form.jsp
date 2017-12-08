<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document).ready(function() {
		
		$(".tastes").on("click", function() {
			if ($('input:checkbox[name="tastes"]:checked').length >= 3) {
				$('input:checkbox[name="tastes"]').attr("disabled",true);
				$('input:checkbox[name="tastes"]:checked').attr("disabled",false);
				return;
			}else{
				$('input:checkbox[name="tastes"]').attr("disabled",false);
			}
		});
	});
	
	function joinSuccess() {
		var flag = confirm("회원가입을 완료 하시겠습니까?");
	}
	
	function checkPop(){
		var email = $("input[name='email']").val();
		$("#duplcheckBtn").on("click", function(){
			$.ajax({
				"url":"/Tasty/duplicatedCheck.do",
				"data":"name="+$("input[name='email']").val(),
				"success":function(data){
					window.open("", "newWin", "width=450, height=215");
				}
			})
		})
	}
	

			
		$.ajax(
			"url":"/tasty/duplicatedCheck.do",
			"data":"email="+
		window.open("${initParam.rootPath}/emailCheck.do?email="+email, "newWin","width=450, height=215");
	} 
	 
	
</script>
<style>
	.form-group{
		margin-bottom:20px;
	}
</style>
<p class="center-block" style="height:1px; width:800px; background-color:#000;"></p>

<div class="row center-block text-center" style="width: 800px; margin-top: 60px;">
	<div class="text-left">
		<h2>회원 가입</h2>
	</div>
	<form action="${initParam.rootPath }/join_member.do" method="post"
		onsubmit="return joinSuccess();">
		<p style="background-color:#000; height: 1px; width: 100%; margin-bottom:10px;"></p>
		<div class="form-group">
			<label for="id">사용자 ID</label> <input type="text" name="email"
				id="id" class="form-control" required="required"
				style="text-align: center;">
		</div>
				 <%-- <form action="${initParam.rootPath }/WEB-INF/view/member/email_check.jsp" method="POST">
					<input type="hidden" name="email" value="email"> --%>
		<button id="testBtn" class="btn btn-default" onclick="checkPop()">중복 확인</button><p> 
			<!-- 	</form>  -->
				
			

		<div class="form-group">
			<label for="password">패스워드</label> <input type="password"
				name="password" id="password" class="form-control"
				required="required" style="text-align: center;">
		</div>
		<div class="form-group">
			<label for="name">이름</label> <input type="text" name="name" id="name"
				class="form-control" required="required" style="text-align: center;">
		</div>
		<div class="form-group">
			<label for="nickname">닉네임</label> <input type="text" name="nickname"
				id="nickname" class="form-control" required="required"
				style="text-align: center;">
		</div>
		<div class="form-group">
			<label for="phoneNum">전화번호</label> <input type="text" name="phoneNum"
				id="phoneNum" class="form-control" required="required"
				style="text-align: center;">
		</div>
		<div>
			<div class="form-group" style="float: left; width:30%;">
				<label for="gender"><h2>성별</h2></label><br>
				<label><input type='radio' name='gender' value='female' required="required" />여성</label>&nbsp;&nbsp;&nbsp;
				<label><input type='radio' name='gender' value='male' />남성</label>
			</div>

			<div class="form-group" style="float: right; width:70%;">
				<label for="tastes"><h2>맛</h2></label>&nbsp;(최대 3개 선택가능)<br><span id="tastes">
				<c:forEach items="${requestScope.tasteList}" var='taste'>
						<label><input type="checkbox" name="tastes" class="tastes" 
							value="${taste.tasteName}">${taste.tasteName}</label>&nbsp;&nbsp;&nbsp;
					</c:forEach>
				</span>
				
			</div>
		</div>
		<div>
			<button type="submit" id="testBtn" class="btn btn-default">가입</button>
		</div>
		<sec:csrfInput />
		<%-- csrf 토큰 --%>
	</form>
</div>
<%--
 
**ajax 할때는 data에 저렇게 반드시 적어줘야 csrf처리가 된다.
$.ajax({
   url:"aa.do",
   type:"post",
   data:'${_csrf.paramName }=${_csrf.token }&name=abc&age=20'
}); 

--%>










