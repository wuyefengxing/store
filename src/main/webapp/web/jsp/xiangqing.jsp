<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
        <%@ include file="/web/header.jsp"%>
		<title>小米6立即购买-小米商城</title>
		<link rel="stylesheet" type="text/css" href="/store/web/common/css/style.css">
	</head>
	<body>
			<%@ include file="/web/header2.jsp"%>
	<!-- xiangqing -->
	<form action="/store/car/add.do" method="post">
	<div class="xiangqing">
		<div class="neirong w">
			<div class="xiaomi6 fl">小米6</div>
			<nav class="fr">
				<li><a href="">概述</a></li>
				<li>|</li>
				<li><a href="">变焦双摄</a></li>
				<li>|</li>
				<li><a href="">设计</a></li>
				<li>|</li>
				<li><a href="">参数</a></li>
				<li>|</li>
				<li><a href="">F码通道</a></li>
				<li>|</li>
				<li><a href="">用户评价</a></li>
				<div class="clear"></div>
			</nav>
			<div class="clear"></div>
		</div>	
	</div>
	
	<div class="jieshao mt20 w">
		<div id="image"></div>
		<div id="product"></div>
		
		<input type="hidden" name="userCode" value="${user.code}">
		<input type="hidden" name="number" value="1">
			<div class="xiadan ml20 mt20" style="margin-top: 30px">
					<input class="jrgwc"  type="button" name="jrgwc" value="立即选购" />
					<input class="jrgwc" type="submit" name="jrgwc" value="加入购物车" />
				
			</div>
		</div>
		<div class="clear"></div>
	</form>
	<!-- footer -->
<%@ include file="/web/footer.jsp"%>
<script type="text/javascript">
var code = '<%=request.getParameter("code")%>';
select();
function select() {
	
console.log(code);
	$.ajax({
        url:'/store/product/xiangqingList.do',
        dataType : 'json',
        data:{code:code},
        type : 'post',
        success : function(data){
        	console.log(data);
	    var html = "" ;
	  $.each(data,function(i, dom) {
    	var code = dom.code?dom.code:'';
        var name = dom.name?dom.name:'';
        var price = dom.price?dom.price:'';
        var state = dom.state?dom.state:'';
        var categoryCode=dom.categoryCode?dom.categoryCode:'';
        var des=dom.des?dom.des:'';
        var number=dom.number?dom.number:'';
        var d={code:code,name:name,price:price,
        		state:state,categoryCode:categoryCode,des:des,
        		number:number};
        html += getlaytpl('#tradd',d);
    });
	$("#product").html(html);
        }
})
}
image();
function image() {
	$.ajax({
        url:'/store/image/xiangqingList.do',
        dataType : 'json',
        data:{productCode:code},
        type : 'post',
        success : function(data){
        	console.log(data);
	    var html = "" ;
	  $.each(data.list,function(i, dom) {
    	var url = dom.url?dom.url:'';
        var type = dom.type?dom.type:'';
        var d={url:url,type:type};
        	html += getlaytpl('#tradd2',d);
    });
	$("#image").html(html);
        }
})
}
</script>

<script id="tradd" type="text/html">
<div class="right fr">
			<div class="h3 ml20 mt20">{{ d.name }}</div>
			<div class="jianjie mr40 ml20 mt10">变焦双摄，4 轴防抖 / 骁龙835 旗舰处理器，6GB 大内存，最大可选128GB 闪存 / 5.15" 护眼屏 / 四曲面玻璃/陶瓷机身</div>
			<div class="jiage ml20 mt10">{{ d.price }}元</div>
			<div class="ft20 ml20 mt20">选择版本</div>
			<div class="xzbb ml20 mt10">
				<div class="banben fl">
					<a>
						<span>全网通版 6GB+64GB </span>
						<span>2499元</span>
					</a>
				</div>
				<div class="banben fr">
					<a>
						<span>全网通版 6GB+128GB</span>
						<span>2899元</span>
					</a>
				</div>
				<div class="clear"></div>
			</div>
			<div class="ft20 ml20 mt20">选择颜色</div>
			<div class="xzbb ml20 mt10">
				<div class="banben">
					<a>
						<span class="yuandian"></span>
						<span class="yanse">亮黑色</span>
					</a>
				</div>
				
			</div>
			<div class="xqxq mt20 ml20">
				<div class="top1 mt10">
					<div class="left1 fl">小米6 全网通版 6GB内存 64GB 亮黑色</div>
					<div class="right1 fr">{{ d.price }}元</div>
					<div class="clear"></div>
				</div>
				<div class="bot mt20 ft20 ftbc">总计：{{ d.price }}元</div>
			</div>
<input type="hidden" name="productCode" value="{{ d.code }}">
</script>
<script id="tradd2" type="text/html">
<div class="left fl"><img src="/image/{{ d.url}}" width="562px" height="562px"></div>
</script>
	</body>
</html>