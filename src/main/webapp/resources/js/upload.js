

function uploadFiles() {
  let formData = new FormData(); // 폼 데이터 객체 생성

  const category_id = $("#selectCategory").find("option:selected").val();
  const name = $("#name").val();
  const price = $("#price").val() * 1;
  const stock = $("#stock").val() * 1;
  const description = $("#description").val();

  if(category_id == "") {
    alert("카테고리를 선택하세요.");
    return;
  } else if(name == "") {
    alert("상품명을 입력하세요.");
    return;
  } else if(price == "") {
    alert("가격을 입력하세요.");
    return;
  } else if(stock == "") {
    alert("재고를 입력하세요.");
    return;
  } else if(description == "") {
    alert("상품 설명을 입력하세요.");
    return;
  } else if(fileArray.length == 0) {
    alert("이미지를 등록하세요.");
    return;
  } else if(fileArray.length > 5) {
    alert("이미지는 최대 5개까지 등록 가능합니다.");
    return;
  } else if(typeof price != "number") {
    alert("가격은 숫자만 입력 가능합니다.");
    return;
  } else if(typeof stock != "number") {
    alert("재고는 숫자만 입력 가능합니다.");
    return;
  } else if(price < 0) {
    alert("가격은 0보다 작을 수 없습니다.");
    return;
  } else if(stock < 0) {
    alert("재고는 0보다 작을 수 없습니다.");
    return;
  } else if(price % 1 != 0) {
    alert("가격은 소수점을 포함할 수 없습니다.");
    return;
  } else if(stock % 1 != 0) {
    alert("재고는 소수점을 포함할 수 없습니다.");
    return;
  } else if(price > 1000000000) {
    alert("가격은 10억 이하로 입력하세요.");
    return;
  } else if(stock > 1000000000) {
    alert("재고는 10억 이하로 입력하세요.");
    return;
  } else if(description.length > 1000) {
    alert("상품 설명은 1000자 이하로 입력하세요.");
    return;
  } else if(name.length > 100) {
    alert("상품명은 100자 이하로 입력하세요.");
    return;
  } else if(stock == 0) {
    alert("재고는 0보다 커야 합니다.");
    return;
  }

  alert("업로드를 시작합니다." + "[카테고리 : " + category_id + "][상품명 : " + name + "][가격 : " + price + "][재고 : " + stock + "][상품설명 : " + description + "]");

  formData.append("category_id", category_id);
  formData.append("name", name);
  formData.append("price", price);
  formData.append("stock", stock);
  formData.append("description", description);

  for (let i = 0; i < fileArray.length; i++) {
    formData.append("uploadFiles", fileArray[i]); // 폼 데이터에 파일 추가
  }

  $.ajax({
    url: "/item/uploadAjax",
    type: "POST",
    data: formData,
    enctype: "multipart/form-data",
    processData: false, // 필수 ( 폼 데이터 객체를 전송할 때, 기본적으로 query string 형식으로 변환되는데, 이를 방지하기 위해 false로 설정 )
    contentType: false, // 필수 ( multipart/form-data 형식으로 전송하기 위해 false로 설정 )
    cache: false,
    success: function (result) {
      alert("업로드가 완료되었습니다.");
      location.href = "/item/createForm";
    },
    error: function (result) {
      alert("업로드 실패");
      console.log(result.message);
    },
  });
}
function deleteFile(fileIndex) {
  $("#fileIndex" + fileIndex).remove(); // 파일 div 삭제
  fileArray.splice(fileIndex, 1); // 배열에서 해당 파일 삭제
}
function addOption(){
  let optionLength = $("#option tr").length;
  const optionForm = '<div><input type="text" name="optionName" placeholder="옵션명" /><input type="text" name="optionPrice" placeholder="옵션가격" /><input type="text" name="optionStock" placeholder="옵션재고" /></div>';
}