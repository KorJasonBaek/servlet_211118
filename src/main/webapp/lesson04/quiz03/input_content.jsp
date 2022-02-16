<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// DB 연결
MysqlService mysqlService = MysqlService.getInstance();
mysqlService.connection();

String selectQuery = "select * from `seller`";
ResultSet result = mysqlService.select(selectQuery);
%>
<section>
	<div class="ml-5 input-product">
		<div class="display-4 m-5">물건 올리기</div>
		<form method="post" action="/lesson04/quiz03_insert" name="uploadForm">
			<div class="d-flex">
				<select id="id" name="id" class="form-control col-3 ml-5">
					<option value="">-아이디 선택-</option>
					<%
					while (result.next()) {
					%>
					<option value="<%=result.getInt("id")%>"><%=result.getString("nickname")%></option>
					<%
					}
					%>
				</select> <input type="text" id="title" name="title" placeholder="제목"
					class="form-control col-4 ml-5">
				<div class="input-group">
					<input type="text" class="form-control col-5 ml-5" placeholder="가격"
						id="price" name="price">
					<div class="input-group-append">
						<span class="input-group-text">원</span>
					</div>
				</div>
			</div>
			<textarea rows="5" class="form-control mt-3 mb-3" id="description"
				name="description"></textarea>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">이미지 url</span>
				</div>
				<input type="text" class="form-control" name="pictureUrl">
			</div>
			<input type="submit" class="submit-btn btn btn-light w-100"
				onclick="return checkform()" value="저장">
		</form>
	</div>
</section>
<script type="text/javascript">
	function checkform() {
		if (document.uploadForm.id.value == "") {
			alert("id를 선택하세요");
			$("#id").focus();
			return false;
		}

		if (document.uploadForm.title.value == '') {
			alert("제목을 입력하세요");
			$('#title').focus();
			return false;
		}

		if (document.uploadForm.price.value == '') {
			alert("가격을 입력하세요");
			$('#price').focus();
			return false;
		}
		document.uploadForm.submit();
	}
</script>
<%
//DB 해제
mysqlService.disconnection();
%>