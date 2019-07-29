<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>Insert title here</title>
</head>
<body>
 <div class="layui-form-item" style="margin-top: 40px">
            <label class="layui-form-label">发货地址</label>
            <div class="layui-input-inline">
                <input type="text" name="address" lay-verify="required" placeholder="请输入地址" autocomplete="off" id="address"
                    class="layui-input">
            </div>
        </div>
        <input type="hidden" id="productCode">
               <div id="orderProduct"></div>
        <div style="margin-top: 20px">
        <label style="margin-left: 40px"></label>
              <input type="button" class="layui-btn" onclick="add()" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
                </div>
<script type="text/javascript">
var userCode=${user.code};
var id = '<%=request.getParameter("id")%>';
var carCode=new Array();
var figure=id.split(",");
if(figure.length==0){
	layer.msg('没有添加购买的商品！');
	 closeThis(3000);
}

for(var k=0;k<figure.length;k++){
	console.log(k);
	$.ajax({
		url:"/store/car/orderList.do",
		data:{id:figure[k]},
		type:'post',
		dataType:'json',
		success:function(data){
			console.log(data);
			var html="";
			$.each(data,function(i, dom) {
				var id=dom.id?dom.id:"";
		    	var productCode = dom.productCode?dom.productCode:'';
		        var number=dom.number?dom.number:'';
		        var price=dom.price?dom.price:'';
		        var userCode=dom.userCode?dom.userCode:'';
		        var cost=Number(number)*Number(price)+"";
		        var d={i1:('productCode'+id),i2:('number'+id),i3:('price'+id),
		        		i4:('userCode'+id),i5:('cost'+id),i6:(i+1),
		        		productCode:productCode,number:number,userCode:userCode,
		        		price:price,id:id,cost:cost};
		        $("#productCode").val(productCode);
		        console.log($("#productCode").val());
		        html = getlaytpl('#tradd',d);
		        $("#orderProduct").html(html);
		    });
			
		}
	})
}

function add() {
	var address=$("#address").val();
	console.log(address);
		$.ajax({
			url:"/store/order/userAdd.do",
			data:{userCode:userCode,address:address},
			type:'post',
			dataType:'text',
			success : function(data){
				if(data!=null){
					console.log(data);
					 orderProductAdd(data)
				}
			}
	})
}
 function orderProductAdd(data) {
		for(var i=0;i<figure.length;i++){
			console.log(figure[i]);
			var orderCode=data;
			var productCode=$("#productCode"+figure[i]).val();
			var number=$("#number"+figure[i]).val();
			var price=$("#price"+figure[i]).val();
			var cost=$("#cost"+figure[i]).val();
			console.log(productCode);
			console.log(number);
			console.log(price);
			console.log(cost);
			$.ajax({
				url:"/store/orderProduct/add.do",
				data:{orderCode:orderCode,productCode:productCode,
					number:number,cost:cost},
				type:'post',
				dataType:'json',
				success:function(data){
					if(data!=null){
						layer.msg('下单成功');
						}
					else{
						layer.msg('下单失败');
						 closeThis(3000);
					}
					}
				})
		}
}


</script>
<script id="tradd" type="text/html">
<input type="hidden" id="{{ d.i1 }}" name="productCode" value="{{ d.productCode }}">
<input type="hidden" id="{{ d.i2 }}" name="number" value="{{ d.number }}">
<input type="hidden" id="{{ d.i3 }}" name="price" value="{{ d.price }}">
<input type="hidden" id="{{ d.i4 }}" name="userCode" value="{{ d.userCode }}">
<input type="hidden" id="{{ d.i5 }}" name="cost" value="{{ d.cost }}">
<div id="{{ d.i6 }}"></div>
</script>
</body>
</html>