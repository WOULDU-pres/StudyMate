<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<style>/* 업로드 결과 전체 스타일 */
.uploadResult {
	width: 60%; /* 업로드 결과 영역의 너비 설정 */
	background-color: white; /* 배경색 흰색 */
	border: 2px solid #B3E56A; /* 초록색 테두리 */
	padding: 40px; /* 내부 여백 */
	border-radius: 10px; /* 모서리 둥글게 */
	text-align: left; /* 전체 내용을 좌측 정렬 */
}

/* 업로드 결과의 리스트 스타일 */
.uploadResult ul {
	display: block; /* 리스트를 블록 형태로 표시 */
	padding: 0; /* 기본 패딩 제거 */
	margin: 0; /* 기본 마진 제거 */
	overflow: hidden; /* 가로 스크롤 방지 */
	list-style: none; /* 리스트 앞의 점 제거 */
}

/* 리스트 항목(li)의 스타일 */
.uploadResult ul li {
	list-style: none; /* 리스트 앞의 점 제거 */
	margin-bottom: 10px; /* 항목 간 간격 */
	padding: 5px; /* 내부 여백 */
	font-size: 14px; /* 글씨 크기 */
	display: flex; /* 이미지와 텍스트를 나란히 정렬 */
	align-items: center; /* 세로 축에서 이미지와 텍스트 정렬 */
	justify-content: flex-start; /* 가로 축에서 좌측 정렬 */
	text-align: left; /* 텍스트 좌측 정렬 */
}

/* 리스트 항목의 이미지 스타일 */
.uploadResult ul li img {
	width: 30px; /* 이미지의 가로 크기 */
	height: 30px; /* 이미지의 세로 크기 */
	margin-right: 10px; /* 이미지와 텍스트 간의 간격 */
	border-radius: 5px; /* 이미지 테두리를 약간 둥글게 */
}

</style>


	<h1>Upload with Ajax</h1>

	<div class='uploadDiv'>
		<input type='file' name='uploadFile' multiple>
	</div>
	<div class='uploadResult'>
		<ul>

		</ul>
	</div>

	<button id='uploadBtn'>Upload</button>

	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {
			var regex = new RegExp("(.*?)\.(exe|sh|alz)$");
			var maxSize = 5242880 //5MB

			function checkExtension(fileName, fileSize) {
				if (fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}

				if (regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드 할 수 없습니다.");
					return false;
				}
				return true;
			}

			var uploadResult = $(".uploadResult ul");

			function showUploadedFile(uploadResultArr) {
				var str = "";
				var icon = "";
				$(uploadResultArr).each(function(i, obj) {
					if(!obj.image){
						icon = "<img src='/resources/img/file_icon.png'>"
					} else {
						icon = "<img src='/resources/img/image_icon.png'>"
					}
					str += "<li>" + icon + obj.fileName + "</li>"
				});
				uploadResult.append(str);

			}

			var cloneObj = $(".uploadDiv")

			$("#uploadBtn").on("click", function(e) {
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				console.log(files);

				// add file data fo formData
				for (var i = 0; i < files.length; i++) {
					if (!checkExtension(files[i].name, files[i].size)) {
						return false
					}

					formData.append("uploadFile", files[i]);
				}

				$.ajax({
					url : '/uploadAjaxAction',
					type : 'POST',
					data : formData,
					processData : false,
					contentType : false,
					success : function(result, response) {
						console.log(result);
						alert("업로드 성공:", response);

						showUploadedFile(result);
						$(".uploadeDiv").html(cloneObj.html());
					},
					error : function(error) {
						alert("업로드 실패:", error);
					}
				});

			});

		});
	</script>
</body>
</html>