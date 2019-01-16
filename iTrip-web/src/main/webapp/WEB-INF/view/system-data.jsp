<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<title>数据字典</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		系统管理 <span class="c-gray en">&gt;</span> 数据字典 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="text-c">
			<div style="color: red; margin-left: 26%;" id="massage"></div>
			字段英文标识: <input type="text" class="input-text" id="typeCode" name=""
				style="width: 80px"> 业务内容: <input type="text"
				class="input-text" id="info" name="" style="width: 80px">
			业务代码编号: <input type="text" class="input-text" id="dictCode" name=""
				style="width: 80px"> 字段说明: <input type="text"
				class="input-text" id="typeName" name="" style="width: 80px">
			<button type="button" class="btn btn-primary radius" id="sace1"
				name="sace1">
				<i class="Hui-iconfont">&#xe600;</i>添加字典
			</button>
		</div>

		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> <a href="javascript:;" onclick="datadel()"
				class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
					批量删除</a>
			</span> <span class="r">共有数据：<strong>${count}</strong> 条
			</span>
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="" value=""></th>
						<th width="100">ID</th>
						<th>字段英文标识</th>
						<th width="135">业务代码编号</th>
						<th width="135">业务内容</th>
						<th width="120">字段说明</th>
						<th width="120">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="system" items="${requestScope.systemlist}">
						<tr class="text-c">
							<td><input type="checkbox" value="${system.id}"
								name="userName"></td>
							<td>${system.id}</td>
							<td>${system.typeCode}</td>
							<td>${system.dictCode}</td>
							<td>${system.info}</td>
							<td>${system.typeName}</td>
							<td class="f-14"><a style="text-decoration: none"
								href="system-add.do?id=${system.id}" title="编辑"><i
									class="Hui-iconfont">&#xe6df;</i></a> <a title="删除"
								href="javascript:;"
								onclick="system_data_del(this,'${system.id}')" class="ml-5"
								style="text-decoration: none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
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
			"aoColumnDefs" : [
			//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
			{
				"orderable" : false,
				"aTargets" : [ 0, 5 ]
			} // 制定列不参与排序
			]
		});
		/*用户-批量删除*/
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
					layer.confirm('角色删除须谨慎，确认要删除吗？', function(index) {
						var arr = [];
						$("input[name=userName]:checked").each(
								function(index, item) {
									arr[index] = $(item).val();
								});

						if (arr.length == 0) {
							layer.msg('没有选择任何用户!', {
								icon : 5,
								time : 1000
							});
						}
						if (arr.length > 0) {
							$.get("system-deleteUser.do", {
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
										icon : 1,
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
		/*数据字典-编辑*/
		$("#sace1").click(
				function() {
					var typeCode = $("#typeCode").val(); //获得name参数
					var info = $("#info").val();
					var dictCode = $("#dictCode").val();
					var typeName = $("#typeName").val();
					//提示
					var massage = $("#massage");

					if (typeCode == "" || info == "" || dictCode == ""
							|| typeName == "") {
						$("#massage").text("请确认填写完整！");
					} else {
						$.ajax({
							url : "system-role—add.do",
							data : {
								typeCode : typeCode,
								info : info,
								dictCode : dictCode,
								typeName : typeName
							},
							type : "post",
							success : function(data) {
								if (data == "1") {
									layer.msg('添加成功!', {
										icon : 1,
										time : 1000
									});
									setTimeout(function() {
										location = "system-data.do";
									}, 2000);
								} else {
									layer.msg('添加失败!', {
										icon : 1,
										time : 1000
									});
								}
							}
						});
					}
				});
		/*数据字典-删除*/
		function system_data_del(obj, id) {
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
							url : 'system-delete.do',
							data : {
								id : id
							},
							dataType : 'text',
							success : function(data) {
								if (data > 0) {
									$(obj).parents("tr").remove();
									layer.msg('已删除!', {
										icon : 1,
										time : 1000
									});
									setTimeout(function() {
										location = "system-data.do";
									}, 2000);
								} else {
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
	</script>
</body>
</html>