<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${initParam.rootPath }/member/registerMemberTaste.do" method="post">	
	Email	<input type="text" name="email"/><br>
	맛 1 :
	<select name="taste1">
	<option>맛을 선택하세요.</option>
	<c:forEach items="${requestScope.tasteList }" var="taste">
		<option>${taste.tasteName}</option>	
	</c:forEach>
	</select><br>
 	맛 2 :
	<select name="taste2">
	<option>맛을 선택하세요.</option>
	<c:forEach items="${requestScope.tasteList }" var="taste">
		<option>${taste.tasteName}</option>	
	</c:forEach>
	</select><br>
	맛 3 :
	<select name="taste3">
	<option>맛을 선택하세요.</option>
	<c:forEach items="${requestScope.tasteList }" var="taste">
		<option>${taste.tasteName}</option>	
	</c:forEach>
	</select><br> 
	<!-- MemberTaste 
			짠 <input type="checkbox" name="memberTasteList" value="1"/>&nbsp;&nbsp;
			단 <input type="checkbox" name="memberTasteList" value="2"/>&nbsp;&nbsp;
			신 <input type="checkbox" name="memberTasteList" value="3"/>&nbsp;&nbsp;
			매운 <input type="checkbox" name="memberTasteList" value="4"/>&nbsp;&nbsp;
			감칠 <input type="checkbox" name="memberTasteList" value="5"/>&nbsp;&nbsp;
			쓴 <input type="checkbox" name="memberTasteList" value="6"/>&nbsp;&nbsp;
			싱거운 <input type="checkbox" name="memberTasteList" value="7"/>&nbsp;&nbsp; -->
	
			
			
	<button type="submit">등록</button>
</form>
</body>
</html>