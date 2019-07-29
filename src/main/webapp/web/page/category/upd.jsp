<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>商品分类信息维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>商品分类信息维护--修改信息</legend>
    <form class="layui-form" lay-filter="category" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">商品分类编号</label>
            <div class="layui-input-inline">
                <input type="text" name="code" readonly lay-verify="required" placeholder="请输入编号" autocomplete="off"
                    class="layui-input" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品分类名称</label>
            <div class="layui-input-inline">
                <input type="text" name="name" placeholder="请输入名称" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <input type="button" class="layui-btn" lay-submit lay-filter="upd" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
        
    </form>
    </fieldset>
<script type="text/javascript">
init();
function init(){
    var code = '<%=request.getParameter("code")%>';
    console.log(code);

	$.ajax({
        url:'/store/category/list.do',
        data : {code:code},
        dataType : 'json',
        type : 'post',
        success : function(data) {
        	console.log(data);
        	form.val("category",{name:data.name,code:data.code
        		})
       		form.render();
        }
    })
}
formSubmit('/store/category/update.do', 'submit(upd)', 'text', function(data) {
	if (data != null&&data!=0) {
        layer.msg('修改成功');
        closeThis(3000);
    } else {
        layer.msg('修改失败');
    }
});
</script>
</body>
</html>