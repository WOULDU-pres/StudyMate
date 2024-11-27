<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/register.css">
<div class="container">
    <h1 class="page-title">게시글 수정</h1>
    <form role="form" action="/board/modify" method="post" id="modifyForm">
        <!-- Hidden inputs for page navigation -->
        <input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}' />" />
        <input type="hidden" name="amount" value="<c:out value='${cri.amount}' />" />
        <input type="hidden" name="bno" value="<c:out value='${board.bno}' />" />

        <!-- Form grid layout -->
        <div class="form-grid">
            <!-- Title -->
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" class="form-control" id="title" name="title" value="<c:out value='${board.title}' />" />
            </div>

            <!-- Content -->
            <div class="form-group">
                <label for="content">내용</label>
                <textarea class="form-control" id="content" name="content" rows="5"><c:out value="${board.content}" /></textarea>
            </div>

            <!-- User ID -->
            <div class="form-group">
                <label for="user_id">작성자</label>
                <input type="text" class="form-control" id="user_id" name="user_id" value="<c:out value='${board.user_id}' />" readonly />
            </div>

            <!-- Registration Date -->
            <div class="form-group">
                <label for="regDate">등록일</label>
                <input type="text" class="form-control" id="regDate" name="regDate" 
                    value="<fmt:formatDate pattern='yyyy-MM-dd HH:mm:ss' value='${board.regdate}' />" readonly />
            </div>

            <!-- Update Date -->
            <div class="form-group">
                <label for="updateDate">수정일</label>
                <input type="text" class="form-control" id="updateDate" name="updateDate" 
                    value="<fmt:formatDate pattern='yyyy-MM-dd HH:mm:ss' value='${board.updateDate}' />" readonly />
            </div>
        </div>

        <!-- Buttons -->
        <div class="form-buttons">
            <button type="submit" data-oper="modify" class="btn btn-primary">수정</button>
            <button type="submit" data-oper="remove" class="btn btn-danger">삭제</button>
            <button type="button" data-oper="list" class="btn btn-secondary" id="listButton">목록</button>
        </div>
    </form>
</div>

<script type="text/javascript">

	$(function() {
		
		var formObj = $("form");
		
		$('button').on("click", function(e) {
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'remove'){
				formObj.attr("action", "/board/remove");
			}else if(operation === 'list'){
				//move to list
				formObj.attr("action", "/board/list").attr("method","get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
			}
			
			formObj.submit();
			
		});
	});
	
</script>
<%@include file="../includes/footer.jsp" %>