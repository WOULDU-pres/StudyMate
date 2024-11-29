<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/register.css">

<div class="form-container">
    <!-- 제목 -->
    <h1 class="form-title">프로젝트 등록하기</h1>

    <form role="form" action="/board/register" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
    
        <!-- 첫 번째 행: 모집 구분, 모집 인원 -->
        <div class="form-row">
            <div class="form-group">
                <label>모집 구분</label>
                <select class="form-control" name="recruitmenttype_id">
                    <option value="1">스터디</option>
                    <option value="2">프로젝트</option>
                </select>
            </div>
            <div class="form-group">
                <label>모집 인원</label>
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
        </div>

        <!-- 두 번째 행: 진행 방식, 진행 기간 -->
        <div class="form-row">
            <div class="form-group">
                <label>진행 방식</label>
                <select class="form-control" name="worktype_id">
                    <option value="1">온라인</option>
                    <option value="2">오프라인</option>
                    <option value="3">온/오프라인</option>
                </select>
            </div>
            <div class="form-group">
                <label>진행 기간</label>
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
        </div>

        <!-- 세 번째 행: 기술 스택, 모집 마감일 -->
        <div class="form-row">
            <div class="form-group">
                <label>기술 스택</label>
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
            <div class="form-group">
                <label>모집 마감일</label>
                <input type="date" class="form-control" name="deadline" value="2024-12-31">
            </div>
        </div>

        <!-- 네 번째 행: 포지션, 연락 방법 -->
        <div class="form-row">
            <div class="form-group">
                <label>포지션</label>
                <select class="form-control" name="position_id">
                    <option value="1">백엔드</option>
                    <option value="2">프론트엔드</option>
                    <option value="3">풀스택</option>
                    <option value="4">디자이너</option>
                </select>
            </div>
            <div class="form-group">
                <label>연락 방법</label>
                <select class="form-control" name="contactmethod_id">
                    <option value="1">이메일</option>
                    <option value="2">전화</option>
                    <option value="3">문자</option>
                    <option value="4">카카오톡</option>
                </select>
            </div>
        </div>

        <!-- 제목 -->
        <div class="form-group">
            <label>제목</label>
            <input class="form-control" name="title">
        </div>

        <!-- 내용 -->
        <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="5" name="content"></textarea>
        </div>

        <!-- 작성자 -->
        <div class="form-group">
            <label>작성자</label>
            <input class="form-control" name="user_id"
            value='<sec:authentication property="principal.username"/>' readonly="readonly">
            
        </div>

        <!-- 버튼 -->
        <div class="form-buttons">
            <button type="submit" class="btn btn-primary">등록</button>
            <button type="reset" class="btn btn-secondary">초기화</button>
        </div>
    </form>
</div>
<%@include file="../includes/footer.jsp" %>
