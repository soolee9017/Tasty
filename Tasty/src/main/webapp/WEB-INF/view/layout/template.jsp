<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	text-decoration: none;
	list-style: none;
	color: black;
}

p {
	width: 100%;
	height: 1px;
	background-color: black;
}

.nav>ul {
	width: 100%;
	height: 50px;
}

.nav>ul>li {
	text-align: center;
	width: 25%;
	line-height: 50px;
}

section>header {
	margin-top: 80px;
	text-align: center;
}

section>header h1 {
	font-size: 120px;
	color: blue;
}

.header h1 {
	font-size: 50px;
	color: blue;
}

section>article {
	margin-top: 100px;
	height: 100px;
}

#searchEater {
	-webkit-border-radius: 15px 0 0 15px;
	font-size: 20px;
	padding-left: 8px;
	height: 40px;
	z-index: 1;
}

#keyward img {
	position: relative;
	z-index: 3;
	width: 34px;
	height: 34px;
}
</style>
<link type="text/css" rel="stylesheet"
	href="${initParam.rootPath}/resource/sweetalert/css/sweetalert2.css">
<link type="text/css" rel="stylesheet"
	href="${initParam.rootPath}/resource/bootstrap/css/bootstrap.min.css">
<script type="text/javascript"
	src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${initParam.rootPath}/resource/sweetalert/js/sweetalert2.min.js"></script>
<script type="text/javascript"
	src="${initParam.rootPath}/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function imgSearch() {
		var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		var search = document.getElementById('searchEater').value;
		if (!search || search.search(/\s/) != -1
				|| special_pattern.test(search) == true) {
			swal("", "가게 이름 혹은 키워드가 입력되지 않았거나 공백, 특수문자가 존재합니다.", "error");
			return false;
		} else {
			document.getElementById('keyward').submit();
			return true;
		}
	}
</script>
</head>
<body>
	<div class="container-fluid text-center">
		<header class="row page-header">
			<tiles:insertAttribute name="header" />
		</header>
		<section>
			<header>
				<h1>Yolty 50</h1>
			</header>
			<article>
				<tiles:insertAttribute name="content"/>
			</article>
		</section>
		<footer class="row text-center">
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>
</body>
</html>