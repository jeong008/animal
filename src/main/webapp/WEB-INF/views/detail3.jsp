<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유기동물상세페이지</title>
<style>
* {
	box-sizing: border-box;
}
</style>
</head>
	<h1>유기동물 정보 조회</h1>
<body style="margin: 0px">
		<div style="display: flex">
			<%-- 동물 정보 영역 --%>
			<div style="flex: 3; padding: 4px;">
				<h2>${item.noticeNo }</h2>
					<div style="height: 360px; margin-bottom: 4px">
					<img src="${item.popfile }"
						style="object-fit: cover; height: 50%; width: 50%" />
					</div>
					<div style="margin-bottom: 4px">
						<span class="badge">${item.processState }</span>
					</div>
				<ul>
					<li>발견장소 : ${item.orgNm } ${item.happenPlace }</li>
					<li>특징 : ${item.specialMark }</li>
					<li>특징 : ${item.specialMark }</li>
				</ul>
				<div id="map"
					style="width: 100%; height: 300px; margin: auto; display: flex; justify-content: center; align-items: center; border: 1px solid #dddddd">
					<c:choose>
						<c:when test="${empty address }">
							지도정보를 확보 하지 못해 렌더링에 실패하였습니다.
						</c:when>
					<c:otherwise>
							지도를 불러옵니다.
					</c:otherwise>
					</c:choose>
				</div>
			</div>
		<%-- 동물의 코멘트 영역 --%>
			<div style="flex: 1; background-color: #FFFFE0;">
					<div>
						<form action="/write" method="post">
						<input type="hidden" name="target" value="${item.desertionNo }" />
						<textarea style="width: 100%; height: 120px; resize: none"
								name="body"></textarea>
						<input type="password" name="pass" />
							<button type="submit">등록</button>
						</form>
					</div>
					<div>
						<h4>응원의 한 마디 (${fn:length(messages) }건) <span id="refresh"
							style="cursor: pointer;"> ▩ </span>
						</h4>
					<c:forEach items="${messages }" var="m">
						<div style="padding: 4px; boder: 1px solid #cccccc">
							${m.body }</div>
					</c:forEach>
					</div>
			</div>
		</div>
	<c:if test="${!empty address }">
	<%-- 지도 불러옴 --%>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b118c1488d43e5bf19d8fca51b903886"></script>
		<script>
	
		//메세지 새로고침
		
		const getMessages = function();
			const xhr = new XMLHttpRequest();
			xhr.open("get", "/api/messages?no=${param.no}", true);
			xhr.send();
			xhr.onreadystatechange=function(){
				if(this.readyState===4){
					const json = JSON.parse(this.responseText);  // 객체
					const messages = documnt.querySelector("#messages");
					messages.innerHTML = "";
					for(let o of json){
						console.log(o);
						messages.innerHTML += o;
					}
				}
			}
			
		};
			document.querySelector("#refresh").onclick = getMessages;
		//map
				
		
		
			let pos = new kakao.maps.LatLng(${address.lng}, ${address.lat}); //지도의 중심좌표.
			
			let container = document.querySelector('#map'); //지도를 담을 영역의 DOM 레퍼런스
			let options = { //지도를 생성할 때 필요한 기본 옵션
				center : pos, 
				level : 3
			//지도의 레벨(확대, 축소 정도)
			};

			let map = new kakao.maps.Map(document.querySelector('#map'), options); //지도 생성 및 객체 리턴
			
			let marker = new kakao.maps.Marker({
			    position: pos
			});
			
			marker.setMap(map);
			</script>
	</c:if>
</body>
</html>