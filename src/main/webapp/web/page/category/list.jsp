<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
	<title>商品分类维护</title>
</head>
<body>
<div class="layui-collapse">
  <div class="layui-colla-item">
    <h2 class="layui-colla-title">商品分类信息-查询条件</h2>
    <div class="layui-colla-content layui-show">
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px; padding: 5px">
		<legend>商品分类信息-查询条件</legend>
		<form class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label" style="width: 100px">商品分类编号</label>
				<div class="layui-input-inline">
					<input type="text" name="code" placeholder="请输入分类编号" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label" style="width: 100px">商品分类名称</label>
				<div class="layui-input-inline">
					<input type="text" name="name" placeholder="请输入分类名称" autocomplete="off" class="layui-input">
				</div>
				<input type="hidden" name="pageIndex" value="1" />
			<input type="hidden" name="pageLimit" value="10" />
				<span> 
				<input type="button" class="layui-btn" lay-submit lay-filter="search" value="查询" /> 
				<input type="reset" class="layui-btn" value="重置" /> 
				<input type="button" class="layui-btn" value="添加" onclick="openAdd()" />
				</span>
			</div>
			
		</form>
	</fieldset>
	</div></div></div>
	<div class="layui-form">
		<table class="layui-table">
			<colgroup>
				<col width="10%"><col width="20%"><col width="20%">
				<col width="20%"><col width="30%"><col>
			</colgroup>
			<thead>
				<tr>
					<th>序号</th><th>商品分类编号</th><th>商品分类名称</th><th>描述</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="category_tbody"></tbody>
		</table>
		<div id="pageInfoUser" 
		style="text-align: right;padding-right: 30px"></div>
	</div>
<script type="text/javascript">

form.on('submit(search)', function(data) {
	console.log(data.field);
	$.ajax({
		url :'/store/category/list.do',
		data : data.field,
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
   var html = "" ;//加载表格中数据
    $.each(data.list,function(i, dom) {
    	var code = dom.code?dom.code:'';
        var name = dom.name?dom.name:'';
        var des = dom.des?dom.des:'';
        var parentCode = dom.parentCode?dom.parentCode:'';
        var d={i:(i+1),code:code,name:name,des:des,parentCode:parentCode};
        html += getlaytpl('#tradd',d);
    });
    $("#category_tbody").html(html);
		}
	})
});
refresh()
function refresh(){
    $("input[value='查询']").click();
}
function openAdd(){
	openLayer('/store/web/page/category/add.jsp',refresh)
}
function openUpd(code){
	openLayer('/store/web/page/category/upd.jsp?code='+code,refresh)
}
function del(code){
	openConfirm(function(index){
		ajax('/store/category/delete.do', {code:code}, 'text', function(data){
	        if (data !=null) {
	            layer.msg('删除成功');
	            $("input[name='pageIndex']").val(1);
	            refresh();
	        } else {
	            layer.msg('删除失败');
	        } 
	    })
	})
}
</script>
<script id="tradd" type="text/html">
<tr>
<td>{{ d.i }}</td><td>{{ d.code}}</td><td>{{ d.name }}</td><td>{{ d.des }}</td>
<td>
    <input type='button' value='修改' class='layui-btn' 
           onclick='openUpd("{{ d.code }}")'/>&nbsp;
    <a href="javascript:del('{{ d.code }}')" 
       class="layui-btn layui-btn-xs layui-btn-danger">
        <i class="layui-icon layui-icon-delete"></i>
    </a>&nbsp;
</td>
</tr>
</script>
</body>
</html>