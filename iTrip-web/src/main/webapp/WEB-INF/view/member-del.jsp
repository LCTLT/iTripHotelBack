﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>删除的用户</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 删除的用户<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<form action="member-del.do" method="post" id="from1">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" name="datemin" class="input-text Wdate" style="width:120px;" value="${datemin}">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" name="datemax"  class="input-text Wdate" style="width:120px;" value="${datemax}">
		<input type="text" class="input-text" style="width:250px" placeholder="输入会员名称" id="elist" name="elist" value="${ist}">
		<input type="submit" class="btn btn-success radius" id="radius" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</input>
	</div>
	</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> </span> <span class="r">共有数据：<strong>${count}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="80">ID</th>
				<th width="100">用户名</th>
				<th width="40">性别</th>
				<th width="90">手机</th>
				<th width="150">邮箱</th>
				<th width="">地址</th>
				<th width="130">加入时间</th>
				<th width="70">状态</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${requestScope.userList}">
			<tr class="text-c">
				<td><input type="checkbox" value="${user.id}" name="userName"></td>
				<td><span name="id">${user.id}</span> </td>
				<td><u style="cursor:pointer" class="text-primary" onclick="member_show('张三','member-show.html','10001','360','400')">${user.name}</u></td>
				<td><c:if test="${user.sex == 0}">女</c:if> 
				<c:if test="${user.sex == 1}">男</c:if></td>
				<td>${user.phone}</td>
				<td>${user.email}</td>
				<td class="text-l">${user.address}</td>
				<td>${user.birthday}</td>
				<td class="td-status"><span class="label label-danger radius" id="delete" name="delete">已删除</span></td>
				<td class="td-manage"><a style="text-decoration:none" href="javascript:;" onClick="member_huanyuan(this,'${user.id}')" title="还原"><i class="Hui-iconfont">&#xe66b;</i></a> <a title="删除" href="javascript:;" onclick="member_del(this,'${user.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
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
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script> 
<script type="text/javascript">
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
		]
	});
});

/*用户-还原*/
function member_huanyuan(obj,id){
	layer.confirm('确认要还原吗？',function(index){
		$.post('updateDalUpdate.do',{id:id},function(date){
			if(date=="1"){
				$(obj).parent().parent().remove();
				layer.msg('已还原!',{icon: 6,time:1000});
				setTimeout(function(){
					location.reload();
				}, 1500);
			}else if(date=="2"){
				layer.msg('还原失败!',{icon: 6,time:1000});
			}
		})
		
	});
}

/*用户-删除*/
function member_del(obj,id){
	layer.confirm('角色删除须谨慎，确认要删除吗？', function(index) {
		$.ajax({
			type : 'POST',
			url : 'deleteDel.do',
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
					},1500);
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
//批量删除，获得所有id
function datadel(obj) {
	if (confirm('角色删除须谨慎，确认要删除吗？')) {
		//获得选中所有value
		var arr = [];
		$("input[name=userName]:checked").each(function(index, item) {
			arr[index] = $(item).val();
		});
		
		if (arr.length == 0) {
			alert("你还没有选择任何内容！");
		}
		if (arr.length > 0) {
			$.get("deleteDelList.do", {
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
</script> 
</body>
</html>