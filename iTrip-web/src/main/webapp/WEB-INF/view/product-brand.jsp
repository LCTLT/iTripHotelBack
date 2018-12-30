<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" type="text/css" href="static/css/pagination.css" />
<title>品牌管理</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		产品管理 <span class="c-gray en">&gt;</span> 房型管理 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="text-c">
			<form class="" method="post" action="product-brand.do" target="_self">
				<input type="text" class="input-text" style="width: 250px"
					placeholder="请输入酒店名称" id="hotel" name="hotelName" value="${hotelName}">
				<input type="text" class="input-text" style="width: 250px"
					placeholder="请输入房间类型" id="house" name="houseName" value="${ist}">
				<input type="submit" class="btn btn-success radius" id="radius"
					name=""><i class="Hui-iconfont">&#xe665;</i>搜索房型</input>
			</form>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;" id="delAll" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
					批量删除</a></span>&nbsp;&nbsp;&nbsp;<a class="btn btn-primary radius"
				href="javascript:;"
				onclick="product_add('添加房型','product-brand-add.do?type=1&houseId=0')"><i
				class="Hui-iconfont">&#xe600;</i>添加房型</a> <span class="r">共有数据：<strong>${count}</strong>
				条
			</span>
		</div>
		<div class="mt-20">
			<table class="table table-border table-bordered table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="" value=""></th>
						<th width="25">ID</th>
						<th width="80">房型名称</th>
						<th width="35">房间类型</th>
						<th width="200">房间简介</th>
						<th width="30">价格</th>
						<th width="30">设施</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="hotel" items="${requestScope.hotel}">
						<tr class="text-c">
							<td><input name="userName" type="checkbox"
								value="${hotel.houseId}"></td>
							<td><span name="id">${hotel.houseId}</span></td>
							<td>${hotel.hotelName}</td>
							<td>${hotel.houseType}</td>
							<td class="text-l">
								<div id="divContent"
									style="width: 100%; height: 70px; overflow: auto">
									${hotel.contentOne},${hotel.contentTow},${hotel.contentThree},${hotel.contentFour},${hotel.contentFive}
								</div>
							</td>
							<td>${hotel.housePrice}</td>
							<td><c:if test="${hotel.isHavingBreakfast eq 1}">
					   含早餐
					</c:if> <c:if test="${hotel.isHavingBreakfast eq 0}">
					   不含早餐
					</c:if></td>
							<td class="f-14 product-brand-manage"><a
								style="text-decoration: none"
								onclick="product_edit('修改房型','product-brand-add.do?type=2&houseId=${hotel.houseId}')"
								href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
								<a style="text-decoration: none" class="ml-5"
								href="javascript:member_del(this,${hotel.houseId});" title="删除"><i
									class="Hui-iconfont">&#xe6e2;</i></a></td>
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
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
		$('.table-sort').dataTable({
			"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
			"bStateSave" : true,//状态保存
			"aoColumnDefs" : [ {
				"orderable" : false,
				"aTargets" : [ 0, 6 ]
			} // 制定列不参与排序
			]
		});

		/*产品-添加*/
		function product_add(title, url) {
			var index = layer.open({
				type : 2,
				title : title,
				content : url
			});
			layer.full(index);
		}
		/*产品-编辑*/
		function product_edit(title, url, id) {
			var index = layer.open({
				type : 2,
				title : title,
				content : url
			});
			layer.full(index);
		}
		/*用户-删除*/
		function member_del(obj,id) {
			layer.prompt({
				formType : 1,
				title : '敏感操作，请输入登入密码'
			}, function(value, index) {
				$.post("boolpwd.do", {
					pwd : value
				}, function(data) {
					if (data == "0") {
						layer.msg('密码错误!', {
							icon : 5,
							time : 1000
						});
						return;
					} else {
						layer.confirm('房型删除须谨慎，确认要删除吗？', function(index) {
							$.post("product-brand-del.do", {
								id : id
							}, function() {
								if (data > 0) {
									$(obj).parents("tr").remove();
									layer.msg('已删除!', {
										icon : 1,
										time : 1000
									});
									setTimeout(function() {
										location.reload();
									}, 1500);
								} else {
									layer.msg('删除失败!', {
										icon : 2,
										time : 1000
									});
								}
							});
						});
					}
				});
			});
		}
		//批量删除，获得所有id
		$("#delAll").click(function(){
			layer.prompt({
				formType : 1,
				title : '敏感操作，请输入登入密码'
			}, function(value, index) {
				$.post("boolpwd.do", {
					pwd : value
				}, function(data) {
					if (data == "0") {
						layer.msg('密码错误!', {
							icon : 5,
							time : 1000
						});
						return;
					} else {
						layer.confirm('房型删除须谨慎，确认要删除吗？', function(index) {
							//获得选中所有value
							var arr = [];
							$("input[name=userName]:checked").each(function(index, item) {
										arr[index] = $(item).val();
							});
							if (arr.length == 0) {
								layer.alert("你还没有选择任何内容！");
							}
							if (arr.length > 0) {
								$.get("product-brand-delList.do", {
									arr : arr.toString()
								}, function(data) {
									if (data > 0) {
										$("input[name=userName]:checked").each(
												function(index, item) {
													$(item).parent().parent()
															.remove();
										});
										layer.msg('已删除!', {
											icon : 1,
											time : 1000
										});
										setTimeout(function() {
											location.reload();
										}, 1500);
									} else {
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
		});
	</script>
</body>
</html>