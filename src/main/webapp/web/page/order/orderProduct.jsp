<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>订单商品维护</title>
</head>
<body>

    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>订单商品维护</legend>
        
        <table class="layui-table">
			<colgroup>
				<col width="10%"><col width="20%"><col width="20%">
				<col width="10%"><col width="20%"><col><col width="20%"><col>
			</colgroup>
			<thead>
				<tr>
					<th>序号</th><th>订单编号</th><th>商品</th>
					<th>数量</th><th>花费</th><th>图片</th>
				</tr>
			</thead>
			<tbody id="order_product"></tbody>
			
		</table>
    </fieldset>
    
    <script type="text/javascript">
    init();
    function init(){
    	var orderCode = '<%=request.getParameter("code")%>';
    	$.ajax({
    		url :'/store/orderProduct/list.do',
    		dataType : 'json',
    		type : 'post',
    		data :{orderCode:orderCode},
    		success :function(data){
    			console.log(data);
    			var html='';
    			$.each(data,function(i,dom){
    				var orderCode = dom.orderCode?dom.orderCode:'';
    				var productCode=dom.productCode?dom.productCode:'';
    		        var name = dom.name?dom.name:'';
    		        var number=dom.number?dom.number:'';
    		        var cost = dom.cost?dom.cost:'';
    		        var url=dom.url?dom.url:'';
    		        var d={i:(i+1),orderCode:orderCode,productCode:productCode,name:name,
    		        		number:number,cost:cost,url:url};
    				html+=laytpl($('#opt').html()).render(d);
    			})
    			$("#order_product").html(html);
           		form.render();
    }
    	})
    }
    
   // <td>
   // <input type='button' value='修改' class='layui-btn' 
   //        onclick='openUpd("{{ d.orderCode }}")'/>&nbsp;
    //<a href="javascript:del('{{ d.orderCode }}')" 
    //   class="layui-btn layui-btn-xs layui-btn-danger">
    //    <i class="layui-icon layui-icon-delete"></i>
   // </a>&nbsp;
//</td>
    </script>
    <script type="text/html" id='opt'>
<tr>
<td>{{ d.i }}</td><td>{{ d.orderCode }}</td><td>{{ d.name }}</td><td>{{ d.number }}</td>
<td>{{ d.cost }}</td><td><img src="/image/{{ d.url }}"></td>

</tr>
    </script>
</body>
</html>