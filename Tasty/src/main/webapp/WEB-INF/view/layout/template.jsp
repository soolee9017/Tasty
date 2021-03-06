<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html, body {
	height: 100%
}

* {
	text-decoration: none;
	list-style: none;
	color: black;
}

section header h1 {
	padding-top: 60px;
	margin-bottom: 150px;
	font-size: 120px;
	color: white;
	position: static;
	z-index: 5;
}

#keyword {
	position: static;
	top: 60%;
	left: 23%;
}

#searchEater {
	-webkit-border-radius: 15px 0 0 15px;
	font-size: 17px;
	height: 40px;
	z-index: 4;
	border: 0px solid;
}

.back {
	background-color: rgba(0, 0, 0, 0.3);
	width: 100%;
	height: 80%;
	margin-top: 49.5px;
	z-index: 2;
	position: absolute;
}

.foots {
	background-color:#8c8c8c;
	padding-top:40px;
	bottom: -100%;
	width: 100%;
	height: 14.8%;
	position:absolute;
}
 .container {
      padding: 80px 120px;
  }
  .person {
      border: 10px solid transparent;
      margin-bottom: 25px;
      width: 80%;
      height: 80%;
      opacity: 0.7;
  }
  .person:hover {
      border-color: #f1f1f1;
  }
</style>
<link type="text/css" rel="stylesheet"
	href="${initParam.rootPath}/resource/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="${initParam.rootPath}/resource/sweetalert/css/sweetalert2.css">
<link type="text/css" rel="stylesheet"
	href="${initParam.rootPath}/resource/animate/animate.css">
<script type="text/javascript"
	src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${initParam.rootPath}/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${initParam.rootPath}/resource/sweetalert/js/sweetalert2.min.js"></script>
<script type="text/javascript">
function imgSearch() {
	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	var search = document.getElementById('searchEater').value;
	if (special_pattern.test(search) == true) {
		swal("", "특수문자가 존재합니다.", "error");
		return false;
	} else if (!search.replace(/^\s+|\s+$/g, '')) {
		swal("", "공백만 존재합니다.", "error");
		return false;
	} else if (!search) {
		swal("", "가게 이름 혹은 키워드가 입력되지 않았습니다.", "error");
		return false;
	}
}
function errorCheck(){
	var error = '${requestScope.errorMessage}';
	var message = '${requestScope.message}';
	if(!error){
		
	}else{
		swal("",error,"error")
	}
	
	if(!message){
		
	}else if(message.indexOf("성공") != -1){
		swal("",message,"success")
	}else{
		swal("",message,"error")
	}
}
</script>
</head>
<body onload="errorCheck();">
	<div class="container-fluid text-center">
		<header class="row">
			<tiles:insertAttribute name="header" />
		</header>
		<section>
			<article>
				<tiles:insertAttribute name="content" />
			</article>
		</section>
		<footer class="row text-center foots">
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>
</body>
</html>