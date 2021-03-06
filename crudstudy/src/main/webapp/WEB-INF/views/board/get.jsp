<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 등록 페이지</h1>
<form id="operForm" role="form" action="/board/modify" method="get">
	<div class="mb-3">
	  <label for="showBno" class="form-label">글번호</label>
	  <input type="hidden" class="form-control" id="showBno" name="bno" 
	  value='<c:out value="${board.bno}"/>' readonly="readonly">
	</div>

	<div class="mb-3">
	  <label for="showTitle" class="form-label">제목</label>
	  <input type="text" class="form-control" id="showTitle" name="title" 
	  value='<c:out value="${board.title}"/>' readonly="readonly">
	</div>
	
	<div class="mb-3">
	  <label for="showContent" class="form-label">내용</label>
	  <textarea class="form-control" id="showContent" rows="3" name="content" 
	  readonly="readonly"><c:out value="${board.content}"/></textarea>
	</div>
	
	<div class="mb-3">
	  <label for="showWriter" class="form-label">작성자</label>
	  <input type="text" class="form-control" id="showWriter" name="writer" 
	  value='<c:out value="${board.writer}"/>' readonly="readonly">
	</div>
	
	<button id="modifyBtn" data-oper="modify" type="submit" class="btn btn-primary">수정</button>
	<button id="listBtn" data-oper="list" type="submit" class="btn btn-primary">목록으로 돌아가기</button>
	
	<!-- 페이징처리 부분 hidden으로 감싼다. -->
	<input type='hidden' name='pageNum' value='<c:out value="${page.pageNum}"/>'>
	<input type='hidden' name='amount' value='<c:out value="${page.amount}"/>'>
</form>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		/* 
		$('button').click(function(e) {
			e.preventDefault();
			
			let operation = $(this).data("oper");
			console.log(operation);
			
			if (operation === 'modify') {
				self.location.href="/board/modify?bno=<c:out value="${board.bno}"/>";
			} else {
				self.location = "/board/list";
				return;
			}
		}) */
		let operForm = $("#operForm");
		$("button[data-oper='modify']").click(function(e) {
			operForm.attr("action", "/board/modify").submit();
		});
		
		$("button[data-oper='list']").click(function(e) {
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list");
			operForm.submit();
		});
	});
	</script>
</body>
</html>