<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/web/header.jsp"%>
	<title>商品信息维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>商品信息维护--添加商品信息</legend>
    
  <!-- 
    <div style="margin-bottom: 10px">
      <label class="layui-form-label">商品图片</label>
<button type="button" class="layui-btn" id="imgUpload" lay-filter="image">
  <i class="layui-icon">&#xe67c;</i>上传图片
</button>
</div> -->
    <form class="layui-form" method="post" name="form1">
    <table>
    <tr><td>
     <div class="layui-form-item">
            <label class="layui-form-label">一级分类</label>
            <div class="layui-input-inline">
                <select name="parentCode" lay-search lay-filter="parentCode"></select>
            </div>
        </div>
    </td><td>
    <div class="layui-form-item">
            <label class="layui-form-label">二级分类</label>
            <div class="layui-input-inline">
                <select name="categoryCode" lay-search lay-filter="parentCode2"></select>
            </div>
        </div>
    </td></tr>
    <tr><td colspan="2">
    <div class="layui-form-item">
            <label class="layui-form-label">商品</label>
            <div class="layui-input-inline">
                <select name="productCode" lay-search></select>
            </div>
        </div>
    </td></tr>
    <tr><td>
    <div class="layui-form-item">
            <label class="layui-form-label">用户编号</label>
            <div class="layui-input-inline">
                <input type="text" name="userCode" lay-verify="required" placeholder="用户编号" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        </td>
        <td>
        <div class="layui-form-item">
            <label class="layui-form-label">发货地址</label>
            <div class="layui-input-inline">
                <input type="text" name="address" lay-verify="required" placeholder="发货地址" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div id="orderPrice"></div>
         <div id="orderProductCost"></div>
        </td>
        
        </tr>
         <tr>
        <td colspan="2">
        <div class="layui-form-item">
            <label class="layui-form-label">数量</label>
            <div class="layui-input-inline">
                <input type="text" name="number" lay-verify="required" placeholder="数量" autocomplete="off" id="number" 
                    class="layui-input" onChange="costChange(this.value)">
            </div>
        </div>
        </td>
        </tr>
        <tr>
        <td colspan="2">
        <div class="layui-form-item">
        
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
            <input type="hidden" name="action" value="add" />
                <input type="button" class="layui-btn" lay-submit lay-filter="add" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
        </td>
        </tr>
        </table>
    </form>
    
    </fieldset>
    <script type="text/javascript">
    init();
    function init(){
    	$.ajax({
    		url :'/store/category/parentCodeList.do',
    		dataType : 'json',
    		type : 'post',
    		success :function(data){
    			var html='';
    			$.each(data,function(i,d){
    				html+=laytpl($('#opt').html()).render(d);
    			})
    			$("select[name='parentCode']").html(html);
           		form.render();
    }
    	})
    }
    
    form.on('select(parentCode)', function(data){
    	
  	  //console.log(data.value);    //得到被选中的值
  	  $.ajax({
    		url :'/store/category/parentCodeList2.do',
    		data:{parentCode:data.value},
    		dataType : 'json',
    		type : 'post',
    		success :function(data){
    			var html='';
    			$.each(data,function(i,d){
    				html+=laytpl($('#opt2').html()).render(d);
    			})
    			$("select[name='categoryCode']").html(html);
           		form.render();
    }
    	})
  	});    
    
    form.on('select(parentCode2)', function(data){
    	  console.log(data.value);    //得到被选中的值
    	  $.ajax({
      		url :'/store/product/orderList.do',
      		data:{categoryCode:data.value},
      		dataType : 'json',
      		type : 'post',
      		success :function(data){
      			console.log(data);
      			var html='';
      			var html2='';
      			$.each(data,function(i,d){
      				html+=laytpl($('#opt3').html()).render(d);
      				html2=laytpl($('#opt4').html()).render(d);
      			})
      			$("select[name='productCode']").html(html);
      			$("#orderPrice").html(html2);
             		form.render();
             		
      }
      	})
    	});    
    
    function costChange(number) {              //将花费添加到form表单之中
    	//var number=document.form1.number.value;
    	var price=Number($("#price").val());
    	var cost=Number(number)*price;
    	var html='';
    	var d={cost:cost};
    	html+=laytpl($('#opt5').html()).render(d);
    	$("#orderProductCost").html(html);
	}
    
    form.on('submit(add)', function(data){
  	  $.ajax({
    		url :'/store/order/add.do',
    		data:data.field,
    		dataType : 'json',
    		type : 'post',
    		success :function(data){
    			console.log(data);
    }
    })
  	});    
    
    </script>
   <script type="text/html" id='opt'>
        <option value='{{ d.code }}'>{{ d.name }}</option>
    </script>
     <script type="text/html" id='opt2'>
        <option value='{{ d.code }}'>{{ d.name }}</option>
    </script>
    <script type="text/html" id='opt3'>
        <option value='{{ d.code }}'>{{ d.name }}</option>
    </script>
    <script type="text/html" id='opt4'>
        <input type="hidden" id="price" name="price" value="{{ d.price }}">
    </script>
    <script type="text/html" id='opt5'>
        <input type="hidden" id="cost" name="cost" value="{{ d.cost }}">
    </script>
</body>
</html>