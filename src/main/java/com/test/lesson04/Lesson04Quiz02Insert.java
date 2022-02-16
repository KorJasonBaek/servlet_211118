package com.test.lesson04;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson04/quiz02_insert")
public class Lesson04Quiz02Insert  extends HttpServlet{

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 쿼리 파라미터 꺼낸다.
		String name = request.getParameter("name");
		String url = request.getParameter("url");
		
		// DB 연결
		MysqlService mysql = MysqlService.getInstance();
		mysql.connection();
		
		// insert 쿼리 수행
		String inserQuery = "insert into `bookmark` (`name`, `url`)"
				+ "values('" + name + "', '" + url + "')";
		try {
			mysql.update(inserQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// DB 연결 해제
		mysql.disconnection();
		
		// 목록 화면 이동 -> 리다이렉트
		response.sendRedirect("/lesson04/quiz02.jsp");
	}
}
