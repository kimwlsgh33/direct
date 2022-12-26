// deleteCart
function deleteCart(item_id) {
    $.ajax({
    url: "/cart/deleteCart",
    type: "post",
    data: {"item_id": item_id},
    success: function(data){
        $("#convertDiv").html(data);
        alert("삭제되었습니다.")

    },error:function(request, status, error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
    });
}
// deleteAll Cart
function deleteAllCart(user_id) {
    alert("delete");
    $.ajax({
    url: "/cart/deleteAllCart",
    type: "post",
    data: {"user_id": user_id},
    success: function (data) {
        $("#convertDiv").html(data);
        alert("장바구니가 전체 삭제되었습니다.")

    },error:function(request, status, error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
    });
}

// function order(){
//     const form = document.createElement('form');
//     const input = document.createElement('input');
//
//     input.setAttribute('type', 'hidden');
//     input.setAttribute('name', 'cartList');
//
//     input.val(${cartList});
//
//
//     form.action = '${ctx}/order/createForm';
//
//     form.method = 'POST';
//
//     form.submit();
// }


