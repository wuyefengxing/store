<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
        <%@ include file="/web/header.jsp"%>
		<title>小米手机列表</title>
		<link rel="stylesheet" type="text/css" href="/store/web/common/css/style.css">
	</head>
	<body>
		<%@ include file="/web/header2.jsp"%>

	<!-- start banner_y -->
	<!-- end banner -->

	<!-- start danpin -->
	<input type="hidden" name="pageIndex" value="1" />
			   <input type="hidden" name="pageLimit" value="10" />
		<div class="danpin center">
			
			<div class="biaoti center">小米手机</div>
			<div class="main center">
					<div id="product_tbody">
					</div>
				

				<div class="clear"></div>
			</div>
			
				
				<div class="clear"></div>
			</div>
		<div id="pageInfoUser" 
		style="text-align: right;padding-right: 30px"></div>

		<footer class="mt20 center">			
			<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>

		</footer>

	<!-- end danpin -->

<script type="text/javascript">
select();
function select() {
var categoryCode = '<%=request.getParameter("categoryCode")%>';
var name = '<%=request.getParameter("name")%>';
console.log(categoryCode);
console.log(name);
var pageIndex = $("input[name='pageIndex']").val();
var pageLimit = $("input[name='pageLimit']").val();
$.ajax({
	url :'/store/product/productList.do',
	data : {categoryCode:categoryCode,name:name,pageLimit:pageLimit,pageIndex:pageIndex},
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
	    var html = "" ;
	    var html2="";
	    for(var k in data){  //通过定义一个局部变量k遍历获取到了map中所有的key值
	    	console.log(k);
	    	if(k!="count"){
	    	  var docList=data[k]; //获取到了key所对应的value的值！ 
	 
	  $.each(docList,function(i, dom) {
    	var code = dom.code?dom.code:'';
        var name = dom.name?dom.name:'';
        var price = dom.price?dom.price:'';
        var state = dom.state?dom.state:'';
        var categoryCode=dom.categoryCode?dom.categoryCode:'';
        var des=dom.des?dom.des:'';
        var number=dom.number?dom.number:'';
        var url=dom.url?dom.url:'';
        var d={i:k,code:code,name:name,price:price,
        		state:state,categoryCode:categoryCode,des:des,
        		number:number,url:url};
        html += getlaytpl('#tradd',d);
   
            $("#product_tbody").html(html);
    })
    }
	    }
	    }
        })
}
function refresh(){
	select();
}

function xiangqing(code) {
	window.location.href = "/store/web/jsp/xiangqing.jsp?code="+code;
	
}
</script>

<script id="tradd" type="text/html">
<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
<div class="sub_mingxing" id="{{ d.code }}">
<a href="javascript:xiangqing('{{ d.code }}"><img src="/image/{{ d.url }}" ></a></div>

					<div class="pinpai"><a href="javascript:xiangqing('{{ d.code }}')" target="_blank">{{ d.name }}</a></div>
					<div class="youhui">{{ d.des }}</div>
					<div class="jiage">{{ d.price }}元</div>
</div>
</script>
<script id="tradd2" type="text/html">
<a href="javascript:xiangqing('{{ d.productCode }}"><img src="/image/{{ d.url }}" ></a>
</script>
	</body>
</html>