<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>用户信息维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>用户信息维护--修改用户信息</legend>
    <form class="layui-form" lay-filter="upduser" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="code" readonly lay-verify="required" placeholder="请输入账号" autocomplete="off"
                    class="layui-input" >
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
            <label class="layui-form-label">是否为管理员</label>
            <div class="layui-input-inline">
            <select name="administrator" >
            <option value="是">是</option>
            <option value="否">否</option>
            </select>
            </div>
        </div>
      <!--   <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <input type="radio" name="gender" value="男" title="男" checked>
                <input type="radio" name="gender" value="女" title="女" >
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
                <input type="button" class="layui-btn" lay-submit lay-filter="upd" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
        <input type="hidden" name="action" value="updUser" />
    </form>
    </fieldset>
<script type="text/javascript">
renderLaydate('birthday');

init();
function init(){
    var code = '<%=request.getParameter("code")%>';
    console.log(code);
    ajax('/store/user/getUser.do', {code:code}, 
    		'json',function(data){
    	console.log(data);
        	form.val("upduser",{name:data.name,code:data.code})
    })
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
form.render('select');
</script>
</body>
</html>