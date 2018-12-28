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
<link rel="stylesheet" type="text/css" href="static/css/pagination.css" />
<title>角色管理</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		管理员管理 <span class="c-gray en">&gt;</span> 角色管理 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>

	<div class="page-container">
		<div class="cl pd-5 bg-1 bk-gray">
			<span class="l"> <a href="javascript:;" onclick="datadel()"
				class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
					批量删除</a> <a class="btn btn-primary radius"
				href="admin-role-add.do?type=1&id=0"><i class="Hui-iconfont">&#xe600;</i>
					添加角色</a>
			</span> <span class="r">共有数据：<strong id="count">${count}</strong> 条
			</span>
		</div>
		<table class="table table-border table-bordered table-hover table-bg">
			<thead>
				<tr>
					<th scope="col" colspan="6">角色管理</th>
				</tr>
				<tr class="text-c">
					<th width="25"><input type="checkbox" value="" name=""></th>
					<th width="20">ID</th>
					<th width="70">角色名</th>
					<th>用户列表</th>
					<th>账号</th>
					<th>性别</th>
					<th width="">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${requestScope.userList}">
					<tr class="text-c" name="checkTr">
						<td><input type="checkbox" value="${user.id}" name="userName"
							<c:if test="${userSession.id == user.id}">disabled</c:if>></td>
						<td>${user.id}</td>
						<td>超级管理员</td>
						<td><a href="#">${user.name}</a></td>
						<td>${user.phone}</td>
						<td><c:if test="${user.sex == 0}">女</c:if> <c:if
								test="${user.sex == 1}">男</c:if></td>
						<td class="f-14"><a title="编辑"
							href="admin-role-add.do?type=2&id=${user.id}"
							style="text-decoration: none"><i class="Hui-iconfont">&#xe6df;</i></a>
							<c:if test="${userSession.id != user.id}">
								<a title="删除" href="javascript:;"
									onclick="admin_role_del(this,${user.id})" class="ml-5"
									style="text-decoration: none"><i class="Hui-iconfont">&#xe6e2;</i></a>
							</c:if> <c:if test="${userSession.id eq user.id}">
								<a title="不可删除" href="javascript:;" class="ml-5"
									style="text-decoration: none"><i class="Hui-iconfont">&#xe6e2;</i></a>
							</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="M-box2" style="margin: 0 0 20px">
		<span style="color: #000">${pageNo}/${pageTotel}</span>
		<c:if test="${pageNo > 1}">
			<a href="admin-role.do?pageNo=1" style="color: #000;" class="next">首页</a>
			<a href="javascript:pages(${pageNo-1},${pageTotel});"
				style="color: #000;" class="next">上页</a>
		</c:if>
		<c:if test="${pageNo < pageTotel}">
			<a href="javascript:pages(${pageNo+1},${pageTotel});"
				style="color: #000;" class="next">下页</a>
			<a href="admin-role.do?pageNo=${pageTotel}" style="color: #000;"
				class="next">末页</a>
		</c:if>
	</div>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
		function pages(pageNo,pageTotel){
			if(pageNo > pageTotel){
				layer.msg('已经是最后一页了!', {
					icon : 1,
					time : 1000
				});
			}else if(pageNo < 1){
				layer.msg('已经是第一页了!', {
					icon : 1,
					time : 1000
				});
			}else{
				location = "admin-role.do?pageNo="+pageNo;
			}
		}
		/*管理员-角色-添加*/
		function admin_role_add(title, url, w, h) {
			layer_show(title, url, w, h);
		}
		/*管理员-角色-编辑*/
		function admin_role_edit(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}
		
		function admin_role_del(obj, id) {
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
								url : 'admin-delete.do',
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
											location = "admin-role.do";
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
							//获得选中所有value
							var arr = [];
							$("input[name=userName]:checked").each(function(index, item) {
								arr[index] = $(item).val();
							});
							
							if (arr.length == 0) {
								alert("你还没有选择任何内容！");
							}
							if (arr.length > 0) {
								$.get("admin-deleteUser.do", {
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
									}else{
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
	</script>
</body>
</html>