<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<!-- Written By 주현우, 최준영 -->
<!-- /.row -->            
<div class="table-container">
    <c:forEach items="${list}" var="board">
        <a class='move' href='<c:out value="${board.bno}"/>'>
	        <div class="table-cell">
	            <div class="title"><c:out value="${board.title}" /></div>
	            <div class="details">작성자: <c:out value="${board.user_id}" /></div>
	            <div class="details">마감일: <c:out value="${board.deadline}" /></div>
	            <div class="details">조회수: <c:out value="${board.views}" /></div>
	            <div class="details">모집구분: <c:out value="${board.recruitmenttype_id}" /></div>
	            <div class="details">기술 스택: <c:out value="${board.techstack_id}" /></div>
	            <div class="details">모집 포지션: <c:out value="${board.position_id}" /></div>
	        </div>
        </a>
    </c:forEach>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">            
            <div class="table-container">
                </table>
                <div class='pull-right'>
					<ul class="pagination">
					
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a>
							</li>
						</c:if>
						
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} ">
							<a href="${num}">${num}</a>
							</li>
						</c:forEach>
						
						<c:if test="${pageMaker.next}">
							<li class="pageinate_button next">
								<a href="${pageMaker.endPage +1}">Next</a>
								</li>
						</c:if>
					</ul>
					<!-- end Pagination -->
					
					<form id='actionForm' action="/board/list" method='get'>
						<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
						<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					</form>
				</div>
                
<!-- Modal 추가 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default"
				data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>	
			</div>
		</div>	
		<!-- /.modal content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
                
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<script type="text/javascript">

$(function() {

	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	history.replaceState({},null,null);
	
	function checkModal(result) {
		
		if (result === '' || history.state) {
			return;
		}
		
		if (parseInt(result) > 0) {
			$(".modal-body").html("게시글 " + parseInt(result) + "번이 등록되었습니다.");
		}
		
		$("#myModal").modal("show");
	}
	
	$("#regBtn").on("click", function() {
		
		self.location = "/board/register";
		
	});
	
 	var actionForm = $("#actionForm");
	
 	$(".paginate_button a").on("click", function(e) {
		
		e.preventDefault();
		
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.attr("action", "/board/list");
		actionForm.submit();
	});

 	$(".move").on("click", function(e){
 		
 		e.preventDefault();
 	    actionForm.find("input[name='bno']").remove();
 	    actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
 		actionForm.attr("action", "/board/get");
 		actionForm.submit();
 		
 	});
});

</script>

<%@include file="../includes/footer.jsp" %>