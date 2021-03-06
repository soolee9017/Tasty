<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
   src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>
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
	var check = 0;
	var check2 = 0;
	var checkemail = null;
	var email = null; 
	
	$("#duplBtn").on("click",function(){
		check = 1;
		email = $("input[name='email']").val(); //현재 적힌 email
		$.ajax({
			"url":"/Tasty/duplicatedCheck.do",
			"data":"email="+email,
			"success":function(result){
				var txt = "";
				if(result == 1){
					checkemail = $("input[name='email']").val(); //중복확인 눌렀을때 email
					check = 1;
					$("input[name='email']").val(checkemail);
					alert("사용가능한 email입니다.");
				}else if(result == 0){
					alert("이미 등록된 email입니다.");
					$("input[name='email']").val(txt);
					$("input[name='email']").focus();
					return false;
				}
			}
		});
		if(check2 == 1){
			check = 0;
			return false;
		}
	});

	
	$("#testBtn").on("click",function(){
		email = $("input[name='email']").val(); //현재 적힌 email
		if(email != checkemail || check == 0){
			alert("email 중복확인 먼저 해주세요.");
			check2 = 1;
			return false;
		}else if($("input[type='checkbox']:checked").length == 0){
			alert('맛 1개 이상 고르세요.');
			return false;
		}
	});
	
});
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

		<button id="duplBtn" type="button" class="btn btn-default">중복 확인</button><p> 

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










