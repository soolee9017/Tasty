<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document).ready(function() {
		$(".tastes").on("click",function() {
			if ($('input:checkbox[name="tastes"]:checked').length >= 3) {
				$('input:checkbox[name="tastes"]').attr("disabled", true);
					$('input:checkbox[name="tastes"]:checked').attr("disabled", false);
						return;
			} else {
				$('input:checkbox[name="tastes"]').attr("disabled", false);
			}
		});
	$("#testBtn").on("click",function(){
		if($("input[type='checkbox']:checked").length == 0){
			alert('맛 1개 이상 고르세요.');
			return false;
		}
	});

		$("#testBtn").on("click",function(){
			check2 = 1;
			 if($("input[type='checkbox']:checked").length == 0){
				alert('맛 1개 이상 고르세요.');
				return false;
			 }
			});
		
	});
	
</script>
<style>
	input{
		text-align:center;
	}
	
	
	
	body{
	background-color:rgb(235,235,235);
}

.leftMenuList > div > ul{
	width:100%;
}
.leftMenuList > div > ul > li{
	width:100%;
	height:50px;
	border-bottom:1px #000 solid;
}
.leftMenuList > div > ul > li:hover{
	background-color:rgb(245,245,245);
}
.leftMenuList > div > ul > li > a{
	line-height:50px;
	color:#000;
	text-decoration:none;
	-webkit-transition:1s;
	font-size:15px;
}

</style>

<div class="leftMenuList" style="margin-top: 50px; float: left; width: 250px; position:absolute; left:10%; top:12%;">
	<div>
		<ul>
			<li><a
				href='${initParam.rootPath }/review/getReviewByEmail.do?email=<sec:authentication property="principal.email"/>'>내가
					작성한 리뷰 보기</a></li>
			<li><a
				href='${initParam.rootPath}/route/getRouteByEmail.do?email=<sec:authentication property="principal.email"/>'>내가 작성한 루트 보기</a></li>
			
				<li><a
				href='${initParam.rootPath}/Mission/getMissionByEmail.do?email=<sec:authentication property="principal.email"/>'>내가 참여중인 미션 보기</a></li>
			
			
			
			<li><a href="${initParam.rootPath }/review/getAllTaste3.do">정보수정</a></li>
			<li><a onclick="return confirm('정말 탈퇴하시겠습니까?');"
				href="${initParam.rootPath }/member/withdraw_member.do?email=<sec:authentication property="principal.email"/>">탈퇴</a></li>
		</ul>
	</div>
</div>








<div class="text-center center-block" style="margin-top:70px; width:600px;">
	<div class="text-left">
		<h2>내 정보 수정</h2>
	</div>
	<p style="height:1px; width:800px; background-color:#000;"></p>
	<c:if test="${not empty requestScope.errorMessage}">
		<div class="well text-danger">${requestScope.errorMessage }</div>
	</c:if>
	<form id="updateForm"
		action="${initParam.rootPath }/member/update_member.do" method="post"
		enctype="multipart/form-data">
		<div class="form-group">
			<label for="id">사용자 ID</label> <input type="text" name="email"
				id="id" class="form-control"
				value='<sec:authentication property="principal.email"/>'
				readonly="readonly">
		</div>
		<div class="form-group">
			<label for="oldPassword">기존 패스워드</label> <input type="password"
				name="oldPassword" id="oldPassword" class="form-control"
				required="required">
		</div>
		<div class="form-group">
			<label for="password">변경할 패스워드</label> <input type="password"
				name="password" id="password" class="form-control"
				required="required">
		</div>
		<div class="form-group">
			<label for="name">이름</label> <input type="text" name="name" id="name"
				class="form-control"
				value='<sec:authentication property="principal.name"/>'
				readonly="readonly">
		</div>
		<div class="form-group">
			<label for="nickname">닉네임</label> <input type="text" name="nickname"
				id="nickname" class="form-control"
				value='<sec:authentication property="principal.nickname"/>'
				required="required">
		</div>
		<div class="form-group">
			<label for="phoneNum">전화번호</label> <input type="text" name="phoneNum"
				id="phoneNum" class="form-control"
				value='<sec:authentication property="principal.phoneNum"/>'
				required="required">
		</div>
		<div class="form-group">
			<label for="phoneNum">성별</label> <input type="text" name="gender"
				id="gender" class="form-control"
				value='<sec:authentication property="principal.gender"/>'
				readonly="readonly">
		</div>
		<div class="form-group">
			<label for="tastes">맛</label><br> <span id="tastes"> <c:forEach
					items="${requestScope.tasteList}" var='taste' varStatus="cnt">
					<label><input type="checkbox" name="tastes" class="tastes"
						value="${taste.tasteName}">${taste.tasteName}</label>&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach>
			</span>
		</div>
		<sec:csrfInput />
		<%-- csrf 토큰 --%>
		<button type="submit" id="testBtn" class="btn btn-default">정보수정</button>
	</form>
</div>




