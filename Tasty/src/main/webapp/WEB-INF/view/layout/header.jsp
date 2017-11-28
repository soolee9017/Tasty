<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
/* Add a dark background color with a little bit see-through */
.navbar {
	background-color: #2d2d30;
	margin-bottom: 0;
	border: 0;
	font-size: 11px !important;
	letter-spacing: 4px;
	opacity: 0.9;
}

/* Add a gray color to all navbar links */
.navbar li a, .navbar .navbar-brand {
	color: #d5d5d5 !important;
}

/* On hover, the links will turn white */
.navbar-nav li a:hover {
	color: #fff !important;
}

/* The active link */
.navbar-nav li.active a {
	color: #fff !important;
	background-color: #29292c !important;
}

/* Remove border color from the collapsible button */
.navbar-default .navbar-toggle {
	border-color: transparent;
}
/* Dropdown */
.open .dropdown-toggle {
	color: #fff;
	background-color: #555 !important;
}

/* Dropdown links */
.dropdown-menu li a {
	color: #000 !important;
}

/* On hover, the dropdown links will turn red */
.dropdown-menu li a:hover {
	background-color: #FF4800 !important;
}

</style>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <!-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button> -->
      <a class="navbar-brand" href="${initParam.rootPath}/main.do">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-left">
        <li><a href="#home">추천맛집</a></li>
        <li><a href="#band">추천루트</a></li>
        <li><a href="${initParam.rootPath }/mission/getAllMission.do">미션</a></li>
        <li><a href="#contact">커뮤니티</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">더 보기
            <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a href="${initParam.rootPath}/content/util/information.do">회사 소개</a></li>
            <li><a href="#">인사말</a></li>
            <li><a href="#">연혁 소개</a></li> 
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <%--인증 안된(로그인 안한) 사용자 메뉴 : 인증되면 안보여야 하는 메뉴 --%>
<sec:authorize access="!isAuthenticated()">
	<li><a href="${initParam.rootPath }/login_form.do">로그인</a></li>
	<li><a href="${initParam.rootPath }/join_member_form.do">회원가입</a></li>
</sec:authorize>


<%--인증된(로그인한) 사용자 메뉴 : 인증 안된상태에서 안보여야 하는 메뉴 --%>
<sec:authorize access="isAuthenticated()">
	<li><a id="logout" style="cursor: pointer;">로그아웃</a> <%-- ← GET방식이지만 로그아웃이기 때문에 csrf 토큰 체크를 해줘야 하는? --%>
</sec:authorize>


<%--관리자 메뉴 /admin 으로 시작--%>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<li><a href="${initParam.rootPath }/admin/register_admin_form.do">관리자 등록</a></li>
</sec:authorize>


<%--회원/관리자 공통 메뉴 /member로 시작 --%>
<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')">
	<li><a href="${initParam.rootPath }/member/mypage.do">사용자 정보조회</a></li>
</sec:authorize>
      
<!--       	<li><a href="#"><span style="color:#d5d5d5;" class="glyphicon glyphicon-user"></span>내 정보</a></li> -->
      </ul>
      

<!-- 
	로그아웃전송폼
	+ 로그인/로그아웃은 반드시 POST방식으로 요청하며 csrf 토큰을 보내야 한다.
	+ 로그아웃은 단순 링크이므로 아래와 같이 hidden 폼을 만들고 클릭시 Javascript에서 form을 submit하여 처리한다.
 -->
<form id="logoutForm" action="${initParam.rootPath }/logout.do" method="post" style="display:none">
    <sec:csrfInput/>
</form>


<script>
$(document).ready(function(){
	$("#logout").on("click", function(){
		$("#logoutForm").submit();
	});
});
</script>
    </div>
  </div>
</nav>