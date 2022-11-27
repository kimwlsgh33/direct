<%--
  Created by IntelliJ IDEA.
  User: gimjinho
  Date: 2022/11/27
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Upload</title>
    <style>
        #fileDrop {
            height:         200px;
            border: 2px dashed #0B85A1;
            border-spacing: 15px;
            border-radius: 22px;
        }
    </style>
</head>
<body>
<jsp:include page="../../common/header.jsp" flush="false"/>
<div class="container-fluid">
    <div id="fileDrop" class="w-100 mt-3 position-relative">
        <div class="position-absolute top-50 start-50 translate-middle">사진을 드래그..</div>
    </div>
    <button type="button" id="submitBtn" class="btn btn-primary mt-3" style="display: none;" onclick="uploadFile()">Submit</button>
    <div id="uploadList" class="w-100 d-flex flex-wrap mt-3 gap-3"></div>
</div>
</body>
<script>
    let fileArray = [];
    $(document).ready(function () {
        let fileDrop = $('#fileDrop');
        let uploadList = $('#uploadList');
        let fileIndex = 0;

        fileDrop.on('dragenter', function (e) { // 드래그 요소가 드롭 영역에 진입
            e.stopPropagation(); // 이벤트 전파 방지
            e.preventDefault(); // 기본 동작 방지
            $(this).css('border', '2px solid #0B85A1'); // 테두리 진하게
        });
        fileDrop.on('dragleave', function (e) { // 드래그 요소가 드롭 영역을 벗어남
            e.stopPropagation();
            e.preventDefault();
            $(this).css('border', '2px dashed #0B85A1'); // 테두리를 원래대로
        });
        fileDrop.on('dragover', function (e) { // 드래그 요소가 드롭 영역 위에서 움직임
            e.stopPropagation();
            e.preventDefault();
        });
        fileDrop.on('drop', function (e) { // 드래그 요소가 드롭 영역에 드롭됨
            e.preventDefault();
            $(this).css('background-image', '2px dotted #0B85A1'); // 테두리를 원래대로
            let files = e.originalEvent.dataTransfer.files;
            if (files != null) {
                if (files.length < 1) {
                    alert('파일 정보가 없습니다.');
                    return false;
                }
                selectFile(files);
            } else {
                alert('ERROR');
            }
        });

        function selectFile(files) {
            if (files != null) {
                alert("파일을 선택했습니다.");
                console.log(files);

                let filesArr = Array.prototype.slice.call(files); // 받은 파일들을 배열로 변환
                filesArr.forEach(function (f) {
                    if (!f.type.match("image.*")) { // 이미지 파일 확인
                        alert("확장자는 이미지 확장자만 가능합니다.");
                        return;
                    }
                    fileArray.push(f); // 이미지 파일 배열에 추가
                    let reader = new FileReader(); // 파일을 읽기 위한 FileReader객체 생성
                    reader.onload = function (e) { // 파일 읽어들이기를 성공했을 때 호출되는 이벤트 핸들러
                        let html = "<div class='position-relative shadow rounded-4 overflow-hidden' id='fileIndex" + fileIndex + "' style='width:250px; height:250px;'>" + // 파일마다, 고유한 id를 가진 div를 생성
                                    "<img src=\"" + e.target.result + "\" data-file='" + fileIndex + "' class='w-100 h-100' style='object-fit: contain;'>" +
                            "<button onclick='deleteFile(" + fileIndex + ")' type='button' class='btn btn-outline-danger btn-sm position-absolute bottom-0 end-0 translate-middle' data-file='" + fileIndex + "'><i class='fa-solid fa-circle-xmark'></i></button>" +
                            "</div>";
                        uploadList.append(html);
                        fileIndex++;
                    }
                    reader.readAsDataURL(f); // 파일을 읽어 dataURL형식의 문자열로 저장
                    $("#submitBtn").show();
                });
            }
        }
    });
    function uploadFile() {
        let formData = new FormData(); // 폼 데이터 객체 생성
        for (let i = 0; i < fileArray.length; i++) {
            formData.append("uploadFile", fileArray[i]); // 폼 데이터에 파일 추가
        }
        $.ajax({
            url: '/util/upload/uploadAjax',
            type: 'POST',
            data: formData,
            enctype: 'multipart/form-data',
            processData: false, // 필수 ( 폼 데이터 객체를 전송할 때, 기본적으로 query string 형식으로 변환되는데, 이를 방지하기 위해 false로 설정 )
            contentType: false, // 필수 ( multipart/form-data 형식으로 전송하기 위해 false로 설정 )
            cache: false,
            success: function (result) {
                alert("success");
            },
            error: function (result) {
                alert("error");
            }
        });
    }
    function deleteFile(fileIndex) {
        $("#fileIndex" + fileIndex).remove(); // 파일 div 삭제
        fileArray.splice(fileIndex, 1); // 배열에서 해당 파일 삭제
    }
</script>
</html>

<%--
  [ http 업로드 과정 ]
  form의 submit 함수가 실행되면, 내부 컨트롤들의 값들을 Request 객체의 body에 담아서 전송한다.
  이때 전달하는 데이터의 형식을 지정해주어야, 이를 통해 서버가 전달받은 데이터를 어떻게 처리할지 결정할 수 있다.
  ( enctype="multipart/form-data" )

  Request body는, 한 종류의
--%>