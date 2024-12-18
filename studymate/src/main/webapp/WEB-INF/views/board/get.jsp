<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/header.jsp"%>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/dist/css/get.css">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- Written by 김태연 -->

<div class="form-container">
<div class="row">
   <div class="col-lg-12">
      <h2 class="page-header">
         <c:out value="${board.title}" />
      </h2>
         <div class="register-info" style="font-size: 11pt;">
         <div style="font-size: 11pt; margin-bottom: 20px; overflow: hidden;">
            <div style="float: left;">
               작성자:
               <c:out value="${board.nickname}" />
               &nbsp;|&nbsp; 작성일:
               <fmt:formatDate value="${board.regdate}" pattern="yy-MM-dd HH:mm" />
            </div>
            <div style="float: right;">
               조회수:
               <c:out value="${board.views}" />
            </div>
         </div>
      </div>
   </div>
   <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="form-row">
   <div class="col-lg-12">
      <!-- 두 줄로 배치된 폼 -->
      <div class="row">
         <div class="col-md-6">
            <div class="form-group">
               <label>모집 구분</label> <input class="form-control"
                  name='recruitmenttype_name'
                  value='<c:out value="${board.recruitmenttype_name}"/>'
                  readonly="readonly">
            </div>
         </div>
         <div class="col-md-6">
            <div class="form-group">
               <label>모집 인원</label> <input class="form-control"
                  name='recruitmentnumber'
                  value='<c:out value="${board.recruitmentnumber}"/>'
                  readonly="readonly">
            </div>
         </div>
      </div>

      <div class="row">
         <div class="col-md-6">
            <div class="form-group">
               <label>연락 방법</label> <input class="form-control"
                  name='contactmethod_name'
                  value='<c:out value="${board.contactmethod_name}"/>'
                  readonly="readonly">
            </div>
         </div>
         <div class="col-md-6">
            <div class="form-group">
               <label>모집 분야</label> <input class="form-control"
                  name='position_name'
                  value='<c:out value="${board.position_name}"/>'
                  readonly="readonly">
            </div>
         </div>
      </div>

      <!-- 나머지 form-group들도 동일하게 적용 -->
      <div class="row">
         <div class="col-md-6">
            <div class="form-group">
               <label>진행 방식</label> <input class="form-control"
                  name='worktype_name'
                  value='<c:out value="${board.worktype_name}"/>'
                  readonly="readonly">
            </div>
         </div>
         <div class="col-md-6">
            <div class="form-group">
               <label>시작 예정(모집 마감일)</label> <input class="form-control"
                  name='deadline'
                  value='<fmt:formatDate value="${board.deadline}" pattern="yy-MM-dd HH:mm" />'
                  readonly="readonly">
            </div>
         </div>
      </div>

      <!-- Textarea는 일반 텍스트로 표시 -->
      <div class="row">
         <div class="col-md-12">
            <div class="form-group">
               <h3>본문</h3>
               <div class="form-control-static">
                  <c:out value="${board.content}" />
               </div>
            </div>
         </div>
      </div>


      <!-- 버튼 -->
      <sec:authentication property="principal" var="pinfo"/>
        <sec:authorize access="isAuthenticated()">
        <c:if test="${pinfo.username eq board.user_id}">
        <button data-oper='modify' class="btn btn-default">수정하기</button>
        </c:if>
        </sec:authorize>
      <button data-oper='list' class="btn btn-info">목록으로</button>
   </div>
</div>

<form id='operForm' action="/board/modify" method="get">
   <input type='hidden' name='bno' id='bno' value='<c:out value="${board.bno}"/>'> 
   <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'> 
   <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
   <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
   <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
</form>
<!-- /.row -->

<!-- 댓글 -->
<div class="row">
   <ul class="chat"></ul>
         <sec:authentication property="principal" var="pinfo"/>
        <sec:authorize access="isAuthenticated()">
   		<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글 작성</button>
        </sec:authorize>
        <div class="panel-footer"></div>
</div>

</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-label="Close">&times;</button>
            <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
         </div>
         <div class="modal-body">
            <div class="form-group">
               <label>Reply</label> <input class="form-control" name="reply"
                  value='New Reply!!!'>
            </div>
            <div class="form-group">
               <label>User_id</label> <input class="form-control" name='user_id'
                  value='user_id'>
            </div>
            
            <div class="form-group">
               <label>Reply Date</label> <input class="form-control"
                  name='replyDate' value=''>
            </div>
         </div>
         <div class="modal-footer">
            <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
            <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
            <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
            <button id='modalCloseBtn' type="button" class="btn btn-default"
               data-dismiss="modal">Close</button>
         </div>
      </div>
      <!-- /.modal-content -->
   </div>
   <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script src="/resources/js/reply.js"> </script>
<script type="text/javascript">
$(document).ready(function (){
   let bnoValue = '<c:out value="${board.bno}"/>';
   let replyUL = $(".chat");
   showList(1);
   function showList(page) {
      replyService.getList({bno:bnoValue, page: page || 1}, function(replyCnt, list) {
         console.log("replyCnt: ", replyCnt);
         if(page == -1){
             pageNum = Math.ceil(replyCnt/10.0);
             showList(pageNum);
             return;
           }
        if (list == null || list.length === 0) {
               replyUL.html("<li class='text-center'>댓글이 없습니다</li>");
               replyPageFooter.html(""); // 페이지네이션 초기화
               return;
           }
        
         let str = "";
         
        for (let i = 0; i < list.length; i++) {
            str += `<li class='left clearfix' data-rno='\${list[i].rno}'>
                          <div>
                             <div class='header'>
                                <strong class='primary-font'>\${list[i].nickname}</strong>
                                <small class='pull-right text-muted'>\${replyService.displayTime(list[i].replyDate)}</small>
                             </div>
                             <p>\${list[i].reply}</p>
                          </div>
                       </li>`;
         }
         replyUL.html(str);
         showReplyPage(replyCnt);
      });
   }//end showList
   
   var pageNum = 1;
   var replyPageFooter = $(".panel-footer");
   if (replyPageFooter.length === 0) {
       console.error("replyPageFooter 컨테이너를 찾을 수 없습니다.");
   } else {
       console.log("replyPageFooter 컨테이너 확인:", replyPageFooter);
   }

   
   function showReplyPage(replyCnt) {
       var endNum = Math.ceil(pageNum / 10.0) * 10;
       var startNum = endNum - 9;

       var prev = pageNum > 1; // 이전 버튼 활성화 여부
       var next = pageNum * 10 < replyCnt; // 다음 버튼 활성화 여부

       if(endNum * 10 >= replyCnt){
           endNum = Math.ceil(replyCnt/10.0);
         }
       
       var str = `<ul class='pagination pull-right'>`;
       if (prev) {
          str+= "<li class='page-item'><a class='page-link' href='"+(pageNum - 1)+"'>Previous</a></li>";
       }

      for(var i = startNum ; i <= endNum; i++){
           var active = pageNum == i? "active":"";
           str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
         }

       if (next) {
          str+= "<li class='page-item'><a class='page-link' href='"+(pageNum + 1)+"'>Next</a></li>";
       }

       str += `</ul>`;

       console.log(str);

       replyPageFooter.html(str);
       console.log("Pagination Footer Exists:", replyPageFooter.length > 0);


       // 이벤트 중복 방지를 위해 기존 이벤트 제거 후 다시 등록
       replyPageFooter.off("click").on("click", "li a", function (e) {
           e.preventDefault();
           console.log("page click");

           var targetPageNum = $(this).attr("href");
           console.log("targetPageNum: " + targetPageNum);

           pageNum = parseInt(targetPageNum, 10); // 페이지 번호를 정수로 변환
           showList(pageNum);
       });
   }
 
  
   
   let modal = $(".modal");
   let modalInputReply = modal.find("input[name='reply']");
   let modalInputUserId = modal.find("input[name='user_id']");
   let modalInputReplyDate = modal.find("input[name='replyDate']");
   
   let modalModBtn = $("#modalModBtn");
   let modalRemoveBtn = $("#modalRemoveBtn");
   let modalRegisterBtn = $("#modalRegisterBtn");
   
   $("#modalCloseBtn").on("click", function(e){
      
      modal.modal('hide');
   });
   
   $("#addReplyBtn").on("click", function(e){
     
     modal.find("input").val("");
     modal.find("input[name='user_id']").val(replyer).attr("readonly", true);
     modalInputReplyDate.closest("div").hide();
     modal.find("button[id !='modalCloseBtn']").hide();
     
     modalRegisterBtn.show();
     
     $(".modal").modal("show");

   })
   
   $(document).ajaxSend(function(e, xhr, options) { 
        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
      }); 
   
   modalRegisterBtn.on("click", function (e) {
      var reply = {
         reply: modalInputReply.val(),
         user_id: modalInputUserId.val(),
         bno: bnoValue,
      };

      if (!reply.reply || !reply.user_id) {
         alert("Reply and User ID are required.");
         return;
      }

      replyService.add(reply, function (result) {
         alert(result);

         modal.find("input").val("");
         modal.modal("hide");

         pageNum = 1;
         showList(pageNum);
      });
   });
   
   $(".chat").on("click", "li", function(e){
         
         var rno = $(this).data("rno");
         
           replyService.get(rno, function(reply){
         
           modalInputReply.val(reply.reply);
           modalInputUserId.val(reply.user_id).attr("readonly","readonly");
           modalInputReplyDate.val(replyService.displayTime( reply.replyDate))
           .attr("readonly","readonly");
           modal.data("rno", reply.rno);
           
           modal.find("button[id !='modalCloseBtn']").hide();
           modalModBtn.show();
           modalRemoveBtn.show();
           
           $(".modal").modal("show"); 
               
         });
       });
   modalModBtn.on("click", function(e){
 	  
		var originalReplyer = modalInputUserId.val();
		var reply = {
			      rno:modal.data("rno"), 
			      reply: modalInputReply.val(),
			      user_id: originalReplyer};
	  
		if(!replyer){
			 alert("로그인후 수정이 가능합니다.");
			 modal.modal("hide");
			 return;
		}

		console.log("Original Replyer: " + originalReplyer);
		
		if(replyer  != originalReplyer){
			 alert("자신이 작성한 댓글만 수정이 가능합니다.");
			 modal.modal("hide");
			 return;
		}
		  
		replyService.update(reply, function(result){
		  alert(result);
		  modal.modal("hide");
		  showList(pageNum);
		});
	});

  	modalRemoveBtn.on("click", function (e){
     	  var rno = modal.data("rno");

     	  console.log("RNO: " + rno);
     	  console.log("REPLYER: " + replyer);
     	  
     	  if(!replyer){
     		  alert("로그인후 삭제가 가능합니다.");
     		  modal.modal("hide");
     		  return;
     	  }
     	  
     	  var originalReplyer = modalInputUserId.val();
     	  
     	  console.log("Original Replyer: " + originalReplyer);
     	  
     	  if(replyer  != originalReplyer){
     		  alert("자신이 작성한 댓글만 삭제가 가능합니다.");
     		  modal.modal("hide");
     		  return;
     	  }
     	  
     	  replyService.remove(rno, originalReplyer, function(result){
     	      alert(result);
     	      modal.modal("hide");
     	      showList(pageNum);
     	  });
     	});
     	
      var replyer = null;
      
      <sec:authorize access="isAuthenticated()">
      replyer = '<sec:authentication property="principal.username"/>';   
  	</sec:authorize>
   
      var csrfHeaderName ="${_csrf.headerName}"; 
      var csrfTokenValue="${_csrf.token}";
  });
</script>

<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/board/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#bno").remove();
    operForm.attr("action","/board/list")
    operForm.submit();
    
  });  
});
</script>

<%@ include file="../includes/footer.jsp"%>