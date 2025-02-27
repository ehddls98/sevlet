<%@page import="com.study.dvd.entity.Dvd"%>
<%@page import="java.util.List"%>
<%@page import="com.study.dvd.dao.DvdDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	table, th, td {
		border: 1px solid #dbdbdb;
		border-collapse: collapse;
	}
	
	th, td {
		padding: 5px 10px;
	}
</style>
</head>
<body>
	<div>
		<label>DVD 검색</label>
		<input type ="text" 
		class="search-input" 
		placeholder="DVD 제목을 입력하세요">
		<button onClick="handleSearchClick()">검색</button>
	</div>
	<%
		String searchText = request.getParameter("searchText");
		List<Dvd> dvds = DvdDao.searchDvdByTitle(searchText);
	%>
	<table>
		<thead>
			<tr>
				<th>DVD_ID</th>
				<th>등록번호</th>
				<th>제목</th>
				<th>제작사_ID</th>
				<th>제작사</th>
				<th>발행사</th>
				<th>발행사_ID</th>
				<th>발행년도</th>
				<th>등록일자</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Dvd dvd : dvds) {
			%>
			<tr>
				<td><%=dvd.getDvdId() %></td>
				<td><%=dvd.getRegistrationNumber() %></td>
				<td><%=dvd.getTitle() %></td>
				<td><%=dvd.getProducerId() %></td>
				<td><%=dvd.getProducerName() %></td>
				<td><%=dvd.getPublisherId() %></td>
				<td><%=dvd.getPublisherName() %></td>
				<td><%=dvd.getPublicationYear() %></td>
				<td><%=dvd.getDatabaseDate() %></td>
			</tr>
			<%
				}			
			%>
		</tbody>
	</table>
	
	<script src="/dvd/static/search_dvd.js"></script> 
	jsp 파일자체가 자바스크립트 코드를 완성시켜서 응답하지 않는다. 
	//자바 스크립트 파일 참조는 크롬 웹 브라우저가 html을 해석하는 과정에서 src에 작성되어 있는 경로를 참조하며 일어난다.
	
</body>
</html>