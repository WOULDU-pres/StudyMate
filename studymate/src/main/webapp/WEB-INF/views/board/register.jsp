<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

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
			
			<div class="panel-heading">Board Register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
				<form role="form" action="/board/register" method="post">
					<!-- Recruitment Type Field -->
                    <div class="form-group">
                        <label>Recruitment Type</label>
                        <select class="form-control" name="recruitmenttype_id">
                            <option value="1">스터디</option>
                            <option value="2">프로젝트</option>
                        </select>
                    </div>

                    <!-- Recruitment Number Field -->
                    <div class="form-group">
                        <label>Recruitment Number</label>
                        <select class="form-control" name="recruitmentnumber_id">
                            <option value="1">인원 미정</option>
                            <option value="2">1명</option>
                            <option value="3">2명</option>
                            <option value="4">3명</option>
                            <option value="5">4명</option>
                            <option value="6">5명</option>
                            <option value="7">6명</option>
                            <option value="8">7명</option>
                            <option value="9">8명</option>
                            <option value="10">9명</option>
                            <option value="11">10명 이상</option>
                        </select>
                    </div>
                    
                    <!-- Position Field -->
                    <div class="form-group">
                        <label>Position</label>
                        <select class="form-control" name="position_id">
                            <option value="1">프론트엔드</option>
                            <option value="2">백엔드</option>
                            <option value="3">디자이너</option>
                            <option value="4">IOS</option>
                            <option value="5">안드로이드</option>
                            <option value="6">데브옵스</option>
                            <option value="7">PM</option>
                            <option value="8">기획자</option>
                            <option value="9">마케터</option>
                        </select>
                    </div>

                    <!-- Tech Stack Field -->
                    <div class="form-group">
                        <label>Tech Stack</label>
                        <select class="form-control" name="techstack_id">
                            <option value="1">React</option>
                            <option value="2">Vue</option>
                            <option value="3">Node.js</option>
                            <option value="4">Spring</option>
                            <option value="5">Java</option>
                            <option value="6">Python</option>
                            <option value="7">Spring</option>
                            <option value="8">Oracle</option>
                            <option value="9">Git</option>
                            <option value="10">Figma</option>
                        </select>
                    </div>

                    <!-- Work Type Field -->
                    <div class="form-group">
                        <label>Work Type</label>
                        <select class="form-control" name="worktype_id">
                            <option value="1">온라인</option>
                            <option value="2">오프라인</option>
                            <option value="3">온/오프라인</option>
                        </select>
                    </div>

                    <!-- Duration Field -->
                    <div class="form-group">
                        <label>Duration</label>
                        <select class="form-control" name="duration_id">
                            <option value="1">기간 미정</option>
                            <option value="2">1개월</option>
                            <option value="3">2개월</option>
                            <option value="4">3개월</option>
                            <option value="5">4개월</option>
                            <option value="6">5개월</option>
                            <option value="7">6개월</option>
                            <option value="8">정기</option>
                        </select>
                    </div>

                    <!-- Deadline Field -->
                    <div class="form-group">
                        <label>Deadline</label>
                        <select class="form-control" name="deadline">
                            <option value="2024-12-31">2024-12-31</option>
                        </select>
                    </div>
				
					<div class="form-group">
						<label>Title</label> <input class="form-control" name='title'>
					</div>
					
					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" name='content'></textarea>
					</div>
					
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name='writer'>
					</div>
					<button type="submit" class="btn btn-default">Submit Button</button>
					<button type="reset" class="btn btn-default">Reset Button</button>
				</form>
			</div>
			<!-- end panel body -->
		</div>
		<!-- end panel body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->
<%@include file="../includes/footer.jsp" %>