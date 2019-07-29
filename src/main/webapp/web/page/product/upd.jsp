<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>商品信息维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>商品信息维护--修改二手商品信息</legend>
    <form class="layui-form" lay-filter="updproduct" method="post">
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
                <select name="categoryCode" lay-search></select>
            </div>
        </div>
    </td></tr>
    <tr><td>
    <div class="layui-form-item">
            <label class="layui-form-label">商品编号</label>
            <div class="layui-input-inline">
                <input type="text" name="code" lay-verify="required" placeholder="商品编号" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        </td>
        <td>
        <div class="layui-form-item">
            <label class="layui-form-label">商品名称</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required" placeholder="商品名称" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        </td>
        </tr>
        <tr><td>
        <div class="layui-form-item">
            <label class="layui-form-label">商品价格</label>
            <div class="layui-input-inline">
                <input type="text" name="price" lay-verify="required" placeholder="商品价格" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        </td><td>
         <div class="layui-form-item">
            <label class="layui-form-label">商品数量</label>
            <div class="layui-input-inline">
                <input type="text" name="number" lay-verify="required" placeholder="商品数量" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        </td></tr>
       
       <tr>
       <td colspan="2">
        <div class="layui-form-item">
            <label class="layui-form-label">商品状态</label>
            <div class="layui-input-inline">
                <input type="text" name="state" lay-verify="required" placeholder="商品状态" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        </td>
        </tr>
        <div class="layui-form-item">
            
            
              <div id="image"> </div>      
            </div>
        <!-- <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <select name="userCode" lay-search></select>
            </div>
        </div>
         <div class="layui-form-item">
            <label class="layui-form-label">新旧程度</label>
            <div class="layui-input-inline">
                <select name="productQuality" lay-search>
               <option value="一成新">一成新</option>
<option value="二成新">二成新</option>
<option value="三成新">三成新</option>
<option value="四成新">四成新</option>
<option value="五成新">五成新</option>
<option value="六成新">六成新</option>
<option value="七成新">七成新</option>
<option value="八成新" selected="selected">八成新</option>
<option value="九成新">九成新</option>
                </select>
            </div>
        </div>
        <hr color="black">
         <div class="layui-form-item">
            <label class="layui-form-label">是否推荐</label>
            <div class="layui-input-inline">
                <select name="recommend" lay-search>
                <option selected="selected" value="不推荐">不推荐</option>
                <option value="推荐">推荐</option>
                </select>
            </div>
        </div> -->
         <tr>
       <td colspan="2">
        <div class="layui-form-item">
            <label class="layui-form-label">商品描述</label>
            <div class="layui-input-inline">
                <textarea name="describe" required lay-verify="required" placeholder="请输入" class="layui-textarea"
		rows="6" cols="20"></textarea>
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
                <input type="button" class="layui-btn" lay-submit lay-filter="upd" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
        </td>
        </tr>
        </table>
    </form>
   <!--  <button type="button" class="layui-btn" id="imgUpd">
  <i class="layui-icon">&#xe67c;</i>更改图片
</button> -->
    </fieldset>
<script type="text/javascript">
    form.render();
init();
function init(){
    var code = '<%=request.getParameter("code")%>';
    ajax('/store/product/getUser.do', {code:code}, 
    		'json',function(data){
    	console.log(data);
    	console.log(data.des);
        	form.val("updproduct",{name:data.name,code:data.code,price:data.price,describe:data.describe,
        		number:data.number,state:data.state
        		})
       		form.render();
    })
}
formSubmit('/store/product/update.do', 'submit(upd)', 'text', function(data) {
	if (data !=0) {
        layer.msg('修改成功');
        closeThis(3000);
    } else {
        layer.msg('修改失败');
    }
});

categoryOne();
function categoryOne(){
	$.ajax({
		url :'/store/category/parentCodeList.do',
		dataType : 'json',
		type : 'post',
		success :function(data){
			console.log(data);
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
	
	  console.log(data.value); //得到被选中的值
	  $.ajax({
		url :'/store/category/parentCodeList2.do',
		data:{parentCode:data.value},
		dataType : 'json',
		type : 'post',
		success :function(data){
			console.log(data);
			var html='';
			$.each(data,function(i,d){
				html+=laytpl($('#opt2').html()).render(d);
			})
			$("select[name='categoryCode']").html(html);
       		form.render();
}
	})
	});    

layui.use('upload', function(){
	var productcode=$("input[name='productcode']").val();
	var productimage=$("input[name='productimage']").val();
	  var upload = layui.upload;
	  var uploadInst = upload.render({
	    elem: '#imgUpd' //绑定元素
	    ,url: '/school/ImgUploadServlet1?action="upd"&productimage=&usercode='+productcode //上传接口
	    ,done: function(res){
	        if(res.code=='0'){
	        	layer.msg('更改成功');
	        	var image=res.data;
	        	showPic(image);
	        }else{
	        	layer.msg('更改失败');
	        }
	    }
	  });
	});
	
function showPic(url){
  	var html = '<img src="/image/'+ url +'" alt="'+ url +'" class="layui-upload-img" width="200px" height="150px">'
      +'<input type="hidden" name="productimage" value="'+ url +'">';
     $("#image").html(html);
  }
form.render();
</script>
   <script type="text/html" id='opt'>
        <option value='{{ d.code }}'>{{ d.name }}</option>
    </script>
     <script type="text/html" id='opt2'>
        <option value='{{ d.code }}'>{{ d.name }}</option>
    </script>
</body>
</html>