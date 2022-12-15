<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>

//-----------------------------------------------------------------------------------------------------------
//페이지 로딩시 게시글에 연결된 쿠폰이 있으면 보여준다.
//-----------------------------------------------------------------------------------------------------------
$(document).ready(function() {
	// couponList();
	function btn_insert() {
		alert("등록 버튼");
	}
});

//-----------------------------------------------------------------------------------------------------------
// jQuery Serialize()
// jQUery Ajax로 호출하기 전에 serialize를 해주면 form안에 값들을
// 한 번에 전송가능한 data로 만들 수 있어서, 많은 data를 보낼 때 유용하다. (Ajax가 아닐 때도 사용가능)
// Format : $("form id" 또는 "form name").serialize();
//-----------------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------------
// 쿠폰 등록 버튼을 눌렀을 경우
//-----------------------------------------------------------------------------------------------------------
$('[name=couponInsertBtn]').click(function() {
	var insertData = $('[name=couponInsertForm]').serialize();	//couponInsertForm의 내용을 가져온다.
	couponInsert(insertData);	
});

//-----------------------------------------------------------------------------------------------------------
// 댓글 등록
//-----------------------------------------------------------------------------------------------------------
function couponInsert(insertData){
    $.ajax({
        url : '/coupon/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                couponList(); //쿠폰등록 후 쿠폰목록 reload
                $('[name=coupon_id]').val('');
                $('[name=user_id]').val('');
            }
        }
    });
}

//-----------------------------------------------------------------------------------------------------------
//댓글 목록 보기
//-----------------------------------------------------------------------------------------------------------
function couponList() {
	alert("내 쿠폰 보여주세요.....");
	
	var user_id = ${user.user_id};
	alert("내 아이디 : " + user_id)
	
	$.ajax({
		url:	'/coupon/list',
		type:	'get',
		data:	{'coupon_id': coupon_id, 'user_id'},
		success: function(data) {
			var str = '';
			$.each(data, function(key, value){ 
				str += '<div>';
				str += '<div>'+'쿠폰번호 : '+value.coupon_id;
				str += '  <a class="btn btn-sm btn-outline-success"> 쿠폰만료일 </a>'+ value.expired_date;
				str += '  쿠폰이름 : ' + value.name + '  ';
				str += '<a class="btn btn-sm btn-outline-success"> ㅠㅠㅠ </a> </div>';
				str += '<div> <p style="margin-top:10px; margin-bottom:10px;"> 최소금액 : '+value.min_price +'</p>';
				str += '</div></div>';
			});
			$(".couponList").html(str);
		},
		complete: function(data) {
			console.log(data);
		}
	})
	
	// 콜백함수 : 요청 성공 시에 호출되는 함수
	// ajax 콜백 함수는 ajax 함수에 연결 연산자를 붙여서 사용한다.
	.done(function(data) {
		////alert("IMSI==>" + imsi);
		////alert(data);
		console.log(data);
		//alert("요청 성공");
		//alert("commentList 요청 성공 data ==> " + data);
	})
	.fail(function() {
		alert("요청 실패");
		alert("couponList 요청 실패 data ==> " + data);
	})
	.always(function() {
		//alert("요청 완료");
		//alert("commentList 요청 완료 data ==> " + data);
	});
	//alert("imsi2["+imsi+"]);
	//alert("commentList 종료.....");
}
</script>