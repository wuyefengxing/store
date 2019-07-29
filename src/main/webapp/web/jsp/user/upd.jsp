<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>用户信息维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>用户信息维护--修改用户名</legend>
    <form class="layui-form" lay-filter="upduser" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required" placeholder="请输入用户名" autocomplete="off"
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
        <input type="hidden" name="code" value="" />
    </form>
    </fieldset>
<script type="text/javascript">

init();
function init(){
	var code=${user.code};
    var name = '<%=request.getParameter("name")%>';
    console.log(name);
        	form.val("upduser",{name:name,code:code})
}
formSubmit('/store/user/update.do', 'submit(upd)', 'text', function(data) {
	console.log(data);
	if (data ==1) {
        layer.msg('修改成功');
        closeThis(3000);
    } else {
        layer.msg('修改失败');
    }
});
</script>
</body>
</html>