<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function closeWindow() {
		opener.location.reload();
		window.close();
	}
</script>
</head>
<body>
	<h4>중복 확인 결과</h4>
	<c:choose>
		<c:when test="${empty requestScope.result }">

			${result.email }<br>
			사용할 수 있는 Email입니다.
				

		</c:when>
		<c:otherwise>
			<tr>
				<td>중복된 Email입니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>
	<button onclick="closeWindow();">확인</button>
</body>
</html>