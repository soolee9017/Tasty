<%@ page contentType="text/html; charset=UTF-8"%>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="${initParam.rootPath}/main.do">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#home">추천맛집</a></li>
        <li><a href="#band">추천루트</a></li>
        <li><a href="#tour">미션</a></li>
        <li><a href="#contact">커뮤니티</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">더 보기
            <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a href="${initParam.rootPath}/util/information.do">회사 소개</a></li>
            <li><a href="#">인사말</a></li>
            <li><a href="#">연혁 소개</a></li> 
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>