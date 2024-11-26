/* Written By 최준영 */
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/header.jsp" %>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Board Register</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">Board Read Page</div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                 
                 <div class="form-group">
                    <label>Bno</label> <input class="form-control" name='bno'
                    value='<c:out value="${board.bno}"/>' readonly="readonly">
                 </div>
                 
                 <div class="form-group">
                    <label>Title</label> <input class="form-control" name='title'
                    value='<c:out value="${board.title}"/>' readonly="readonly">
                 </div>
                 
                 <div class="form-group">
                    <label>Text area</label> 
                    <textarea class="form-control" rows="3" name='content'
                     readonly="readonly"><c:out value="${board.content}"/></textarea>
                 </div>

                 <div class="form-group">
                    <label>user_id</label> <input class="form-control" name='user_id'
                    value='<c:out value="${board.user_id}"/>' readonly="readonly">
                 </div>
                 
                 <button data-oper='modify' class="btn btn-default">Modify</button>
               <button data-oper='list' class="btn btn-info">List</button>
               
               <form id='operForm' action="/board/modify" method="get">
                  <input type='hidden' name='bno' id='bno' value='<c:out value="${board.bno}"/>'>
                  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
                  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
                  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
               </form>
            </div>
            <!-- end panel-body -->
        </div>
        <!-- end panel -->
    </div>
</div>
<!-- /.row -->
<!-- 댓글 -->
<div class="row">
    <div class="col-lg-12">
         <div class="panel panel-default">
            <div class="panel-heading">
            <i class="fa fa-comments fa-fw"></i> Reply
            <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
         </div>
 
            <!-- /.panel-heading -->
	      <div class="panel-body">        
	      
	        <ul class="chat">
	
	        </ul>
	        <!-- ./ end ul -->
	      </div>
	      <!-- /.panel .chat-panel -->
	
		<div class="panel-footer"></div>
	
	
			</div>
	  </div>
	  <!-- ./ end row -->
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>Reply</label>
					<input class="form-control" name="reply" value='New Reply!!!'>
				</div>
				<div class="form-group">
					<label>User_id</label>
					<input class="form-control" name='user_id' value='user_id'>
				</div>
				<div class="form-group">
					<label>Reply Date</label>
					<input class="form-control" name='replyDate' value=''>
				</div>
			</div>
			<div class="modal-footer">
				<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
       			<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
				<button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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

   
   function showReplyPage(replyCnt){
	      
	      var endNum = Math.ceil(pageNum / 10.0) * 10;  
	      var startNum = endNum - 9; 
	      
	      var prev = startNum != 1;
	      var next = false;
	      
	      if(endNum * 10 >= replyCnt){
	        endNum = Math.ceil(replyCnt/10.0);
	      }
	      
	      if(endNum * 10 < replyCnt){
	        next = true;
	      }
	      
	      var str = "<ul class='pagination pull-right'>";
	      
	      if(prev){
	        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
	      }
	      
	      for(var i = startNum ; i <= endNum; i++){
	        
	        var active = pageNum == i? "active":"";
	        
	        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
	      }
	      
	      if(next){
	        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
	      }
	      
	      str += "</ul></div>";
	      
	      console.log(str);
	      
	      replyPageFooter.html(str);
	    }
	     
	    replyPageFooter.on("click","li a", function(e){
	       e.preventDefault();
	       console.log("page click");
	       
	       var targetPageNum = $(this).attr("href");
	       
	       console.log("targetPageNum: " + targetPageNum);
	       
	       pageNum = targetPageNum;
	       
	       showList(pageNum);
	     });  
  
   
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
     modalInputReplyDate.closest("div").hide();
     modal.find("button[id !='modalCloseBtn']").hide();
     
     modalInputUserId.removeAttr("readonly");
     
     modalRegisterBtn.show();
     
     $(".modal").modal("show");

   })
   
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

			//showList(1);
			showList(-1);
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
 	  
	   	  var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
	   	  
	   	  replyService.update(reply, function(result){
	   	        
	   	    alert(result);
	   	    modal.modal("hide");
	   	    showList(pageNum);
	   	    
	   	  });
	   	  
	   	});


	   	modalRemoveBtn.on("click", function (e){
	   	  
	   	  var rno = modal.data("rno");
	   	  
	   	  replyService.remove(rno, function(result){
	   	        
	   	      alert(result);
	   	      modal.modal("hide");
	   	      showList(pageNum);
	   	      
	   	  });
	   	  
	   	});
});

$(function(){
   let operForm = $("#operForm");
   $("button[data-oper='modify']").on("click", function(e){
      operForm.attr("action", "/board/modify").submit();
   })
   
   $("button[data-oper='list']").on("click", function(e){
      operForm.find("#bno").remove();
      operForm.attr("action", "/board/list");
      operForm.submit();
   })
})
</script>
        
   <%@ include file="../includes/footer.jsp" %>
