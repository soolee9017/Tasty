<%@ page contentType="text/html;charset=UTF-8"%>
<div class="row back">
	<header>
		<h1>Yolty 50</h1>
	</header>
	<form id="keyward" action="${initParam.rootPath}/search/mapEatery.do">
		<input type="text" name="keyward" id="searchEater"
			placeholder="가게 이름 혹은 키워드(예 : 햄버거)를(을) 입력해주세요." size="70"> <img
			src="${initParam.rootPath}/icon/main_search.png"
			onclick="imgSearch();">
	</form>
</div>
