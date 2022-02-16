package com.test.lesson04;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson04/quiz03_insert")
public class Lesson04Quiz03Insert extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.valueOf(request.getParameter("id"));
		String title = request.getParameter("title");
		int price = Integer.valueOf(request.getParameter("price"));
		String description = request.getParameter("description");
		String pictureUrl = request.getParameter("pictureUrl");
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connection();
		
		String inserQuery = "insert into `used_goods` (`sellerId`, `title`, `description`, `price`, `pictureUrl`)"
				+ "values('"+ id + "' ,'" + title + "' ,'" + description + "' ,'"
				+ price + "' ,'" + pictureUrl + "')";
		try {
			mysqlService.update(inserQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
		mysqlService.disconnection();
		
		response.sendRedirect("/lesson04/quiz03/list_template.jsp");
		
	}
}
