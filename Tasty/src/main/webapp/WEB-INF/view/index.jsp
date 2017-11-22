<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	text-decoration: none;
	list-style: none;
	color:black;
}

p {
	width: 100%;
	height: 1px;
	background-color: black;
}

body {
	width: 1200px;
	height: 600px;
	margin: 0 auto;
}

nav>ul {
	width: 100%;
	height: 50px;
}

nav>ul>li {
	text-align: center;
	width: 25%;
	float: left;
	width: 25%;
	float: left;
	line-height: 50px;
}

section>header {
	text-align: center;
}

section>header h1 {
	font-size: 120px;
	color: blue;
}

section>article {
	margin-top: 100px;
	height: 100px;
	text-align: center;
}

section>article>form {
	float: left;
	z-index: 1;
	position:absolute;
	padding-left:230px;
}
section>article>div{
	background-color:grey;
	width:56px;
	height:56px;
	position:relative;
	margin-left:930px;
	z-index: 2;
	-webkit-border-radius:0 20px 20px 0;
}
section>article>div>img {
	float: left;
	position:relative;
	width:52px;
	height:52px;
	z-index: 3;
	cursor: pointer;
}

section>article>form input {
	font-size: 15px;
	height: 50px;
	-webkit-border-radius:20px;
}
</style>
<link type="text/css" rel="stylesheet" href="${initParam.rootPath}/script/sweetalert2.css">
<script type="text/javascript" src="${initParam.rootPath}/script/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath}/script/sweetalert2.min.js"></script>
<script type="text/javascript">

	function imgSearch(){
		var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		var search = document.getElementById('searchEater').value;
		if(!search||search.search(/\s/) != -1 || special_pattern.test(search) == true){
			swal("","가게 이름 혹은 키워드가 입력되지 않았거나 공백, 특수문자가 존재합니다.","error");
			return false;
		}else{
			document.getElementById('keyward').submit();
			return true;
		}
	}
</script>
</head>
<body>
	<nav>
		<ul class="menu">
			<li><a href="#">추천맛집</a></li>
			<li><a href="#">추천루트</a></li>
			<li><a href="#">메뉴</a></li>
			<li><a href="#">커뮤니티</a></li>
		</ul>
	</nav>
	<p></p>
	<section>
		<header>
			<h1>Yolty 50</h1>
		</header>
		<article>
			<form id="keyward" action="${initParam.rootPath}/search_eatery.do">
				<input type="text" name="keyward" id="searchEater"
					placeholder="가게 이름 혹은 키워드(예 : 햄버거)를(을) 입력해주세요." size="100">
			</form>
			<div>
				<img src="${initParam.rootPath}/icon/main_search.png" onclick="imgSearch();">
			</div>
		</article>
	</section>
</body>
</html>