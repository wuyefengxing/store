
var form = layui.form;
var $ = layui.jquery;
var layer = layui.layer;
var element = layui.element;
var laypage = layui.laypage;
var laytpl = layui.laytpl;
var laydate = layui.laydate;
var upload = layui.upload;



function goLogout() {
	openConfirm(function(index) {
		layer.close(index);
		toJsp("/EmployeeServlet?action=logout");
		// location.href = con.app + "/EmployeeServlet?action=logout";
	}, '确定注销？');
}
function openConfirm(func, title) {
	layer.confirm(title ? title : "确定进行该操作？", {
		icon : 3,
		title : '提示'
	}, func);
}

function formSubmit(url, submit, dataType, func) {
	form.on(submit, function(data) {
		ajax(url, data.field, dataType, func);
	});
}
function ajax(url, field, dataType, func) {
	$.ajax({
		url :url,
		data : field,
		dataType : dataType,
		type : 'post',
		success : func
	});
}
function openLayer(url, end) {
	layer.open({
		type : 2,
		area : [ '800px', '550px' ],
		fixed : false, // 不固定
		maxmin : true,
		end : end,
		content : url
	});
}
function closeThis(time) {
	setTimeout(function() {// 先得到当前iframe层的索引
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
	}, time ? time : 200)
}
function setPageInfo(elem, count, curr, limit, jump) {
	laypage.render({
				elem : elem,// id
				count : count,// 数据总数
				curr : curr,// 当前页
				limit : limit,// 每页显示的条数
				limits : [ 5 ,10, 20 ],// 每页条数的选择项
				layout : [ 'count', 'prev', 'page', 'next', 'limit', 'refresh',
						'skip' ],
				jump : jump
			});
}
function getlaytpl(sel, data) {
	return laytpl($(sel).html()).render(data);
}
function renderLaydate(id) {
	laydate.render({
		elem : '#' + id,
		type : 'date'
	});
}
function renderUpload(id, url, data, done) {
	var uploadInst = upload.render({
		elem : '#' + id, // 绑定元素
		url : url, // 上传接口
		data : data,
		done : done
	});
}
