<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/web/header.jsp"%>
	<title>商品信息维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>商品信息维护--添加信息</legend>
    
    <form class="layui-form" method="post" lay-filter="addCategory">
    <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px">商品分类类型</label>
            <div class="layui-input-inline">
               <select name="parentCode" lay-search>
                
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px">商品分类编号</label>
            <div class="layui-input-inline">
                <input type="text" name="code" lay-verify="required" placeholder="请输入商品分类编号" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px">商品分类名称</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required" placeholder="请输入商品分类名称" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px">描述</label>
            <div class="layui-input-inline">
                <input type="text" name="des"  placeholder="描述" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <input type="button" class="layui-btn" lay-submit lay-filter="add" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
        <input type="hidden" name="action" value="add" />
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
    			html+="<option value='1'>一级分类</option>";
    			$("select[name='parentCode']").html(html);
           		form.render();
    }
    	})
    }
    formSubmit('/store/category/add.do', 'submit(add)', 'text', function(data) {
    	if (data == -1) {
            layer.msg('账号已存在');
            
        } else if (data != null) {
            layer.msg('添加成功');
            closeThis(3000);
        } else {
            layer.msg('添加失败');
        }
    });
    </script>
    <script type="text/html" id='opt'>
        <option value='{{ d.code }}'>{{ d.name }}</option>
    </script>
</body>
</html>