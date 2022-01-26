<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 요소</title>
</head>
<body>
<%-- 1. 1부터 n까지의 합계를 구하는 함수 --%>
<%!
	private int number = 50;

	public int sum(int number) {
	int sum = 0;
	for (int i = 0; i <= number; i++) {
		sum += i; 
	}
	return sum;
}
%>

<h3>1부터 <%= number %> 까지의 합은 <%= sum(number) %>입니다.</h3>

<%-- 2. 점수들의 평균 구하기 --%>
<%
	int sum = 0;
	int[] scores = {80, 90, 100, 95, 80};
	for (int i = 0; i < scores.length; i++) {
		sum += scores[i];
	}
	double average = sum / (double)scores.length;
%>

<h3>평균 점수는 <%= average %>입니다.</h3>

<%-- 3. 채점 결과 --%>
<%@ page import="java.util.*"%>
<% 
	List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
	sum = 0;
	for (int i = 0; i < scoreList.size(); i++) {
		if (scoreList.get(i).equals("O")) {
			sum += 100 / scoreList.size();
		}
	}
%>

<h3>채점 결과는 <%= sum %>점 입니다.</h3>

<%-- 4. 나이 구하기 --%>
<%
	String birthDay = "20010820";
	int year = Integer.valueOf(birthDay.substring(0, 4));
	int age = 2022 - year;
%>

<h3><%= birthDay %>의 나이는 <%= age %>세 입니다.</h3>
</body>
</html>