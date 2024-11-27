<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<!-- Written By 주현우 -->
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SeSAC STUDYMATE</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    
    <!-- Written by 주현우 -->
    <!-- Header -->
    <link rel="stylesheet" href="/resources/dist/css/header.css">
    <!-- Table Container -->
    <link rel="stylesheet" href="/resources/dist/css/table-container.css">
    <!-- Sidebar -->
    <link rel="stylesheet" href="/resources/dist/css/sidebar.css">
    

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div class="header">
        <div class="header-left">
    		<a href="/board/list" class="brand-link">
	            <img src="/resources/img/sesac_logo.png" alt="SeSAC Logo" class="logo">
	            <span class="brand-name">SeSAC STUDYMATE</span>
            </a>
        </div>
        <div class="header-right">
            <button id='regBtn' class="btn recruit-btn">팀원 모집하기</button>
            
            <button class="btn business-btn">비즈니스 문의</button>
            <div class="notification">
                <i class="bell-icon">🔔</i>
                <span class="notification-badge">1</span>
            </div>
            <div class="profile">
                <i class="profile-icon">😊</i>
            </div>
        </div>
    </div>
    
    <div class="sidebar">
	    <ul class="sidebar-menu">
	        <li><a href="/project">프로젝트</a></li>
	        <li><a href="/study">스터디</a></li>
	    </ul>
	    <div class="search-bar">
	        <input type="text" placeholder="검색..." class="search-input">
	        <button class="search-btn">🔍</button>
	    </div>
	</div>
		    <div id="page-wrapper">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>