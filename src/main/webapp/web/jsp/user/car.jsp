<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
        <%@ include file="/web/header.jsp"%>
		<title>我的购物车-小米商城</title>
		<link rel="stylesheet" type="text/css" href="/store/web/common/css/style.css">
	</head>
	<body>
	<!-- start header -->
	<!--end header -->

<!-- start banner_x -->
		<div class="banner_x center">
			<a href="/store/web/jsp/user/userIndex.jsp" target="_blank"><div class="logo fl"></div></a>
			
			<div class="wdgwc fl ml40">我的购物车</div>
			<div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
			<div class="dlzc fr">
				<ul id="user">
					<li><a href="/store/web/jsp/login.jsp" target="_blank">登录</a></li>
					<li>|</li>
					<li><a href="/store/web/jsp/register.jsp" target="_blank">注册</a></li>	
				</ul>
				
			</div>
			<div class="clear"></div>
		</div>
		<div class="xiantiao"></div>
		<div class="gwcxqbj">
			<div class="gwcxd center">
				<div class="top2 center">
					<div class=" sub_top fl ">
						<input type="checkbox"  class="quanxuan"  name="quanxuan" id="quanxuan"
						 onclick="quanxuan()"/>全选
					</div>
					<div class="sub_top fl">商品名称</div>
					<div class="sub_top fl">单价</div>
					<div class="sub_top fl">数量</div>
					<div class="sub_top fl">小计</div>
					<div class="sub_top fr">操作</div>
					<div class="clear"></div>
				</div>
				<div id="car"></div>
			</div>
			<div class="jiesuandan mt20 center">
				<div class="tishi fl ml20">
					<ul>
						<li><a href="/store/web/common/liebiao.html">继续购物</a></li>
						<li>|</li>
						<div id="productSelect">
						<li>共<span id="productSum">2</span>件商品，已选择<span id="productSelect">1</span>件</li>
						</div>
						<div class="clear"></div>
					</ul>
				</div>
				
				<div class="jiesuan fr">
				<div id="sum">
				<div class="jiesuanjiage fl" id="jiesuan">合计（不含运费）：<span>0元</span></div>
				</div>
					<div class="jsanniu fr"><input class="jsan" type="submit" name="jiesuan"  value="去结算"  onclick="jiesuan()"/></div>
					 
					<div class="clear">
					
					</div>
					
				</div>
				
				<div class="clear"></div>
			</div>
			<div id="addAdress" style="margin-top: 40px;margin-bottom: 50px"></div>
		</div>

 

	
	
<script type="text/javascript">
user();
function user() {
	var usercode='<%=session.getAttribute("user")%>';
	console.log(usercode);
	if(!(usercode==null||usercode==""||typeof(usercode)=="undefined"||usercode=="null")){ 
		 var html='<li><a href="javascript:userinfo()" target="_blank">${user.name}</a></li>'+
			'<li>|</li>'+
			'<li><a href="javascript:quit(${user.code})" target="_blank" >退出登录</a></li>'+
			'<li>|</li>';
		$("#user").html(html);
		 } 
}
select();
function select() {
	var userCode=${user.code};
	$.ajax({
        url:'/store/car/list.do',
        dataType : 'json',
        data:{userCode:userCode},
        type : 'post',
        success : function(data){
        	console.log(data);
	    var html = "" ;
	    var html2 = "" ;
	  $.each(data,function(i, dom) {
		  var id=dom.id?dom.id:"";
    	var productCode = dom.productCode?dom.productCode:'';
        var number=dom.number?dom.number:'';
        var name=dom.name?dom.name:'';
        var userCode=dom.userCode?dom.userCode:'';
        var price=dom.price?dom.price:'';
        var subtatol=price*number;
        var d={i:('image'+i),n:('number'+i),s:('subtatol'+id),nu:('number'+id),productCode:productCode,number:number,name:name,
        		p:('productCode'+id),userCode:userCode,price:price,subtatol:subtatol,id:id};
        html += getlaytpl('#tradd',d);
        image(productCode,html2,i);
        
    });
	$("#car").html(html);
	number();
        }
})
}
function image(productCode,html2,i) {
	$.ajax({
        url:'/store/image/carList.do',
        dataType : 'json',
        data:{productCode:productCode},
        type : 'post',
        success : function(data){
        	console.log(data);
	  $.each(data.list,function(i, dom) {
    	var url = dom.url?dom.url:'';
        var d={url:url};
        html2 += getlaytpl('#tradd2',d);
    });
	  $("#image"+i).html(html2);
        }
})
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

function update(productCode,userCode,n) {
	console.log(n);
	var number=document.getElementById(n).value;
	console.log(number);
	$.ajax({
        url:'/store/car/update.do',
        dataType : 'text',
        data:{productCode:productCode,userCode:userCode,number:number},
        type : 'post',
        success : function(data) {
        	if (data==1) {
	            layer.msg('更新成功');
	            select();
	        } else{
	            layer.msg('更新失败');
	        } 
        }
    })	
}

function del(productCode,userCode) {
	console.log(productCode);
	console.log(userCode);
	layer.confirm('确认删除?', function(index){
	$.ajax({
        url:'/store/car/delete.do',
        dataType : 'text',
        data:{productCode:productCode,userCode:userCode},
        type : 'post',
        success : function(data) {
        	if (data==1) {
	            layer.msg('删除成功');
	            select();
	        } else{
	            layer.msg('删除失败');
	        } 
        }
    })	
	  layer.close(index);
	});   
}
function quanxuan() {
	var cks = document.getElementsByName("quanxuan1");
	var flag=$("#quanxuan").prop("checked");
	console.log(cks);
	console.log(flag);
	if(flag){
		for ( var i = 0; i < cks.length; i++) {
		    cks[i].checked = true;
		   }
		  } else {
		   for ( var i = 0; i < cks.length; i++) {
		    cks[i].checked = false;
		   }
		 
		  }
	dianji();
	}

	function dianji(){
		 number();
		var cks = document.getElementsByName("quanxuan1");
		var total=0;
		for ( var i = 0; i < cks.length; i++) {
			if(cks[i].checked ==true){
		
		var html = '' ;
				$.ajax({
			        url:'/store/car/list.do',
			        dataType : 'json',
			        data:{id:cks[i].value},
			        type : 'post',
			        success : function(data){
				  $.each(data,function(i, dom) {
					  var id=dom.id?dom.id:"";
			    	var productCode = dom.productCode?dom.productCode:'';
			        var number=dom.number?dom.number:'';
			        var price=dom.price?dom.price:'';
			        total +=price*number;
			        var d={i:('image'+i),n:('number'+i),productCode:productCode,number:number,
			        		price:price,total:total,id:id};
			    });
				  console.log(total);
				  var d={total:total};
			        html = getlaytpl('#tradd3',d);
			        $("#sum").html(html);
			        }
			       
			})
			}
			  console.log(total);
			  var d={total:total};
		        html = getlaytpl('#tradd3',d);
		        $("#sum").html(html);
		}
	}
	
	function number() {
		console.log("jgfbusuglfuisb");
		var cks = document.getElementsByName("quanxuan1");
		var j=0;
		for ( var i = 0; i < cks.length; i++) {
			if(cks[i].checked ==true){
				j++;
			}}
		console.log(j);
		 var d={productSelect:j,productSum:cks.length};
	        html = getlaytpl('#tradd4',d);
	        $("#productSelect").html(html);
	}
	function jiesuan() {
		var html='';
		var d={};
		html = getlaytpl('#tradd5',d);
        $("#addAdress").html(html);
	}
	
	function userinfo() {
		window.location.href = "/store/web/jsp/user/dingdan.jsp";
	}
	
	function orderAdd() {
		var address=$("#address").val();
		var userCode=${user.code};
		console.log(address);
			$.ajax({
				url:"/store/order/userAdd.do",
				data:{userCode:userCode,address:address},
				type:'post',
				dataType:'text',
				success : function(data){
					if(data!=null){
						console.log(data);
						 orderProductAdd(data)
					}
				}
		})
	}
	 function orderProductAdd(data) {
		 var cks = document.getElementsByName("quanxuan1");
		 for ( var i = 0; i < cks.length; i++) {
				if(cks[i].checked ==true){
					
					var productCode=$("#productCode"+cks[i].value).val();
					var number=$("#number"+cks[i].value).val();;
					var cost=$("#subtatol"+cks[i].value).val();
					console.log(productCode);
					console.log(number);
					console.log(cost);
					$.ajax({
						url:"/store/orderProduct/add.do",
						data:{orderCode:data,productCode:productCode,
							number:number,cost:cost},
						type:'post',
						dataType:'json',
						success:function(data){
							if(data!=null){
								layer.msg('下单成功');
								}
							else{
								layer.msg('下单失败');
								 closeThis(3000);
							}
							}
						})
				}}
				
			
	}
</script>
<script id="tradd" type="text/html">
<div class="content2 center">
					<div class="sub_content fl ">
						<input type="checkbox" value="{{ d.id }}" class="quanxuan1" id="quanxuan1" name="quanxuan1" onclick="dianji()"/>
					</div>
					<div id="{{ d.i }}"></div>
					<div class="sub_content fl ft20" style="width: 330px" >{{ d.name }}</div>
					<div class="sub_content fl ">{{ d.price }}元</div>
					<div class="sub_content fl">
						<input class="shuliang" type="number" id="{{ d.n }}" value="{{ d.number }}" step="1" min="1" 
onclick="update('{{ d.productCode }}','{{ d.userCode }}','{{ d.n }}')">

					</div>
					<div class="sub_content fl"  value="{{ d.subtatol }}">{{ d.subtatol }}元</div>
					<div class="sub_content fl"><a href="javascript:del('{{ d.productCode }}','{{ d.userCode }}')">×</a></div>
					<div class="clear"></div>
				</div>
<input type="hidden" id="{{ d.p }}" value="{{ d.productCode }}">
<input type="hidden" id="{{ d.s }}" value="{{ d.subtatol }}">
</script>
<script id="tradd2" type="text/html">
<div class="sub_content fl"><img src="/image/{{ d.url}}" width="80px" height="80px"></div>
</script>

<script id="tradd3" type="text/html">
					<div class="jiesuanjiage fl" id="jiesuan">合计（不含运费）：<span>{{ d.total }}元</span></div>
</script>
<script id="tradd4" type="text/html">
					<li>共<span >{{ d.productSum }}</span>件商品，已选择<span> {{ d.productSelect }}</span>件</li>
</script>
<script id="tradd5" type="text/html">  
<label class="layui-form-label">收货地址：</label>
<div class="layui-input-inline">     
					 
                <input type="text" name="address" lay-verify="required" placeholder="请输入地址" autocomplete="off" id="address"
                    class="layui-input">
 <input type="button" class="layui-btn" onclick="orderAdd()" value="确定" style="margin-top: 20px;"/>
            </div>
 
</script>
	</body>
</html>
