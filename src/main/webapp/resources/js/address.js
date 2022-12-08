// 주소 관련 함수

// 주소 등록
function fn_addressRegister() {
  // alert("주소 등록 버튼을 눌렀습니다.")
  // fullAddress(); // 우편번호+상세주소 합치는 함수

  // 입력한 값을 가져온다.
  let receiver = $("#receiver").val();
  let user_id = $("#user_id").val();
  let phone = $("#phone").val();
  let zip_code = $("#zip_code").val();
  let address = $("#address").val();
  let address_detail = $("#address_detail").val();

  alert(receiver + ":" + phone + ":" + zip_code + ":" + address + ":" + address_detail);
  
  // 받는사람 항목에 값이 없으면 입력하도록 한다.
  if ($("#receiver").val() == "") {
    alert("받는사람은 필수 입력 항목입니다.");
    $("#receiver").focus();
    return false;
  }
  
  // 번호 항목에 값이 없으면 입력하도록 한다.
  if ($("#phone").val() == "") {
    alert("번호는 필수 입력 항목입니다.");
    $("#phone").focus();
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
      receiver: receiver,
      phone: phone,
      zip_code: zip_code,
      address: address,
      address_detail: address_detail,
      user_id: user_id,
    },
    success: function (data) {
      if (data == "Y") {
        alert("주소 등록 완료");
        // 주소 등록이 완료되면 주소 목록 화면으로 이동한다.
        location.href = "/util/addressList?user_id=${user_id}";
      }
    },
    error: function (data) {
      alert("주소를 등록하는데 실패했습니다.");
    },
  });
}


// 주소 삭제
function fn_addressDelete(address_id){
	if(!confirm("주소를 삭제하시겠습니까?\n\n삭제를 하시려면 [확인]을 누르시고, 아니면 [취소]를 누르십시오")) {
		alert("주소 삭제를 취소했습니다.");
	} else {
		$.ajax({
			type: "POST",
			url: "/util/addressDelete",
			data: {address_id : address_id},
			success: function(data) {
				if(data == "Y") {
					alert("주소 삭제가 완료되었습니다.");
					location.href = "/util/addressList?user_id=1";
				}
			},
			error: function(data) {
				alert("주소 삭제하는데 문제가 발생했습니다.\n\n잠시 후 다시 시도해주세요.");
			}
		});
	}
}

// 주소 수정 화면 불러오기

// form에  action과 method가 없기 때문에 여기서 만든다.
// <form action="/util/addressUpdateForm", method="POST", id="frm">
// 전송할 addr_no를 담아놓은 것이 없으므로, input을 만들어서 addr_no값을 전송한다.
// frm.append($('만들 태그',{태그에 사용할 속성 : 값, 속성 : 값, ......}))
// <input type="hidden" name="addr_no" value=addr_no/> body에 한줄 추가


function fn_addressUpdateForm(address_id) {

	alert("fn_addressUpdateForm(address_id) => " + address_id);
	
	var f = $("#addr");
	f.attr("action", "/util/addressUpdateForm");
	f.attr("method", "POST");
	f.append($('<input/>', {type: 'hidden', name: 'address_id', value: address_id}));
	f.appendTo('body');
	f.submit();
}

// 주소 수정
function fn_addressUpdate() {
	var address_id = $("#address_id").val();
	var receiver = $("#receiver").val();
	var phone = $("#phone").val();
	var zip_code = $("#zip_code").val();
	var address = $("#address").val();
	var address_detail = $("#address_detail").val();
	var user_id = $("#user_id").val();
	
	alert(address_id + "-" + receiver + "-" + phone + "-" + zip_code + "-" + address + "-" + address_detail + "-" + user_id);
	
	$.ajax({
		type: "POST",
		url: "/util/addressUpdate",
		data: {address_id: address_id, receiver: receiver, phone: phone, zip_code: zip_code, address: address, address_detail: address_detail},
		success: function(data) {
			if(data == "Y") {
				alert("주소 수정 완료!")
				location.href = "/util/addressList?user_id=1"; // 주소 목록으로 바로가기
			} else {
				alert("주소가 수정되지 않았습니다.\n\n잠시 후에 다시 시도해주세요.");
			}
		},
		error: function(data) {
			alert("데이터를 수정하는데 실패했습니다.\n\n잠시 후에 다시 시도해주세요.");
			console.log(data);
		}
	})
}



// 대표주소 설정 시 addressList테이블의 주소가 myinfo 테이블의 주소로 변경
function fn_AAA() {
	let address_id = $("#address_id").val();
	let user_id = $("#user_id").val();
	let zip_code = $("#zip_code").val();
	let address = $("#address").val();
	let address_detail = $("#address_detail").val();
	
	alert(address_id + "-" + user_id + "-" + zip_code + "-" + address + "-" + address_detail);
	
	$.ajax({
		type: "POST",
		url: "/member/memberAddress",
		data: {address_id: address_id, user_id: user_id, zip_code: zip_code, address: address, address_detail: address_detail},
		success: function(data) {
			alert("대표주소 설정 완료");
			location.href = "/member/listMembers.do";
			// location.href = "/util/addressList?user_id=1";
		},
		error: function(data) {
			alert("대표주소 설정 실패했습니다.\n\n잠시 후에 다시 시도해주세요.");
			console.log(data);
		}
	})
}



