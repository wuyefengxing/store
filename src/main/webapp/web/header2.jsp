<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- start header -->
 <script type="text/javascript" src="/store/web/common/js/jquery-3.3.1.min.js"></script>
    <header>
<div class="top center">
				<div class="left fl">
					<ul>
						<li><a href="http://www.mi.com/" target="_blank">小米商城</a></li>
						<li>|</li>
						<li><a href="">MIUI</a></li>
						<li>|</li>
						<li><a href="">米聊</a></li>
						<li>|</li>
						<li><a href="">游戏</a></li>
						<li>|</li>
						<li><a href="">多看阅读</a></li>
						<li>|</li>
						<li><a href="">云服务</a></li>
						<li>|</li>
						<li><a href="">金融</a></li>
						<li>|</li>
						<li><a href="">小米商城移动版</a></li>
						<li>|</li>
						<li><a href="">问题反馈</a></li>
						<li>|</li>
						<li><a href="">Select Region</a></li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="right fr">
					<div class="fr">
						<ul id="user">
						<li><a href="/store/web/login.jsp" target="_blank">后台登录</a></li>
							<li>|</li>
							<li><a href="/store/web/jsp/login.jsp" target="_blank">登录</a></li>
							<li>|</li>
							<li><a href="/store/web/jsp/register.jsp" target="_blank" >注册</a></li>
							<li>|</li>
							<li><a href="">消息通知</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
		<!--end header -->
		
		
		<!-- start banner_x -->
		<div class="banner_x center">
			<a href="/store/web/jsp/user/userIndex.jsp" target="_blank"><div class="logo fl"></div></a>
			<a href=""><div class="ad_top fl"></div></a>
			<div class="nav fl">
				<ul id="category_three">
					
				</ul>
			</div>
			<div class="search fr">
					<div class="text fl">
						<input type="text" class="shuru" id="shuru" placeholder="小米6&nbsp;小米MIX现货">
					</div>
					<div class="submit fl">
						<input type="button" class="sousuo" value="搜索" onclick="search()">
					</div>
					<div class="clear"></div>
				<div class="clear"></div>
			</div>
		</div>
		<!-- end banner_x -->
		<script>
		user();
		function user() {
			var usercode='<%=session.getAttribute("user")%>';
			console.log(usercode);
			if(!(usercode==null||usercode==""||typeof(usercode)=="undefined"||usercode=="null")){ 
				 var html='<div class="gouwuche fr"><a href="javascript:car()">购物车</a></div>'+
					 '<li><a href="javascript:userinfo()" target="_blank">${user.name}</a></li>'+
	    			'<li>|</li>'+
	    			'<li><a href="javascript:quit(${user.code})">退出登录</a></li>'+
	    			'<li>|</li>';
				$("#user").html(html);
				 } 
		}
		category1();
		function category1(){
			$.ajax({
		        url:'/store/category/parentCodeList.do',
		        dataType : 'json',
		        type : 'post',
		        success : function(data) {
		        	console.log(data);
		        	var html="";
		        	$.each(data,function(i, dom) {
		            	var code = dom.code?dom.code:'';
		                var name = dom.name?dom.name:'';
		                var d={code:code,name:name};
		                html += getlaytpl('#category3',d);
		            });
		        	html +="<li><a href='javascript:'>服务</a></li>"
		        		html +="<li><a href='javascript:'>社区</a></li>"
		        	$("#category_three").html(html);
		        }
		    })
		}
		
		function liebiao(code) {
			window.location.href = "/store/web/jsp/liebiao.jsp?categoryCode="+code;
			
		}
		function car() {
			window.location.href = "/store/web/jsp/user/car.jsp";
			
		}
		function userinfo() {
			window.location.href = "/store/web/jsp/user/dingdan.jsp";
		}
		
		function search() {
			var name=$("#shuru").val();
			console.log(name);
			window.location.href = "/store/web/jsp/liebiao.jsp?name="+name;
		}
		function quit(code){
			$.ajax({
		        url:'/store/user/quit.do',
		        dataType : 'text',
		        data:{code:code},
		        type : 'post',
		        success : function(data) {
		        	if (data==1) {
			            layer.msg('退出成功');
			            location.href="/store/web/jsp/user/userIndex.jsp"
			        } else{
			            layer.msg('退出失败，未获取到用户账户信息。');
			        } 
		        }
		    })	
		}
		
		</script>
		<script id="category3" type="text/html">
<li><a href="javascript:liebiao('{{ d.code }}')">{{ d.name }}</a></li>
</script>