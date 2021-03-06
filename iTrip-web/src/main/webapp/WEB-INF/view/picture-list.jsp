﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>图片列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>订单管理 <span class="c-gray en">&gt;</span>订单跟踪 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
	<form action="picture-list.do" method="post">
	日期范围：
		<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" id="logmin" class="input-text Wdate" style="width:120px;" name="checkInDates" value="${order.checkInDates}">
		-
		<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" id="logmax" class="input-text Wdate" style="width:120px;" name="checkOutDates" value="${order.checkOutDates}">
		<input type="text" id="" placeholder="预定人名称" style="width:250px" class="input-text" name="name" value="${order.name}">
		<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜订单</button>
	</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="picture_dels(this)" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a><span class="r">共有数据：<strong>${count}</strong> 条</span></span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="40"><input name="" type="checkbox" value=""></th>
					<th width="40">ID</th>
					<th width="100">订单编号</th>
					<th width="100">预定酒店</th>
					<th width="150">入住日期</th>
					<th width="150">退房日期</th>
					<th width="150">支付金额</th>
					<th width="60">预定人</th>
					<th width="60">订单状态</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="pricture" items="${requestScope.pricture}">
				<input type="hidden" value="${picture.id}" id="id">
				<tr class="text-c">
					<td><input name="prictureId" type="checkbox" value="${pricture.id}"></td>
					<td>${pricture.id}</td>
					<td>${pricture.orderNo}</td>
					<td>${pricture.hotelName}</td>
					<td><fmt:formatDate value="${pricture.checkInDate}" pattern="yyyy年MM月dd日HH点mm分ss秒"></fmt:formatDate></td>
					<td class="text-l"><fmt:formatDate value="${pricture.checkOutDate}" pattern="yyyy年MM月dd日HH点mm分ss秒"></fmt:formatDate></td>
					<td class="text-c">${pricture.payAmount}</td>
					<td>${pricture.name}</td>
					<td class="td-status"><span class="label label-success radius">${pricture.info}</span></td>
					<td class="td-manage">
					<a style="text-decoration:none" class="ml-5" href="picture-add.do?id=${pricture.id}" title="查看">
					<i class="Hui-iconfont">&#xe6df;</i></a> 
					<a style="text-decoration:none" class="ml-5" onClick="picture_del(this,${pricture.id})" href="javascript:;" title="删除">
					<i class="Hui-iconfont">&#xe6e2;</i></a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<!--_footer 作为公共模版分离出去 -->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,8]}// 制定列不参与排序
	]
});

/*图片-添加*/
function picture_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*图片-查看*/
function picture_show(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*图片-审核*/
function picture_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过'], 
		shade: false
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布', {icon:6,time:1000});
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
}

/*图片-下架*/
function picture_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
		$(obj).remove();
		layer.msg('已下架!',{icon: 5,time:1000});
	});
}

/*图片-发布*/
function picture_start(obj,id){
	layer.confirm('确认要发布吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布!',{icon: 6,time:1000});
	});
}

/*图片-申请上线*/
function picture_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
}

/*图片-编辑*/
function picture_edit(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

function picture_del(obj, id) {
	layer.prompt({
		formType : 1,
		title : '敏感操作，请输入登入密码'
	}, function(value, index) {
		$.post("boolpwd.do",{pwd:value},function(data){
			if (data == "0") {
				layer.msg('密码错误!', {
					icon : 5,
					time : 1000
				});
				return;
		    } else {
				layer.confirm('角色删除须谨慎，确认要删除吗？', function(index) {
					$.ajax({
						type : 'POST',
						url : 'pic-delOne.do',
						data : {
							id : id
						},
						dataType : 'text',
						success : function(data) {	
							if(data > 0){
								$(obj).parents("tr").remove();
								layer.msg('已删除!', {
									icon : 1,
									time : 1000
								});
								setTimeout(function(){
									location.reload();
								},2000);
							}else{
								layer.msg('删除失败!', {
									icon : 1,
									time : 1000
								});
							}
						},
						error : function(data) {
							console.log(data.msg);
						},
					});
				});
		    }
		});
	});
}
//批量删除，获得所有id
function picture_dels(obj) {
	layer.prompt({
		formType : 1,
		title : '敏感操作，请输入登入密码'
	}, function(value, index) {
		$.post("boolpwd.do",{pwd:value},function(data){
			if (data == "0") {
				layer.msg('密码错误!', {
					icon : 5,
					time : 1000
				});
				return;
		    } else {
			    layer.confirm('角色删除须谨慎，确认要删除吗？', function(index) {
					//获得选中所有value
					var arr = [];
					$("input[name=prictureId]:checked").each(function(index, item) {
						arr[index] = $(item).val();
					});
					
					if (arr.length == 0) {
						alert("你还没有选择任何内容！");
					}
					if (arr.length > 0) {
						$.get("pic-dels.do", {
							arr : arr.toString()
						}, function(data) {						
							if(data > 0){
								layer.msg('已删除!', {
									icon : 1,
									time : 1000
								});
								setTimeout(function(){
									location.reload();
								}, 1500);
							}else{
								layer.msg('删除失败!', {
									icon : 2,
									time : 1000
								});
							}
						});
					}
			    });
		    }
		});
	});
}

</script>
</body>
</html>