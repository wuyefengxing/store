<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <%@ include file="/web/header.jsp"%>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/store/web/common/css/style.css">
</head>
<body>

<div class="layui-collapse">
  <div class="layui-colla-item">
    <div class="layui-colla-content layui-show">
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px; padding: 5px">
		<legend>订单商品</legend>
	</fieldset>
	</div></div>
	<div class="layui-form">
	<img  src="">
		<table class="layui-table">
			<colgroup>
				<col width="10%"><col width="10%"><col width="10%">
				<col width="10%"><col width="10%"><col>
			</colgroup>
			<thead>
				<tr>
					<th>序号</th><th>商品</th><th>数量</th><th>总价</th><th>图片</th>
				</tr>
			</thead>
			<tbody id="orderProduct_tbody"></tbody>
		</table>
		<div id="pageInfoUser" 
		style="text-align: right;padding-right: 30px"></div>
	</div>
<script type="text/javascript">
var orderCode='<%=request.getParameter("code")%>';
console.log(orderCode);
dingdan();
function dingdan() {
	$.ajax({
        url:'/store/orderProduct/list.do',
        dataType : 'json',
        type : 'post',
        data:{orderCode:orderCode},
        success : function(data) {
        	console.log(data);
        	var html="";
        	$.each(data,function(i, dom) {
            	var productCode = dom.productCode?dom.productCode:'';
                var name = dom.name?dom.name:'';
                var number = dom.number?dom.number:'';
                var cost = dom.cost?dom.cost:'';
                var url=dom.url?dom.url:'';
                var d={i:i+1,name:name,number:number,cost:cost,url:url};
                html += getlaytpl('#opt',d);
            });
        	$("#orderProduct_tbody").html(html);
        	
        }
    })
}

</script>
<script id="opt" type="text/html">
<tr>
<td>{{ d.i }}</td><td>{{ d.name }}</td><td>{{ d.number }}</td><td>{{ d.cost}}</td>
<td><img src="/image/{{ d.url }}" width=100px height=100px></td>
</tr>
</script>
</body>

</html>