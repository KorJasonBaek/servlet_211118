<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%
	//아이유 노래 리스트 
	List<Map<String, Object>> musicList = new ArrayList<>();
	
	Map<String, Object> musicInfo = new HashMap<>();
	musicInfo.put("id", 1);
	musicInfo.put("title", "팔레트");
	musicInfo.put("album", "Palette");
	musicInfo.put("singer", "아이유");
	musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/b/b6/IU_Palette_final.jpg");
	musicInfo.put("time", 217);
	musicInfo.put("composer", "아이유");
	musicInfo.put("lyricist", "아이유");
	musicList.add(musicInfo);
	
	musicInfo = new HashMap<>();
	musicInfo.put("id", 2);
	musicInfo.put("title", "좋은날");
	musicInfo.put("album", "Real");
	musicInfo.put("singer", "아이유");
	musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/3/3c/IU_-_Real.jpg");
	musicInfo.put("time", 233);
	musicInfo.put("composer", "이민수");
	musicInfo.put("lyricist", "김이나");
	musicList.add(musicInfo);
	
	musicInfo = new HashMap<>();
	musicInfo.put("id", 3);
	musicInfo.put("title", "밤편지");
	musicInfo.put("album", "palette");
	musicInfo.put("singer", "아이유");
	musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/b/b6/IU_Palette_final.jpg");
	musicInfo.put("time", 253);
	musicInfo.put("composer", "제휘,김희원");
	musicInfo.put("lyricist", "아이유");
	musicList.add(musicInfo);
	
	musicInfo = new HashMap<>();
	musicInfo.put("id", 4);
	musicInfo.put("title", "삐삐");
	musicInfo.put("album", "삐삐");
	musicInfo.put("singer", "아이유");
	musicInfo.put("thumbnail", "https://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/111/535/81111535_1539157728291_1_600x600.JPG");
	musicInfo.put("time", 194);
	musicInfo.put("composer", "이종훈");
	musicInfo.put("lyricist", "아이유");
	musicList.add(musicInfo);
	
	musicInfo = new HashMap<>();
	musicInfo.put("id", 5);
	musicInfo.put("title", "스물셋");
	musicInfo.put("album", "CHAT-SHIRE");
	musicInfo.put("singer", "아이유");
	musicInfo.put("thumbnail", "https://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/080/724/877/80724877_1445520704274_1_600x600.JPG");
	musicInfo.put("time", 194);
	musicInfo.put("composer", "아이유,이종훈,이채규");
	musicInfo.put("lyricist", "아이유");
	musicList.add(musicInfo);
	
	musicInfo = new HashMap<>();
	musicInfo.put("id", 6);
	musicInfo.put("title", "Blueming");
	musicInfo.put("album", "Love poem");
	musicInfo.put("singer", "아이유");
	musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/6/65/%EC%95%84%EC%9D%B4%EC%9C%A0_-_Love_poem.jpg");
	musicInfo.put("time", 217);
	musicInfo.put("composer", "아이유,이종훈,이채규");
	musicInfo.put("lyricist", "아이유");
	musicList.add(musicInfo);
%>
<%
	int id = Integer.valueOf(request.getParameter("id"));
		
	Map<String, Object> target = new HashMap<>();  // {}
	for(Map<String, Object> music : musicList) {
		if (id == (int)music.get("id")) {
			target = music;
			break;
		}
	}
%>
<%-- 곡 정보 영역 --%>
<h3 class="mt-4">곡 정보</h3>
<div class="song-Info d-flex border border-success p-3">
	<div class="album-photo mr-4">
		<img src="<%= target.get("thumbnail") %>" alt="앨범 이미지" width="200px">
	</div>
	<div class="artist-info">

		<h1><%= target.get("title") %></h1>
		<p class="font-weight-bold text-success"><%= target.get("singer") %></p>
		<table class="text-secondary">
			<tr>
				<td><small>앨범</small></td>
				<td><small class="ml-3"><%= target.get("title") %></small></td>
			</tr>
			<tr>
				<td><small>재생시간</small></td>
				<td><small class="ml-3"><%= (int)target.get("time") / 60 %> : <%= (int)target.get("time") % 60 %></small></td>
			</tr>
			<tr>
				<td><small>작곡가</small></td>
				<td><small class="ml-3"><%= target.get("composer") %></small></td>
			</tr>
			<tr>
				<td><small>작사가</small></td>
				<td><small class="ml-3"><%= target.get("lyricist") %></small></td>
			</tr>
		</table>
	</div>
</div>

<%-- 가사 정보 영역 --%>
<div class="lyric mt-5">
	<h3>가사</h3>
	<hr>
	<span class="font-weight-bold">가사 정보 없음</span>
</div>