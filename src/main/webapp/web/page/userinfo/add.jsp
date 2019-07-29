<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
	<title>用户信息维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>用户信息维护--添加信息</legend>
    
    <form class="layui-form" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="code" lay-verify="required" placeholder="请输入账号" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
         <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
<!--         <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" placeholder="请输入姓名" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <input type="radio" name="sex" value="男" title="男" checked>
                <input type="radio" name="sex" value="女" title="女" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">生日</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" name='birthday' id="birthday">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-inline">
              <input type="text" class="layui-input" name='telephone' >    
            </div>
       </div> --> 
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <input type="button" class="layui-btn" lay-submit lay-filter="add" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
    </form>
    </fieldset>
    <script type="text/javascript">
    /* layui.use('laydate', function(){
    	  var laydate = layui.laydate;
    	  
    	  //执行一个laydate实例
    	  laydate.render({
    	    elem: '#birthday' //指定元素
    	  });
    	}); */
    form.on('submit(add)', function(data){
    	console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
    	  $.ajax({
    			url : '/store/user/reg.do',
    			data : data.field,
    			dataType : 'text',
    			type : 'post',
    			success :  function(data) {
    				if (data == 0) {
    			    	layer.msg('账号已存在');
    				    $("input[type='reset']").click();
    			     } else if (data != null) {
    				   layer.msg('添加成功');
    				   closeThis(3000);
    			     } else {
    				   layer.msg('添加失败');
    			     }
    		}
    	});
    })
    
    form.render('radio');
    </script>
</body>
</html>