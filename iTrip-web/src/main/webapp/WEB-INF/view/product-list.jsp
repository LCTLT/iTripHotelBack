﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>建材列表</title>
<style type="text/css">
table {
	table-layout: fixed;
	word-bread: bread-all;
}
</style>
<link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
</head>
<body class="pos-r">
	<div class="pos-a"
		style="width: 0px; left: 0; top: 0; bottom: 0; height: 100%; border-right: 1px solid #e5e5e5; background-color: #f5f5f5; overflow: auto;">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	<div style="margin-left: 0px;">
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
			酒店管理 <span class="c-gray en">&gt;</span> 酒店列表 <a
				class="btn btn-success radius r"
				style="line-height: 1.6em; margin-top: 3px"
				href="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;" onclick="datadel()"
				class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
					批量删除</a> <a class="btn btn-primary radius"
				onclick="product_add('添加酒店','product-add.do?type=1&hotelId=0')"
				href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加酒店</a></span> <span
				class="r">共有数据：<strong>${count}</strong> 条
			</span>
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="40"><input name="" type="checkbox" value=""></th>
						<th width="40">ID</th>
						<th width="60">缩略图</th>
						<th width="100">酒店名称</th>
						<th width="100">酒店地址</th>
						<th width="60">酒店评分</th>
						<th width="60">酒店星级</th>
						<th width="100">联系电话</th>
						<th width="100">酒店描述</th>
						<th width="60">主页显示价格</th>
						<th width="60">发布状态</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="hotel" items="${hotelList}">
						<tr class="text-c va-m">
							<td><input name="userName" type="checkbox"
								value="${hotel.hotelId}"></td>
							<td>${hotel.hotelId}</td>
							<td><img width="60" class="product-thumb"
								src="${hotel.fileUrl}"></td>
							<td class="text-l"><b class="text-success"></b>${hotel.hotelName}</td>
							<td class="text-l">${hotel.hotelAddress}</td>
							<td class="text-l">${hotel.hotelRatings}</td>
							<td class="text-l">${hotel.hotelRating}</td>
							<td class="text-l">${hotel.hotelphone}</td>
							<td class="text-l">
								<div id="divContent"
									style="width: 100%; height: 70px; overflow: auto">
									${hotel.hotelIntro}</div>
							</td>
							<td class="text-l">${hotel.hotelPrice}</td>
							<td class="td-status"><span
								class="label label-success radius">已发布</span></td>
							<td class="td-manage"><a
								style="text-decoration: none" class="ml-5"
								onClick="product_edit('酒店编辑','product-add.do?type=2&hotelId=${hotel.hotelId}','10001')"
								href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
								<a style="text-decoration: none" class="ml-5"
								onClick="product_del(this,'${hotel.hotelId}')"
								href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->
	
	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
	
	var setting = {
	view: {
		dblClickExpand: false,
		showLine: false,
		selectedMulti: false
	},
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: ""
		}
	},
	callback: {
		beforeClick: function(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			if (treeNode.isParent) {
				zTree.expandNode(treeNode);
				return false;
			} else {
				//demoIframe.attr("src",treeNode.file + ".html");
				return true;
			}
		}
	}
};	
		
		
$(document).ready(function(){
	var t = $("#treeDemo");
	t = $.fn.zTree.init(t, setting, zNodes);
	//demoIframe = $("#testIframe");
	//demoIframe.on("load", loadReady);
	var zTree = $.fn.zTree.getZTreeObj("tree");
	//zTree.selectNode(zTree.getNodeByParam("id",'11'));
});

$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  {"orderable":false,"aTargets":[0,7]}// 制定列不参与排序
	]
});
/*产品-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-查看*/
function product_show(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-审核*/
function product_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过'], 
		shade: false
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="product_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布', {icon:6,time:1000});
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="product_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
}
/*产品-下架*/
function product_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="product_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
		$(obj).remove();
		layer.msg('已下架!',{icon: 5,time:1000});
	});
}

/*产品-发布*/
function product_start(obj,id){
	layer.confirm('确认要发布吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="product_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布!',{icon: 6,time:1000});
	});
}

/*产品-申请上线*/
function product_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
}

/*产品-编辑*/
function product_edit(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*产品-删除*/
function product_del(obj,id){
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
				layer.confirm('删除需谨慎,确认要删除吗？',function(index){
					$.ajax({
						type: 'POST',
						url: 'product-delete.do',
						data : {
							hotelId : id
						},
						dataType: 'text',
						success: function(data){
							if(data>0){
								$(obj).parents("tr").remove();
								layer.msg('已删除!',{
									icon:1,
									time:1000
								});
								setTimeout(function(){
									location.reload();
								},1500);
							}else{
								layer.msg('删除失败!', {
									icon : 1,
									time : 1000
								});
							}
						},
						error:function(data) {
							console.log(data.msg);
						},
					});		
				});
		    }
		});
	});
		
}
	//批量删除，获得所有id
	function datadel(obj) {
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
					if (confirm('删除多个酒店须谨慎，确认要删除吗？')) {
						//获得选中所有value
						var arr = [];
						$("input[name=userName]:checked").each(function(index, item) {
							arr[index] = $(item).val();
						});
						
						if (arr.length == 0) {
							alert("你还没有选择任何内容！");
						}
						if (arr.length > 0) {
							$.get("product-deleteHotel.do", {
								arr : arr.toString()
							}, function(data) {						
								if(data > 0){
									$("input[name=userName]:checked").each(function(index, item) {
										$(item).parent().parent().remove();
									});
									layer.msg('已删除!', {
										icon : 1,
										time : 1000
									});
									setTimeout(function(){
										location.reload();
									},1500);
								}else{
									layer.msg('删除失败!', {
										icon : 1,
										time : 1000
									});
								}
							});
						}
					}
			    }
			});
		});
}
</script>
</body>
</html>