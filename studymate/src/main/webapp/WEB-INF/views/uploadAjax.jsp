<!-- Written By 주현우 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<style>
.uploadResult {
	width: 60%; 
	background-color: white;
	border: 2px solid #B3E56A;
	padding: 40px;
	border-radius: 10px; 
	text-align: left; 
}

/* 업로드 결과의 리스트 스타일 */
.uploadResult ul {
	display: block; 
	padding: 0; 
	margin: 0;
	overflow: hidden;
	list-style: none;
}

/* 리스트 항목(li)의 스타일 */
.uploadResult ul li {
	list-style: none; 
	margin-bottom: 5px; 
	padding: 5px; 
	font-size: 14px;
	display: flex;
	align-items: center;
	justify-content: flex-start;
	text-align: left;
}

/* 리스트 항목의 <a> 태그 스타일 */
.uploadResult ul li a {
	display: flex; 
	align-items: center; 
	text-decoration: none; 
	color: inherit;
}

/* 리스트 항목의 이미지 스타일 */
.uploadResult ul li img {
	width: 30px; 
	height: 30px;
	margin-right: 10px; 
	border-radius: 5px;
}

.uploadResult ul li div {
    display: flex;
    align-items: center; 
    gap: 10px;
}

.uploadResult ul li span {
    display: flex;
    justify-content: center;
    align-items: center; 
    width: 15px; 
    height: 15px; 
    font-size: 13px;
    text-align: center; 
    border-radius: 50%; 
    border: 2px solid #B3E56A; 
    color: #B3E56A; 
    font-weight: bold; 
    cursor: pointer; 
    margin-left: 10px; 
    transition: box-shadow 0.3s, background-color 0.3s; 
}

/* 버튼 호버 효과 */
.uploadResult ul li span:hover {
    box-shadow: 0 0 10px #9ACD32; /* 초록색 그림자 추가 */
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
					var downloadLink = "<a href='/download?fileName=" + obj.fileName + "'>" + icon + obj.fileName + "</a>"
					var removeButton = "<span data-file='" + obj.fileName + "' data-type='file'> x </span>";
					str += "<li>" + "<div>" + downloadLink + removeButton + "</div>" + "</li>"
				});
				uploadResult.append(str);

			}
			
			$(".uploadResult").on("click", "span", function(e){
				
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				console.log(targetFile);
				
				$.ajax({
					url : '/deleteFile',
					data: {fileName: targetFile, type:type},
					dataType: 'text',
					type: 'POST',
					success: function(result){
			            if (result === "delete") {
			                alert("파일 삭제 성공");
			                $(e.target).closest("li").remove(); 
			            } else {
			                alert("삭제 실패");
			            }
					}
				
				});
			});

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