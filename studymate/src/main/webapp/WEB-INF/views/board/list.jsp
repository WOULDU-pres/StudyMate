<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <%@include file="../includes/header.jsp" %>

        <!-- Written By 주현우, 최준영, 김채연 -->
        <!-- /.row -->
        <div class="main-content">
          <div class="title">StudyMate - 프로젝트 및 스터디</div>

          <div class="table-container">
            <c:forEach items="${list}" var="board">
              <c:if test="${board.bno == 1}">
                <div class="banner">
                  <!-- 제목 -->
                  <div class="title">
                    <c:out value="${board.title}" />
                  </div>

                  <!-- 태그 섹션 -->
                  <div class="tags-container">
                    <span class="tag blue">모집 구분:
                      <c:out value="${board.recruitmenttype_id}" />
                    </span>
                    <span class="tag green">모집 포지션:
                      <c:out value="${board.position_id}" />
                    </span>
                    <span class="tag">진행 방식:
                      <c:out value="${board.worktype_id}" />
                    </span>
                  </div>

                  <!-- 상세 정보 -->
                  <div class="details-container">
                    <p>작성자:
                      <c:out value="${board.user_id}" />
                    </p>
                    <p>작성일:
                      <c:out value="${board.regdate}" />
                    </p>
                    <p>모집 인원:
                      <c:out value="${board.recruitmentnumber_id}" />
                    </p>
                    <p>진행 기간:
                      <c:out value="${board.duration_id}" />
                    </p>
                    <p>모집 마감일:
                      <c:out value="${board.deadline}" />
                    </p>
                  </div>

                  <!-- 내용 -->
                  <div class="content">
                    <p><strong>내용:</strong>
                      <c:out value="${board.content}" />
                    </p>
                  </div>

                  <!-- 조회수 -->
                  <div class="footer">
                    <span>조회수:
                      <c:out value="${board.views}" />
                    </span>
                  </div>
                </div>
              </c:if>
            </c:forEach>
          </div>

          <div class="title">이런 스터디들이 있어요.</div>

          <div class="table-container">
            <c:forEach items="${list}" var="board">
              <c:if test="${board.bno != 1}">
        		<a class='move' href="<c:out value='${board.bno}'/>">
                  <div class="box">
                    <!-- Header -->
                    <div class="header">
                      <h3 class="highlight">
                        <c:out value="${board.title}" />
                      </h3>
                    </div>

                    <!-- Content -->
                    <div class="content">
                      <!-- 기술 스택과 포지션 -->
                      <div class="tags-container">
                        <span class="tag blue">기술 스택:
                          <c:out value="${board.techstack_id}" />
                        </span>
                        <span class="tag green">포지션:
                          <c:out value="${board.position_id}" />
                        </span>
                      </div>
                    </div>

                    <!-- Footer -->
                    <div class="footer">
                      <div class="icon">
                        <span>@
                          <c:out value="${board.user_id}" />
                        </span>
                      </div>
                      <div class="icon">
                        <span>댓글 0</span>
                        <span>조회수
                          <c:out value="${board.views}" />
                        </span>
                      </div>
                    </div>
                  </div>
                </a>
              </c:if>
            </c:forEach>
          </div>

          <!-- 페이지네이션 -->
          <div class="pagination-container">
            <div class="pagination">
              <!-- 이전 버튼 -->
              <c:if test="${pageMaker.prev}">
                <a href="?pageNum=${pageMaker.startPage - 1}&amount=${pageMaker.cri.amount}" class="prev">Previous</a>
              </c:if>

              <!-- 페이지 번호 -->
              <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <a href="?pageNum=${num}&amount=${pageMaker.cri.amount}"
                  class="${pageMaker.cri.pageNum == num ? 'active' : ''}">${num}</a>
              </c:forEach>

              <!-- 다음 버튼 -->
              <c:if test="${pageMaker.next}">
                <a href="?pageNum=${pageMaker.endPage + 1}&amount=${pageMaker.cri.amount}" class="next">Next</a>
              </c:if>
            </div>
          </div>


          <!-- end Pagination -->

          <form id='actionForm' action="/board/list" method='get'>
            <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
            <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
          </form>
        </div>
        </div>
        <!-- Modal 추가 -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
          aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
              </div>
              <div class="modal-body">처리가 완료되었습니다.</div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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

          $(function () {

            var result = '<c:out value="${result}"/>';

            checkModal(result);

            history.replaceState({}, null, null);

            function checkModal(result) {

              if (result === '' || history.state) {
                return;
              }

              if (parseInt(result) > 0) {
                $(".modal-body").html("게시글 " + parseInt(result) + "번이 등록되었습니다.");
              }

              $("#myModal").modal("show");
            }

            $("#regBtn").on("click", function () {

              self.location = "/board/register";

            });

            var actionForm = $("#actionForm");

            $(".paginate_button a").on("click", function (e) {

              e.preventDefault();

              console.log('click');

              actionForm.find("input[name='pageNum']").val($(this).attr("href"));
              actionForm.attr("action", "/board/list");
              actionForm.submit();
            });

            $(".move").on("click", function (e) {

              e.preventDefault();
              actionForm.find("input[name='bno']").remove();
              actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
              actionForm.attr("action", "/board/get");
              actionForm.submit();

            });
          });

        </script>

        <%@include file="../includes/footer.jsp" %>