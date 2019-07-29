<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
        <%@ include file="/web/header.jsp"%>
		<title>会员登录</title>
		<link rel="stylesheet" type="text/css" href="/store/web/common/css/login.css">
		
	</head>
	<body>
		<!-- login -->
		<div class="top center">
			<div class="logo center">
				<a href="/store/web/jsp/user/userIndex.jsp" target="_blank"><img src="/store/web/common/image/mistore_logo.png" alt=""></a>
			</div>
		</div>
		<form   class="form center layui-form layui-form-pane">
		<div class="login">
			<div class="login_center">
				<div class="login_top">
					<div class="left fl">会员登录</div>
					<div class="right fr">您还不是我们的会员？<a href="./register.jsp" target="_self">立即注册</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="login_main center">
		    <div class="username">账&nbsp;&nbsp;&nbsp;&nbsp;号:&nbsp;<input class="shurukuang" type="text" name="code" placeholder="请输入你的账号"/></div>
			<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input class="shurukuang" type="password" name="password" placeholder="请输入你的密码"/></div>
			<div class="username">
			<div class="left fl">验证码:&nbsp;<input class="yanzhengma" type="text" name="authCode" placeholder="请输入验证码"/></div>
	        <img src="/store/authCode/yanzhengma.do" style="text-align: center;"
            onclick="this.src='/store/authCode/yanzhengma.do?'+Math.random();">
						<div class="clear"></div>
					</div>
				</div>
				<div class="login_submit">
					<input class="submit" type="button"  value="立即登录" lay-submit lay-filter="login" >
				</div>
				
			</div>
		</div>
		</form>
		<footer>
			<div class="copyright">简体 | 繁体 | English | 常见问题</div>
			<div class="copyright">小米公司版权所有-京ICP备10046444-<img src="/store/web/common/image/ghs.png" alt="">京公网安备11010802020134号-京ICP证110507号</div>

		</footer>
		
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
			location.href ="/store/web/jsp/user/userIndex.jsp";
		}else if(data==5){
			layer.msg('没有填写验证码');
		}else if(data==6){
			layer.msg('验证码输入错误');
		}
	 		 }
				})
		});
	
</script>
	</body>
</html>