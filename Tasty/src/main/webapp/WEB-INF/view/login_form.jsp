<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:if test="${not empty param.errorMessage}">
   <div class="well text-danger">
      ${param.errorMessage }
   </div>
</c:if>
<form action="${initParam.rootPath}/login.do" method="post">
   <sec:csrfInput/><%--csrf 토큰 생성 --%>
   <div class="form-group">
      <label for="id">ID</label>
      <input type="text" id="id" name="email" class="form-control" required="required">
   </div>
   <div class="form-group">
      <label for="password">패스워드</label>
      <input type="password" id="password" name="password" class="form-control" required="required">
   </div>
   <button type="submit" class="btn btn-default">로그인</button>
</form>