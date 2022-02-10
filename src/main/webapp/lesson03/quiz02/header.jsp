<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="d-flex align-items-center">
	<%-- 로고 영역 --%>
	<div class="logo">
		<h3><a href="list_template.jsp" class="text-success">Melong</a></h3>
	</div>
	<%-- 검색 영역 --%>
	<div class="search">
		<form method="get" action="song_template.jsp">
			<div class="input-group">
				<input type="text" class="col-4 form-control ml-5" name="search">
				<div class="input-group-append">
					<input type="submit" class="searchBtn btn btn-info" value="검색">
				</div>
			</div>
		</form>
	</div>
</header>
