<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>request</h1> 

<h3>registerMember</h3>
<form action="${initParam.rootPath }/member/registerMember.do" method="post">
	Email	 <input type="text" name="email"/><br>
	Password <input type="text" name="password"/><br>
	Nickname <input type="text" name="nickname"/><br>
	Name	 <input type="text" name="name"/><br>
	PhoneNum <input type="text" name="phoneNum"/><br>
	Gender	 <input type="text" name="gender"/><br>
	TotalUps <input type="number" name="totalUps" value="0"/><br>
	TotalDowns <input type="number" name="totalDowns" value="0"/><br>
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

<p>

<h3>updateMemberByEmail</h3>
<form action="${initParam.rootPath }/member/updateMemberByEmail.do" method="post">
	<input type="text" name="email" value=""/>
	<button>조회</button>
</form>

<p>

<h3>removeMemberByEmail</h3>
<form action="${initParam.rootPath }/member/removeMemberByEmail.do" method="post">
	<input type="text" name="email"/>
	<button>조회</button>
</form>

<p>

<h3>getMemberByEmail</h3>
<form action="${initParam.rootPath }/member/getMemberByEmail.do" method="post">
	<input type="text" name="email"/>
	<button>조회</button>
</form>
</body>
</html>