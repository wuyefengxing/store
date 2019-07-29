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
    <form class="layui-form" method="post">
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
    			console.log(data);
    			var html='';
    			$.each(data,function(i,d){
    				html+=laytpl($('#opt').html()).render(d);
    			})
    			$("#one").html(html);
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
    formSubmit('/store/product/add.do', 'submit(add)', 'text', function(data) {
    	console.log(data);
    	if (data == -1) {
            layer.msg('添加失败');
            
        } else{
            layer.msg('添加成功');
            closeThis(3000);
        } 
    });
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