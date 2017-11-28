<%--
권한 이 없는 작업을 요청시 응답할 Error 페이지
 --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<h2 class="text-danger"><sec:authentication property="principal.email"/>님은 접근 권한이 없습니다. 관리자에게 문의하세요.</h2><p>
<a href="${initParam.rootPath }/index">홈페이지</a>