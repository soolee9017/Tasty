<%@ page contentType="text/html;charset=UTF-8"%>
<style>
.slides img {
	margin-top: 50px;
}

.slideImg {
	width: 100%;
	height:100%;
}
.item{
	width:100%;
	height:100%;
}
</style>
<div class="row back">
	<header>
		<h1>Yolty 50</h1>
	</header>
	<form class="center-block" id="keyword" action="${initParam.rootPath}/search/mapEatery.do"
		onsubmit="return imgSearch();">
		<input type="text" name="keyword" id="searchEater" class="input-lg"
			placeholder="가게 이름 혹은 키워드(예 : 햄버거)를(을) 입력해주세요." size="70">
		<button onclick="imgSearch();" id="seach" type="submit"
			style="width: 150px; height: 40px; border: 0px solid; border-radius: 0 15px 15px 0; color: white; background-color: #FF4800;">
			<span class="glyphicon glyphicon-search"></span> 검색
		</button>
	</form>
</div>
<div id="myCarousel" class="row carousel slide" data-ride="carousel"
	style="position: relative;">

	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
		<li data-target="#myCarousel" data-slide-to="3"></li>
		<li data-target="#myCarousel" data-slide-to="4"></li>
		<li data-target="#myCarousel" data-slide-to="5"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner slides" role="listbox">
		<div class="item active">
			<img class="slideImg"
				src="${initParam.rootPath}/icon/slide/batch_chicken.jpg"
				alt="Chicken" height="400px">
		</div>
		<div class="item">
			<img class="slideImg"
				src="${initParam.rootPath}/icon/slide/batch_chobab.jpg" alt="Chobab">
		</div>
		<div class="item">
			<img class="slideImg"
				src="${initParam.rootPath}/icon/slide/batch_gobchang.jpg"
				alt="Gobchang">
		</div>
		<div class="item">
			<img class="slideImg"
				src="${initParam.rootPath}/icon/slide/batch_samgyoupsal.jpg"
				alt="Samgyopsal">
		</div>
		<div class="item">
			<img class="slideImg"
				src="${initParam.rootPath}/icon/slide/batch_walnamssam.jpg"
				alt="Walnamssam">
		</div>
		<div class="item">
			<img class="slideImg"
				src="${initParam.rootPath}/icon/slide/batch_yukhoi.jpg" alt="Yukhoi">
		</div>
	</div>
</div>


