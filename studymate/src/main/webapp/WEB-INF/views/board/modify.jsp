<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/register.css">
<div class="form-container">
    <h1 class="form-title">게시글 수정</h1>
    <form role="form" action="/board/modify" method="post" id="modifyForm">
        <!-- Hidden inputs for page navigation -->
        <input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}' />" />
        <input type="hidden" name="amount" value="<c:out value='${cri.amount}' />" />
        <input type="hidden" name="bno" value="<c:out value='${board.bno}' />" />

        <!-- Form grid layout -->
        <div class="form-grid">
            <!-- Title -->
       <div class="form-row">
        <div class="form-group">
            <label>모집 구분</label>
            <select class="form-control" name="recruitmenttype_id">
                <option value="1" <c:if test="${board.recruitmenttype_id == 1}">selected</c:if>>스터디</option>
                <option value="2" <c:if test="${board.recruitmenttype_id == 2}">selected</c:if>>프로젝트</option>
            </select>
        </div>
        <div class="form-group">
            <label>모집 인원</label>
            <select class="form-control" name="recruitmentnumber_id">
                <option value="1" <c:if test="${board.recruitmentnumber_id == 1}">selected</c:if>>인원 미정</option>
                <option value="2" <c:if test="${board.recruitmentnumber_id == 2}">selected</c:if>>1명</option>
                <option value="3" <c:if test="${board.recruitmentnumber_id == 3}">selected</c:if>>2명</option>
                <option value="4" <c:if test="${board.recruitmentnumber_id == 4}">selected</c:if>>3명</option>
                <option value="5" <c:if test="${board.recruitmentnumber_id == 5}">selected</c:if>>4명</option>
                <option value="6" <c:if test="${board.recruitmentnumber_id == 6}">selected</c:if>>5명</option>
                <option value="7" <c:if test="${board.recruitmentnumber_id == 7}">selected</c:if>>6명</option>
                <option value="8" <c:if test="${board.recruitmentnumber_id == 8}">selected</c:if>>7명</option>
                <option value="9" <c:if test="${board.recruitmentnumber_id == 9}">selected</c:if>>8명</option>
                <option value="10" <c:if test="${board.recruitmentnumber_id == 10}">selected</c:if>>9명</option>
                <option value="11" <c:if test="${board.recruitmentnumber_id == 11}">selected</c:if>>10명 이상</option>
            </select>
        </div>
    </div>

    <!-- 두 번째 행: 진행 방식, 진행 기간 -->
    <div class="form-row">
        <div class="form-group">
            <label>진행 방식</label>
            <select class="form-control" name="worktype_id">
                <option value="1" <c:if test="${board.worktype_id == 1}">selected</c:if>>온라인</option>
                <option value="2" <c:if test="${board.worktype_id == 2}">selected</c:if>>오프라인</option>
                <option value="3" <c:if test="${board.worktype_id == 3}">selected</c:if>>온/오프라인</option>
            </select>
        </div>
        <div class="form-group">
            <label>진행 기간</label>
            <select class="form-control" name="duration_id">
                <option value="1" <c:if test="${board.duration_id == 1}">selected</c:if>>기간 미정</option>
                <option value="2" <c:if test="${board.duration_id == 2}">selected</c:if>>1개월</option>
                <option value="3" <c:if test="${board.duration_id == 3}">selected</c:if>>2개월</option>
                <option value="4" <c:if test="${board.duration_id == 4}">selected</c:if>>3개월</option>
                <option value="5" <c:if test="${board.duration_id == 5}">selected</c:if>>4개월</option>
                <option value="6" <c:if test="${board.duration_id == 6}">selected</c:if>>5개월</option>
                <option value="7" <c:if test="${board.duration_id == 7}">selected</c:if>>6개월</option>
                <option value="8" <c:if test="${board.duration_id == 8}">selected</c:if>>정기</option>
            </select>
        </div>
    </div>

    <!-- 세 번째 행: 기술 스택, 모집 마감일 -->
    <div class="form-row">
        <div class="form-group">
            <label>기술 스택</label>
            <select class="form-control" name="techstack_id">
                <option value="1" <c:if test="${board.techstack_id == 1}">selected</c:if>>React</option>
                <option value="2" <c:if test="${board.techstack_id == 2}">selected</c:if>>Vue</option>
                <option value="3" <c:if test="${board.techstack_id == 3}">selected</c:if>>Node.js</option>
                <option value="4" <c:if test="${board.techstack_id == 4}">selected</c:if>>Spring</option>
                <option value="5" <c:if test="${board.techstack_id == 5}">selected</c:if>>Java</option>
                <option value="6" <c:if test="${board.techstack_id == 6}">selected</c:if>>Python</option>
                <option value="7" <c:if test="${board.techstack_id == 7}">selected</c:if>>Spring</option>
                <option value="8" <c:if test="${board.techstack_id == 8}">selected</c:if>>Oracle</option>
                <option value="9" <c:if test="${board.techstack_id == 9}">selected</c:if>>Git</option>
                <option value="10" <c:if test="${board.techstack_id == 10}">selected</c:if>>Figma</option>
            </select>
        </div>
            <div class="form-group">
                <label>모집 마감일</label>
                <input type="date" class="form-control" name="deadline" value= value="<c:out value='${board.deadline}' />">
            </div>
        </div>
            
            
            
            
            
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
                <label for="nickname">작성자</label>
                <input type="text" class="form-control" id="nickname" name="nickname" value="<c:out value='${board.nickname}' />" readonly />
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