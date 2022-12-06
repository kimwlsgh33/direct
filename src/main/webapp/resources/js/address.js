// 주소 관련 함수

// 주소 등록
function fn_addressRegister() {
  // alert("주소 등록 버튼을 눌렀습니다.")
  fullAddress(); // 우편번호+상세주소 합치는 함수

  // 입력한 값을 가져온다.
  let addr_name = $("#addr_name").val();
  let addr_number = $("#addr_number").val();
  let address = $("#address").val();
  let id = $("#id").val();

  alert(addr_name + ":" + addr_number + ":" + address);
  
  // 받는사람 항목에 값이 없으면 입력하도록 한다.
  if ($("#addr_name").val() == "") {
    alert("받는사람은 필수 입력 항목입니다.");
    $("#addr_name").focus();
    return false;
  }
  
  // 번호 항목에 값이 없으면 입력하도록 한다.
  if ($("#addr_number").val() == "") {
    alert("번호는 필수 입력 항목입니다.");
    $("#addr_number").focus();
    return false;
  }

  // 주소 항목에 값이 없으면 입력하도록 한다.
  if ($("#address").val() == "") {
    alert("주소는 필수 입력 항목입니다.");
    $("#address").focus();
    return false;
  }

  $.ajax({
    type: "POST",
    url: "/util/addressRegister",
    data: {
      addr_name: addr_name,
      addr_number: addr_number,
      address: address,
      id: id,
    },
    success: function (data) {
      if (data == "Y") {
        alert("주소 등록 완료");
        // 주소 등록이 완료되면 주소 목록 화면으로 이동한다.
        location.href = "/util/addressList";
      }
    },
    error: function (data) {
      alert("주소를 등록하는데 실패했습니다.");
    },
  });
}


// 게시글 삭제
function fn_addressDelete(addr_no){
	if(!confirm("주소를 삭제하시겠습니까?\n\n삭제를 하시려면 [확인]을 누르시고, 아니면 [취소]를 누르십시오")) {
		alert("주소 삭제를 취소했습니다.");
	} else {
		$.ajax({
			type: "POST",
			url: "/util/addressDelete",
			data: {addr_no : addr_no},
			success: function(data) {
				if(data == "Y") {
					alert("주소 삭제가 완료되었습니다.");
					location.href = "/util/addressList";
				}
			},
			error: function(data) {
				alert("주소 삭제하는데 문제가 발생했습니다.\n\n잠시 후 다시 시도해주세요.");
			}
		});
	}
}



