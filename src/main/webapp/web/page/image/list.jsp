<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>图片上传</title>
</head>
<body>
<div class="layui-upload">
  <button type="button" class="layui-btn layui-btn-normal" id="imageUpload">选择多文件</button> 
  <div class="layui-upload-list">
    <table class="layui-table">
      <thead>
        <tr><th>文件名</th>
        <th>大小</th>
        <th>状态</th>
        <th>操作</th>
      </tr></thead>
      <tbody id="demoList"></tbody>
    </table>
  </div>
  <button type="button" class="layui-btn" id="testListAction">开始上传</button>
</div> 
 <table class="layui-table">
			<colgroup>
				<col width="10%"><col width="10%"><col width="10%">
				<col width="10%"><col width="10%"><col>
			</colgroup>
			<thead>
				<tr>
					<th>序号</th>
					<th>图片类型</th><th>图片</th><th>所属商品</th><th>操作</th>
				</tr>
			</thead>
			<tbody id="image_tbody"></tbody>
		</table>
 <div class="layui-form-item">
 <div id="image"> </div>      
            </div>
<script>
var code = '<%=request.getParameter("code")%>';
console.log(code);
init();
function init(){
   
	$.ajax({
        url:'/store/image/list.do',
        data :{productCode:code},
        dataType : 'json',
        type : 'post',
        success :function(data) {
    console.log(data.list);
    var html = "" ;//加载表格中数据
    $.each(data.list,function(i, dom) {
    	var productCode = dom.productCode?dom.productCode:'';
    	var url = dom.url?dom.url:'';
        var type = dom.type?dom.type:'';
        var id=dom.id?dom.id:'';
        var d={i:(i+1), productCode: productCode,url:url,type:type,id:id};
        html += getlaytpl('#tradd',d);
    });
    $("#image_tbody").html(html);
        }
});
}
var demoListView = $('#demoList')
,uploadListIns = upload.render({
  elem: '#imageUpload'
  ,url: '/store/image/upload.do'
  ,data :{productCode:code}
  ,accept: 'images'
  ,multiple: true
  ,auto: false
  ,bindAction: '#testListAction'
  ,choose: function(obj){   
    var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
    //读取本地文件
    obj.preview(function(index, file, result){
      var tr = $(['<tr id="upload-'+ index +'">'
        ,'<td>'+ file.name +'</td>'
        ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
        ,'<td>等待上传</td>'
        ,'<td>'
          ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
          ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
        ,'</td>'
      ,'</tr>'].join(''));
      
      //单个重传
      tr.find('.demo-reload').on('click', function(){
        obj.upload(index, file);
      });
      
      //删除
      tr.find('.demo-delete').on('click', function(){
        delete files[index]; //删除对应的文件
        tr.remove();
        uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
      });
      
      demoListView.append(tr);
    });
  }
  ,done: function(res, index, upload){
    if(res.code == 0){ //上传成功
    	init();
      var tr = demoListView.find('tr#upload-'+ index)
      ,tds = tr.children();
      tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
      tds.eq(3).html(''); //清空操作
      return delete this.files[index]; //删除文件队列已经上传成功的文件
    }
    this.error(index, upload);
  }
  ,error: function(index, upload){
    var tr = demoListView.find('tr#upload-'+ index)
    ,tds = tr.children();
    tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
    tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
  }
});

function del(id){
	openConfirm(function(index){
		ajax('/store/image/delete.do', {id:id}, 'text', function(data){
	        if (data !=null) {
	            layer.msg('删除成功');
	            init();
	        } else {
	            layer.msg('删除失败');
	        } 
	    })
	})
}
function setMain(id){
	ajax('/store/image/setMain.do', {id:id}, 'text', function(data){
        if (data ==1) {
            layer.msg('设置成功');
            init();
        } else {
            layer.msg('设置失败');
        } 
    })
}
</script>
<script id="tradd" type="text/html">
<tr>
<td>{{ d.i }}</td><td>{{ d.type }}</td>
<td><img  src="/image/{{ d.url}}" width="100px"></td>
<td>{{ d. productCode }}</td>
<td>
    <input type='button' value='设为主图' class='layui-btn' 
           onclick='setMain("{{ d.id }}")'/>&nbsp;
    <a href="javascript:del('{{ d.id }}')" 
       class="layui-btn layui-btn-xs layui-btn-danger">
        <i class="layui-icon layui-icon-delete"></i>
    </a>&nbsp;
</td>
</tr>
</script>
</body>
</html>