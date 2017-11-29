<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
	href="${initParam.rootPath}/resource/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" media="all"
	href="${initParam.rootPath}/resource/bootstrap/css/star-rating.css">
<script type="text/javascript"
	src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${initParam.rootPath}/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${initParam.rootPath}/resource/bootstrap/js/star-rating.js"></script>
<style type="text/css">
body {
	height: 700px;
	margin: 0 auto;
}

.wrap {
	width: 288px;
	height: 80px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 80%;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 350px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
}

.bg_white {
	background: #fff;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination button {
	width: 35px;
	height: 35px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: white;
	background-color: skyblue;
	border: 0px;
}
</style>
</head>
<body>

	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
		<div id="menu_wrap" class="bg_white">
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
		<div id="search_wrap">
			<form id="searchForm" onsubmit="searchPlaces(); return false;">
				<label for="search">가게 이름 : &nbsp;</label><input type="text"
					id="keyword" size="15" placeholder="가게 이름 혹은 키워드를(을) 입력해주세요."
					value="${requestScope.keyward}">
				<button onclick="imgSearch();" id="seachEater" type="submit">검색
				</button>
			</form>
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9a267072d7a505da79a5cc7df2f5ba7&libraries=services,clusterer,drawing"></script>
	<script>
		// 마커를 담는 배열.
		var markers = [];
		var eateryNames = [];
		//map 이라는 아이디를 받아서 contatiner 변수에 넣음
		var container = document.getElementById('map');
		//현재 지도에서 중앙값으로 잡힐 좌표값과 지도 확대 레벨을 선택함
		var options = {
			center : new daum.maps.LatLng(33.450701, 126.570667),
			level : 10
		};

		//지도 생성
		var map = new daum.maps.Map(container, options);
		//우측 옵션 (확대(줌))
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new daum.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.TOPRIGHT);
		// 마커 클러스터러를 생성합니다 
		var clusterer = new daum.maps.MarkerClusterer({
			map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
			averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
			minLevel : 3
		// 클러스터 할 최소 지도 레벨 
		});

		// 장소 검색 객체를 생성합니다 
		var ps = new daum.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB, {
				category_group_code : 'FD6,CE7'
			});

		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === daum.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === daum.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === daum.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}
		var indexs = [];
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new daum.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();
			for (var i = 0; i < places.length; i++) {
				indexs = [ i ];
				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new daum.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);
				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					daum.maps.event.addListener(marker, 'click', function() {
						displayInfowindow(marker, title);
					});
					daum.maps.event.addListener(map, 'click', function() {
						closeOverlay(bounds);
					});
					itemEl.onclick = function() {
						closeOverlay(bounds);
						displayInfowindow(marker, title);
					};

				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '<h5 class="pls_name'
					+ (index + 1)
					+ '">'
					+ places.place_name + '</h5>';
			eateryNames.push(places.place_name);
			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun' + (index + 1) + ' gray">'
						+ places.address_name + '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}
			itemStr += '  <span class="tel' + (index + 1) + '">' + places.phone
					+ '</span>' + '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new daum.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new daum.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new daum.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage, // 마커 이미지
				clickable : true
			});
			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다
			clusterer.addMarkers(markers);
			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('button');
				el.className = 'btn btn-default';
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}
				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}
		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		var content = "";
		var level = map.getLevel() - 1;

		function displayInfowindow(marker, title) {

			content = '<div class="wrap">'
					+ '<div class="info">'
					+ '<div class="title">'
					+ title
					+ '<div class="close" onclick="closeOverlay2();" title="닫기"></div>'
					+ '</div>'
					+ '<form action="${initParam.rootPath}/review/getAllTaste.do">'
					+ '<div class="body">'
					+ '<div style="float:left;">'
					+ '<span class="places_jibun"></span>'
					+ '<br>'
					+ '<span class="places_tel"></span>'
					+ '</div>'
					+ '<input type="hidden" id="eateryTitle" name="eateryTitle" value=""'
					+ '<input type="hidden" id="lat" name="lat" value="">' //위도
					+ '<input type="hidden" id="lng" name="lng" value="">' //경도
					+ '<button type="submit" class="btn btn-info" style="float:right;height:50px;">리뷰 작성</button></div>'
					+ '</div>' + '</form>' + '</div>';
			map.setLevel(4, {
				anchor : new daum.maps.LatLng(marker.getPosition().getLat(),
						marker.getPosition().getLng())
			});
			infowindow.setContent(content);
			infowindow.open(map, marker);
			$("#eateryTitle").val(title);
			$("#lat").val(marker.getPosition().getLat());
			$('#lng').val(marker.getPosition().getLng());
			for (var i = 0; i < 15; i++) {
				if (title.toString() == eateryNames[i]) {
					$(".places_jibun").html($(".jibun" + (i + 1) + "").html());
					$(".places_tel").html($(".tel" + (i + 1) + "").html());
					break;
				}
			}
		}

		function closeOverlay2() {
			map.setLevel(14);
			infowindow.close();
		}
		function closeOverlay(bounds) {
			map.setBounds(bounds);
			infowindow.close();
		}
		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
	</script>
</body>
</html>