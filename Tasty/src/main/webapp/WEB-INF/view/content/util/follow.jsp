<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.follow > td > a > img {
	margin-right: 170px;
	-webkit-transition:1s;
}
.follow > td > a > img:hover {
	-webkit-transform:scale(1.2,1.2);
}
.follow_text > td > h2{
	margin-right: 170px;
	color:#666666 !important;
	cursor:pointer;
}
.follow_text > td > h2:hover{
	cursor:pointer;
	color:#000000 !important;
}
</style>
<script type="text/javascript">
function popupLink(popHeight,popWidth,winLink){ 
	var winHeight = document.body.clientHeight;	// 현재창의 높이
	var winWidth = document.body.clientWidth;	// 현재창의 너비
	var winX = window.screenLeft;	// 현재창의 x좌표
	var winY = window.screenTop;	// 현재창의 y좌표

	var popX = winX + (winWidth - popWidth)/2;
	var popY = winY + (winHeight - popHeight)/2;
	window.open(winLink,"popup","width="+popWidth+"px,height="+popHeight+"px,top="+popY+",left="+popX);
}
</script>
<div style="margin-top: 120px; margin-bottom:50px; font-size:120px;">
	<span style="color:#fd1d1d;">F</span>
	<span style="color:#f56040;">o</span>
	<span style="color:#f77737;">l</span>
	<span style="color:#f77737;">l</span>
	<span style="color:#f56040;">o</span>
	<span style="color:#ffdc80;">w</span>
</div>
<p style="height:1px;background-color:black;width:740px;margin-left:380px; margin-bottom:20px;"></p>
<div style="margin-left: 380px;">
<table>
	<thead>
		<tr class="follow">
			<td><a href="https://www.facebook.com"
			onclick="popupLink(700,1200,this.href); return false;">
			<img src="${initParam.rootPath}/icon/facebook.png"></a></td>
			<td><a href="https://twitter.com/?lang=ko"
			onclick="popupLink(700,1200,this.href); return false;">
			<img src="${initParam.rootPath}/icon/twitter.png"></a></td>
			<td><a href="https://www.instagram.com/?hl=ko"
			onclick="popupLink(700,1200,this.href); return false;">
			<img src="${initParam.rootPath}/icon/instagram.png"></a></td>
		</tr>
	</thead>
	<tbody>
		<tr class="follow_text">
			<td><h2>Facebook</h2></td>
			<td><h2>Twitter</h2></td>
			<td><h2>Instagram</h2></td>
		</tr>
	</tbody>
</table>
	
</div>