<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/web/header.jsp"%>
		<title>小米商城-个人中心</title>
		<link rel="stylesheet" type="text/css" href="/store/web/common/css/style.css">
	</head>
	<body>
	<!-- start header -->
		<%@ include file="/web/header2.jsp"%>
	<!--end header -->
	<!-- start banner_x -->
		
<!-- end banner_x -->
<!-- self_info -->
	<div class="grzxbj">
		<div class="selfinfo center">
		<div class="lfnav fl">
			<div class="ddzx">订单中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="./dingdan.jsp" >我的订单</a></li>
					<li><a href="">意外保</a></li>
					<li><a href="">团购订单</a></li>
					<li><a href="">评价晒单</a></li>
				</ul>
			</div>
			<div class="ddzx">个人中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="./userinfo.jsp" style="color:#ff6700;font-weight:bold;">我的个人中心</a></li>
					<li><a href="">消息通知</a></li>
					<li><a href="">优惠券</a></li>
					<li><a href="">收货地址</a></li>
				</ul>
			</div>
		</div>
		<div id="userinfo">
		
			
		</div>
		<div class="clear"></div>
		</div>
	</div>
<!-- self_info -->
		
		<footer class="mt20 center">			
			<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>
	</body>
	
	<script type="text/javascript">
	userinfo();
	function userinfo(){
		var code=${user.code}
		$.ajax({
	        url:'/store/user/getUser.do',
	        dataType : 'json',
	        type : 'post',
	        data:{code:code},
	        success : function(data) {
	        	console.log(data);
	        	var html="";
	            	var id = data.id?data.id:'';
	            	var code = data.code?data.code:'';
	                var name = data.name?data.name:'';
	                console.log(code);
	                var d={name:name,id:id,code:code};
	                html = getlaytpl('#opt',d);
	        	$("#userinfo").html(html);
	        	
	        }
	    })
		
	}
	function update(name){
		layer.open({
			type : 2,
			area : [ '500px', '300px' ],
			fixed : false, // 不固定
			title:"昵称编辑",
			maxmin : true,
			end:userinfo,
			content : '/store/web/jsp/user/upd.jsp?&name='+name
		});
	}
	</script>
<script id="opt" type="text/html">
<div class="rtcont fr">
			<div class="grzlbt ml40" >我的资料</div>
<div class="subgrzl ml40"><span>账号</span><span>{{ d.code }}</span></div>
<div class="subgrzl ml40"><span>昵称</span><span>{{ d.name }}</span><span><a href="javascript:update('{{ d.name }}')">编辑</a></span></div>
			</div>
</script>
</html>