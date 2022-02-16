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
				<select id="sellerId" name="sellerId"
					class="form-control col-3 ml-5">
					<option selected>-아이디 선택-</option>
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
				<input type="text" id="picture" class="form-control" name="pictureUrl">
			</div>
			<input type="submit" id="uploadBtn" class="btn btn-light w-100"
				value="저장">
		</form>
	</div>
</section>
<script type="text/javascript">
	$(document).ready(function() {
		$('#uploadBtn').on('click', function(e) {
			e.preventDefault();

			let sellerId = $('#sellerId option:selected').val();
			let title = $('#title').val();
			let price = $('#price').val();
			let description = $('#description').val();
			//let url = $('#picture').val();

			if (sellerId == '-아이디 선택-') {
				alert("아이디를 선택해주세요.");
				return;
			}
			if (title == '') {
				alert("제목을 입력하세요.");
				return;
			}
			if (price == '') {
				alert("가격을 입력하세요.");
				return;
			}
			if (description == '') {
				alert("내용을 작성하세요");
				return;
			}
			/* if (url.endsWith(".jpg") == false) {
				alert("이미지의 주소가 잘못 되었습니다.");
				return;
			} */

		});

		// 정규식을 사용하여 숫자만 입력받게 하기
		$('#price').on('keyup', function(e) {
			$(this).val($(this).val().replace(/[^0-9]/gi, ""));
		});

	});
</script>
<%
//DB 해제
mysqlService.disconnection();
%>