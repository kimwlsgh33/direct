// 게시글 관련 함수

// 게시글 등록
function fn_reviewRegister() {
  // alert("게시글 등록 버튼을 눌렀습니다.")

  // 입력한 값을 가져온다.
  let subject = $("#subject").val();
  let user_id = $("#user_id").val();
  let product_no = $("#product_no").val();
  let rating = $("#rating").val();
  let content = $("#content").val();
  let img_url = $("#img_url").val();
  //let item_name = $("#item_name").val();

  alert(subject + ":" + rating + ":" + content + ":" + product_no + ":" + img_url);

  // 제목 항목에 값이 없으면 입력하도록 한다.
  if ($("#subject").val() == "") {
    alert("제목은 필수 입력 항목입니다.");
    $("#subject").focus();
    return false;
  }

  // rating 항목에 값이 없으면 입력하도록 한다.
  if ($("#rating").val() == "") {
    alert("평점은 필수 입력 항목입니다.");
    $("#rating").focus();
    return false;
  }
  
   // 상품번호 항목에 값이 없으면 입력하도록 한다.
  if ($("#product_no").val() == "") {
    alert("상품번호는 필수 입력 항목입니다.");
    $("#product_no").focus();
    return false;
  }

  // 내용 항목에 값이 없으면 입력하도록 한다.
  if ($("#content").val() == "") {
    alert("내용은 필수 입력 항목입니다.");
    $("#content").focus();
    return false;
  }

  $.ajax({
    type: "POST",
    url: "/review/reviewRegister",
    data: {
      subject: subject,
      user_id: user_id,
      rating: rating,
      product_no: product_no,
      content: content,
      img_url: img_url,
      //item_name: item_name,
    },
    success: function (data) {
      if (data == "Y") {
        alert("리뷰 등록 완료");
        // 리뷰 등록이 완료되면 리뷰 목록 화면으로 이동한다.
        location.href = "/review/reviewList";
      }
    },
    error: function (data) {
      alert("리뷰를 등록하는데 실패했습니다.");
    },
  });
}
// 게시글 수정 화면 불러오기

// form에  action과 method가 없기 때문에 여기서 만든다.
// <form action="/review/reviewUpdateForm", method="POST", id="frm">
// 전송할 seq를 담아놓은 것이 없으므로, input을 만들어서 seq값을 전송한다.
// frm.append($('만들 태그',{태그에 사용할 속성 : 값, 속성 : 값, ......}))
// <input type="hidden" name="review_no" value=review_no/> body에 한줄 추가


function fn_reviewUpdateForm(review_no) {

	alert("fn_reviewUpdateForm(review_no) => " + review_no);
	
	var f = $("#frm");
	f.attr("action", "/review/reviewUpdateForm");
	f.attr("method", "POST");
	f.append($('<input/>', {type: 'hidden', name: 'review_no', value: review_no}));
	f.appendTo('body');
	f.submit();
}

// 게시글 수정
function fn_reviewUpdate() {
	var review_no = $("#review_no").val();
	var item_name = $("#item_name").val();
	var subject = $("#subject").val();
	// var user_id = $("#user_id").val();
	var content = $("#content").val();
	var rating = $("#rating").val();
	
	alert(review_no + "-" + item_name + "-" + subject + "-" + rating + "-" + content);
	
	$.ajax({
		type: "POST",
		url: "/review/reviewUpdate",
		data: {review_no: review_no, item_name: item_name, subject: subject, rating: rating, content: content},
		success: function(data) {
			if(data == "Y") {
				alert("리뷰 수정 완료!")
				// fn_reviewDetail(review_no); // 리뷰 번호에 해당하는 상세페이지로 이동하기
				location.href = "/review/reviewList"; // 리뷰 목록으로 바로가기
			} else {
				alert("리뷰가 수정되지 않았습니다.\n\n잠시 후에 다시 시도해주세요.");
			}
		},
		error: function(data) {
			alert("데이터를 수정하는데 실패했습니다.\n\n잠시 후에 다시 시도해주세요.");
			console.log(data);
		}
	})
}



// 게시글 삭제
function fn_reviewDelete(review_no){
	if(!confirm("리뷰를 삭제하시겠습니까?\n\n삭제를 하시려면 [확인]을 누르시고, 아니면 [취소]를 누르십시오")) {
		alert("리뷰 삭제를 취소했습니다.");
	} else {
		$.ajax({
			type: "POST",
			url: "/review/reviewDelete",
			data: {review_no : review_no},
			success: function(data) {
				if(data == "Y") {
					alert("리뷰 삭제가 완료되었습니다.");
					location.href = "/review/reviewList";
				}
			},
			error: function(data) {
				alert("리뷰 삭제하는데 문제가 발생했습니다.\n\n잠시 후 다시 시도해주세요.");
			}
		});
	}
}

// 게시글 번호에 해당하는 상세페이지로 이동하기
function fn_boardDetail(review_no) {
	location.href = "/review/reviewDetail?review_no=" + review_no;
}

