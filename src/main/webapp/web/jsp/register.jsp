<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
        <%@ include file="/web/header.jsp"%>
		<title>用户注册</title>
		<link rel="stylesheet" type="text/css" href="/store/web/common/css/login.css">

	</head>
	<body>
		<form class="layui-form layui-form-pane" >
		<div class="regist">
			<div class="regist_center">
				<div class="regist_top">
					<div class="left fl">会员注册</div>
					<div class="right fr"><a href="./index.jsp" target="_self">小米商城</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="regist_main center">
				<div class="username">账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:&nbsp;&nbsp;<input class="shurukuang" type="text" name="code" placeholder="请输入你的用户名"/><span>请不要输入汉字</span></div>
					<div class="username">用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;&nbsp;<input class="shurukuang" type="text" name="name" placeholder="请输入你的用户名"/><span></span></div>
					<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="password" placeholder="请输入你的密码"/><span>请输入6位以上字符</span></div>
					
					<div class="username">确认密码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="repassword" placeholder="请确认你的密码"/><span>两次密码要输入一致哦</span></div>
					<div class="username">
						<div class="left fl">验&nbsp;&nbsp;证&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="yanzhengma" type="text" name="authCode" placeholder="请输入验证码"/></div>
							<div class="layui-input-inline">
		  <div style="margin-left: 20px" >
	    <img src="/store/authCode/yanzhengma.do" style="text-align: center;"
          onclick="this.src='/store/authCode/yanzhengma.do?'+Math.random();">
                       </div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="regist_submit">
					<input class="submit" type="button"  value="立即注册" lay-submit lay-filter="reg" >
				</div>
				
			</div>
		</div>
		</form>
		<script type="text/javascript">
	 		form.on('submit(reg)', function(data) {
	         console.log(data)
	 			$.ajax({
	 				url :'/store/user/userReg.do',
	 				data : data.field,
	 				dataType : 'text',
	 				type : 'post',
	 				success : function(data) {
	 					if(data==0){
	 						layer.msg('请输入账号');
	 					}else if(data==1){
	 						layer.msg('请输入密码');
	 					}else if(data==2){
	 						layer.msg('该账号已被注册');
	 					}else if(data==3){
	 						layer.msg('请输入验证码');
	 					}else if(data==4){
	 						layer.msg('验证码错误');
	 					}else if(data==5){
	 						layer.msg('注册成功');
	 					}else if(data==6){
	 						layer.msg('密码不同，请重新输入');
	 					}
	 		 }
				})
 		});
	 		
	 		
</script>
	</body>
</html>