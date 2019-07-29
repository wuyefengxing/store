<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		 <%@ include file="/web/header.jsp"%>
		<title>小米商城-个人中心</title>
		<link rel="stylesheet" type="text/css" href="/store/web/common/css/style.css">
	</head>
	<body>
		<%@ include file="/web/header2.jsp"%>
	
<!-- self_info -->
	<div class="grzxbj">
		<div class="selfinfo center">
		<div class="lfnav fl">
			<div class="ddzx">订单中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="" style="color:#ff6700;font-weight:bold;">我的订单</a></li>
					<li><a href="">意外保</a></li>
					<li><a href="">团购订单</a></li>
					<li><a href="">评价晒单</a></li>
				</ul>
			</div>
			<div class="ddzx">个人中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="./userinfo.jsp">我的个人中心</a></li>
					<li><a href="">消息通知</a></li>
					<li><a href="">优惠券</a></li>
					<li><a href="">收货地址</a></li>
				</ul>
			</div>
		</div>
		<input type="hidden" name="pageIndex" value="1" />
			   <input type="hidden" name="pageLimit" value="3" />
		<div class="rtcont fr">
			<div class="ddzxbt">交易订单</div>
			<div id="order"></div>
		</div>
		<div class="clear"></div>
		</div>
		<div id="pageInfoUser" 
		style="text-align: right;padding-right: 30px"></div>
	</div>
	</div>
<!-- self_info -->
		
		<footer class="mt20 center">			
			<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>
		<script type="text/javascript">
		var userCode=${user.code};
		dingdan();
		function dingdan() {
			var pageIndex = $("input[name='pageIndex']").val();
		    var pageLimit = $("input[name='pageLimit']").val();
			$.ajax({
				url :'/store/order/userList.do',
				data : {userCode:userCode,pageIndex:pageIndex,pageLimit:pageLimit},
				dataType : 'json',
				type : 'post',
				success : function(data){
					 console.log(data);
					var curr = $("input[name='pageIndex']").val();
				    var limit = $("input[name='pageLimit']").val();
				    console.log(limit);
				    laypage.render({
						elem : 'pageInfoUser',// id
						count : data.count,// 数据总数
						curr : curr,// 当前页
						limit : limit,// 每页显示的条数
						limits : [ 5 ,10, 20 ],// 每页条数的选择项
						layout : [ 'count', 'prev', 'page', 'next', 'limit', 'refresh',
								'skip' ],
						jump : function(obj, first){
					    	 console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
					    	  console.log(obj.limit); //得到每页显示的条数
					        $("input[name='pageIndex']").val(obj.curr);
					        console.log($("input[name='pageIndex']").val());
					        $("input[name='pageLimit']").val(obj.limit);
					        if(!first){refresh();}
					        }
				    });
		        	var html="";
		        	$.each(data.list,function(i, dom) {
		            	var code = dom.code?dom.code:'';
		                var time = dom.time?dom.time:'';
		                var address = dom.address?dom.address:'';
		                var state = dom.state?dom.state:'';
		                var d={i:i+1,code:code,time:time,address:address,state:state};
		                html += getlaytpl('#opt',d);
		            });
		        	$("#order").html(html);
		        	
		        }
		    })
		}
		function refresh(){
			dingdan();
		}
		
		function orderProduct(code) {
			layer.open({
				type : 2,
				area : [ '1000px', '500px' ],
				fixed : false, // 不固定
				title:"订单商品",
				maxmin : true,
				content : '/store/web/jsp/user/orderProduct.jsp?&code='+code
			});
		}
		</script>
		<script id="opt" type="text/html">
<div class="ddxq">
				<div class="ddspt fl">{{ d.i }}</div>
				<div class="ddbh fl">订单号:{{ d.code }}</div>
				<div class="ztxx fr">
					<ul>
						<li>{{ d.state }}</li>
						<li style="width: 200px">{{ d.time }}</li>
						<li><a href="javascript:orderProduct('{{ d.code }}')">订单详情></a></li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
</script>
	</body>
</html>