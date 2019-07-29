<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>登录</title>
<style>
.window {
	width: 400px;
	position: absolute;
	margin-left: -200px;
	margin-top: -80px;
	top: 50%;
	left: 50%;
	display: block;
	z-index: 2000;
	background: #fff;
	padding: 20 0;
}
</style>
</head>
<body style="background: #f1f1f1;">
	<div class="window">
		<fieldset class="layui-elem-field" style="margin: 10px;">
			<legend>登录</legend>
			<div class="layui-field-box">
				<form class="layui-form layui-form-pane" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">账号：</label>
						<div class="layui-input-inline">
							<input type="text" name="code" required 
							    lay-verify="required" placeholder="请输入账号"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">密码：</label>
						<div class="layui-input-inline">
							<input type="password" name="password" required 
							    lay-verify="required" placeholder="请输入密码"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					<div style="text-align: center;margin-bottom: 15px;" >
	    <img src="/store/authCode/yanzhengma.do" style="text-align: center;"
          onclick="this.src='/store/authCode/yanzhengma.do?'+Math.random();">
                       </div>
	<div class="layui-form-item">
		<label class="layui-form-label">验证码</label>
		<div class="layui-input-inline">
		<input type="text" class="layui-input" placeholder="验证码" name="authCode"/>
	</div>	
	</div>
					
					<div class="layui-form-item">
						<div class="layui-form-item">
							<!--<label class="layui-form-label"></label> -->
							<div class="layui-input-inline">
								<input type="button" class="layui-btn" value="登录" 
								lay-submit lay-filter="login" /> 
								<input type="reset" class="layui-btn layui-btn-primary" value="重置" />
							</div>
							<input type="button" class="layui-btn" value="注册" onclick="goJspReg()" />
							<input type="button" class="layui-btn" value="广告" onclick="openLayer('/web/ad.jsp')" />
						</div>
					</div>
					<input type="hidden" name="action" value="login" />
				</form>
			</div>
		</fieldset>
	</div>

</body>
<script type="text/javascript">
form.on('submit(login)', function(data) {
    console.log(data.field);
		$.ajax({
			url :'/store/user/login.do',
			data : data.field,
			dataType : 'text',
			type : 'post',
			success : function(data){
		if(data==0){
			layer.msg('请输入账号');
		}else if(data==1){
			layer.msg('请输入密码');
		}else if(data==2){
			layer.msg('没有该账号信息');
		}else if(data==3){
			layer.msg('密码输入错误');
		}else if(data==4){
			layer.msg('登陆成功');
			location.href ="/store/web/page/main.jsp";
		}else if(data==5){
			layer.msg('没有填写验证码');
		}else if(data==6){
			layer.msg('验证码输入错误');
		}
	 		 }
				})
		});
	
	function goJspReg() {
			window.location.href="/store/web/reg.jsp";
		}
</script>
</html>