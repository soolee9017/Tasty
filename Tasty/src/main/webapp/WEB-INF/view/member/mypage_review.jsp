<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<!-- ${initParam.rootPath }/findBoard?item=${item.itemNum} -->

	<table>
			<thead>
				<tr>
					<th width="15%;">NO.</th>
					<th width="45%;" style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.list}" var="item">
					<tr>
						<td>${item.reviewNum}</td>
						<td><a href="${initParam.rootPath}/review/selectReviewByNum.do?reviewNum=${item.reviewNum}">${item.title}</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>




</body>
</html>