<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>后台管理</title>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">后台管理</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="javascript:quit('${user.code}');">首页</a></li>
    
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          
          ${user.name}
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="javascript:quit('${user.code}');">退出登录</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
       <li class="layui-nav-item layui-nav-itemed">
          <a href="javascript:;">用户管理</a> 
          <dl class="layui-nav-child">
          <dd><a href="javascript:openUrl('${pageContext.request.contextPath}/web/page/userinfo/list.jsp')">用户信息维护</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">商品管理</a>
          <dl class="layui-nav-child">
          <dd><a href="javascript:openUrl('${pageContext.request.contextPath}/web/page/category/list.jsp')">商品分类管理</a></dd>
          <dd><a href="javascript:openUrl('${pageContext.request.contextPath}/web/page/product/list.jsp')">商品信息维护</a></dd>
          </dl>
        </li>
       <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">订单管理</a>
          <dl class="layui-nav-child">
          <dd><a href="javascript:openUrl('${pageContext.request.contextPath}/web/page/order/list.jsp')">订单信息维护</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <iframe name="rightframe" width="100%" height="100%" src="${pageContext.request.contextPath}/web/page/userinfo/list.jsp"
     ></iframe>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    
  </div>
</div>
<script type="text/javascript">

layui.use('element', function(){
  var element = layui.element;
  
});
function quit(code){
	openConfirm(function(index){
		ajax('/store/user/quit.do', {code:code}, 'text', function(data){
			console.log(data);
	        if (data==1) {
	            layer.msg('退出成功');
	            location.href=contextPath+"/web/jsp/user/userIndex.jsp"
	        } else{
	            layer.msg('退出失败，未获取到用户账户信息。');
	        } 
	    })
	})
}
function openUrl(url){
	window.open(url,"rightframe")
}
var contextPath='${pageContext.request.contextPath}';
</script>
</body>
</html>