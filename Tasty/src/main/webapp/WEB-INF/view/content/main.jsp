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
<h1><span style="color:#F48020;">Y</span>olty <span style="text-decoration:underline;color:#FB4444;">50</span></h1>
  <h3><em>We love Food!</em></h3>
  <h4>We have created a fictional restaurant website.</h4>
  <br>
  <div class="row">
    <div class="col-sm-4">
      <h2 class="text-center"><strong>Yolo</strong></h2><br>
      <a href="#demo" data-toggle="collapse">
        <img src="${initParam.rootPath}/icon/batch_yolo.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo" class="collapse animated fadeInUp">
        <h3 style="color:#F48020;font:bold;">YOLO</h3>
        <h4><span style="color:#F48020;">Y</span>ou <span style="color:#E44B21;">O</span>nly <span style="color:#F8D41C;">L</span>ive <span style="color:#9CEA21;">O</span>nce</h4>
        <h5>인생은 한번뿐이다.</h5>
      </div>
    </div>
    <div class="col-sm-4">
      <h2 class="text-center"><strong>Tasty</strong></h2><br>
      <a href="#demo2" data-toggle="collapse">
        <img src="${initParam.rootPath}/icon/batch_tasty.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo2" class="collapse animated fadeInUp" style="">
        <h3 style="color:#F48020;font:bold;">TASTY</h3>
        <h4><span style="color:#F48020;">T</span>ASTY</h4>
        <h5>맛있다.</h5>
      </div>
    </div>
    <div class="col-sm-4">
      <h2 class="text-center"><strong>50</strong></h2><br>
      <a href="#demo3" data-toggle="collapse">
        <img src="${initParam.rootPath}/icon/50.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo3" class="collapse animated fadeInUp" style="">
        <h3 style="color:#F48020;font:bold;">50</h3>
        <h4><span style="color:#F42496;">50</span></h4>
        <h5>둘이 먹다가 하나가 죽어도 모른다.</h5>
      </div>
    </div>
  </div>

