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
    <script src="${ctx}/resources/js/upload.js"></script>
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
<jsp:include page="../common/header.jsp" flush="false"/>
<div class="w-100 d-flex flex-column align-items-center">
    <form id="uploadForm" action="${ctx}/itemVO/create" method="post" class="w-75">
        <input type="hidden" name="_method" value="put">
        <div class="w-100 pt-3">
            <div class="w-25 d-flex align-items-center mb-3">
                <div class="me-2">카테고리</div>
                <select id="selectCategory" class="form-select-sm" aria-label="Select Category">
                    <option selected>카테고리 선택</option>
                    <c:forEach var="categoryVO" items="${categoryVOList}">
                        <option value="${categoryVO.category_id}" class="dropdown-itemVO">${categoryVO.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-text">상품명</div>
                <input id="name" name="name" type="text" class="form-control" aria-label="Product Name">
                <button id="optionAdd" class="btn btn-primary" type="button" onclick="console.log('option');">옵션 추가</button>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-text">가격</div>
                <input id="price" name="price" type="text" class="form-control" aria-label="Price">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-text">재고</div>
                <input id="stock" name="stock" type="text" class="form-control" aria-label="Stock">
            </div>
            <div class="input-group">
                <div class="input-group-text">상품 설명</div>
                <textarea id="description" name="description" class="form-control" aria-label="Product Description"></textarea>
            </div>
        </div>

        <div id="uploadList" class="w-100 d-flex flex-wrap mt-3 gap-3"></div>
        <div id="fileDrop" class="w-100 mt-3 position-relative">
            <div class="position-absolute top-50 start-50 translate-middle">사진을 드래그..</div>
        </div>
        <button type="button" id="submitBtn" class="btn btn-primary mt-3" style="display: none;" onclick="uploadFiles()">Submit</button>
    </form>
</div>
</body>
<script>
    let fileArray = [];
    $(document).ready(function () {
        $("#uploadForm").submit(function (e) {
            e.preventDefault();
        });

        let fileDrop = $("#fileDrop");
        let uploadList = $("#uploadList");
        let fileIndex = 0;

        fileDrop.on("dragenter", function (e) {
            // 드래그 요소가 드롭 영역에 진입
            e.stopPropagation(); // 이벤트 전파 방지
            e.preventDefault(); // 기본 동작 방지
            $(this).css("border", "2px solid #0B85A1"); // 테두리 진하게
        });
        fileDrop.on("dragleave", function (e) {
            // 드래그 요소가 드롭 영역을 벗어남
            e.stopPropagation();
            e.preventDefault();
            $(this).css("border", "2px dashed #0B85A1"); // 테두리를 원래대로
        });
        fileDrop.on("dragover", function (e) {
            // 드래그 요소가 드롭 영역 위에서 움직임
            e.stopPropagation();
            e.preventDefault();
        });
        fileDrop.on("drop", function (e) {
            // 드래그 요소가 드롭 영역에 드롭됨
            e.preventDefault();
            $(this).css("background-image", "2px dotted #0B85A1"); // 테두리를 원래대로
            let files = e.originalEvent.dataTransfer.files;
            if (files != null) {
                if (files.length < 1) {
                    alert("파일 정보가 없습니다.");
                    return false;
                }
                selectFile(files);
            } else {
                alert("ERROR");
            }
        });

        function selectFile(files) {
            if (files != null) {
                // console.log(files);

                let filesArr = Array.prototype.slice.call(files); // 받은 파일들을 배열로 변환
                filesArr.forEach(function (f) {
                    if (!f.type.match("image.*")) {
                        // 이미지 파일 확인
                        alert("확장자는 이미지 확장자만 가능합니다.");
                        return;
                    }
                    fileArray.push(f); // 이미지 파일 배열에 추가
                    let reader = new FileReader(); // 파일을 읽기 위한 FileReader객체 생성
                    reader.onload = function (e) {
                        // 파일 읽어들이기를 성공했을 때 호출되는 이벤트 핸들러
                        let html =
                            "<div class='position-relative shadow rounded-4 overflow-hidden' id='fileIndex" +
                            fileIndex +
                            "' style='width:250px; height:250px;'>" + // 파일마다, 고유한 id를 가진 div를 생성
                            '<img src="' +
                            e.target.result +
                            "\" data-file='" +
                            fileIndex +
                            "' class='w-100 h-100' style='object-fit: contain;'>" +
                            "<button onclick='deleteFile(" +
                            fileIndex +
                            ")' type='button' class='btn btn-outline-danger btn-sm position-absolute bottom-0 end-0 translate-middle' data-file='" +
                            fileIndex +
                            "'><i class='fa-solid fa-circle-xmark'></i></button>" +
                            "</div>";
                        uploadList.append(html);
                        fileIndex++;
                    };

                    reader.readAsDataURL(f); // 파일을 읽어 dataURL형식의 문자열로 저장
                    $("#submitBtn").show();
                });
            }
        }
    });
</script>
</html>

<%--
  [ http 업로드 과정 ]
  form의 submit 함수가 실행되면, 내부 컨트롤들의 값들을 Request 객체의 body에 담아서 전송한다.
  이때 전달하는 데이터의 형식을 지정해주어야, 이를 통해 서버가 전달받은 데이터를 어떻게 처리할지 결정할 수 있다.
  ( enctype="multipart/form-data" )

  Request body는, 한 종류의
--%>