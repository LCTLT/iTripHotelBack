<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>添加产品分类</title>
</head>
<body>
<div class="page-container">
	<form action="productsava.do" method="post" class="form form-horizontal" id="form-user-add" name="from">
	<div class="row cl" id="le1" style="display:none">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>一级分类：</label>
			<div class="formControls col-xs-8 col-sm-9"><span class="select-box">
				<select name="parentId" id="level1" class="select">
				<c:forEach items="${types1}" var="type1">
					<option value="${type1.id}" <c:if test="${type1.id eq hotel.level1}">selected</c:if>>${type1.name}</option>
				</c:forEach>
				</select></span>
			</div>
		</div>
		<div class="row cl" id="le2" style="display:none">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>二级分类：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="parentId" id="level2" class="select">
					<c:forEach items="${types2}" var="type2">
					<option value="${type2.id}" <c:if test="${type2.id eq hotel.level2}">selected</c:if>>${type2.name}</option>
				</c:forEach>
				</select>
				</span> </div>
		</div>
		<div class="row cl" id="le3" style="display:none">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>三级分类：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="level3" id="level3" class="select">
					<c:forEach items="${types3}" var="type3">
					<option value="${type3.id}" <c:if test="${type3.id eq hotel.level3}">selected</c:if>>${type3.name}</option>
				</c:forEach>
				</select>
				</span>
			 </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>选择要添加的分类类型：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="type" id="level0" class="select">
				<option value="1">一级分类</option>
				<option value="2">二级分类</option>
				<option value="3">三级分类</option>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				分类名称：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<input type="text" class="input-text" value="" placeholder="" id="user-name" name="name">
			</div>
		</div>
		<div class="row cl">
			<div class="col-9 col-offset-2">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
$(function(){
	//一级分类下拉 加载二级分类
	$("#level0").change(function(){
		if($(this).val() == "1"){
			$("#level1 option:selected").val(0);
			$("#le1").css("display","none");
			$("#le2").css("display","none");
			$("#le3").css("display","none");
			return;
		}
		if($(this).val() == "2"){
			$("#le1").css("display","");
			$("#le2").css("display","none");
			levelDisabled();
			return;
		}
		if($(this).val() == "3"){
			$("#le1").css("display","");
			$("#le2").css("display","");
			var id = $("#level1").val();
			if($("#level2").val() == null){
				querylevel(id);
			}
			return;
		}
	});
	//一级分类下拉 加载二级分类
	$("#level1").change(function(){
		if($(this).val() == "请选择"){
			$("#level2").html("");
			return;
		}
		//获取选中的id
		var id = $(this).val();
		querylevel(id);
		levelDisabled();
	}); 
	
	$("#form-user-add").submit(function(){
		var level0 = $("#level0").val();
		if(level0 == 3){
			$("#level1").attr("name","")
		}else if(level0 == 1){
			$("#level1").children("option").each(function(index,item){
				$(item).val("0");
			}) 
		}
		if(from.name.value==""){
			{layer.msg('分类名称不能为空!', {
				icon : 2,
				time : 2000
			});return false;}
		}
	});
});
function querylevel(id){
    $.ajaxSettings.async = false; //把异步变为同步等待回调函数success完成才执行后面的语句
	$.getJSON("level2-list.do",{id:id},function(result){
		//清空二级分类
		var level2 = $("#level2");
		level2.html("");
		//拼接的字符
		var option = '';
		//添加
		for (var i = 0; i < result.length; i++) {
			option +='<option value="'+result[i].id+'">'+result[i].name+'</option>';
		}
		level2.append(option);
	});
}
function levelDisabled(){
	var level2 = $("#level2").val();
	var level0 = $("#level0").val();
	console.log("level2="+level2);
	console.log(level2==null);
	if(level0 == 3 && level2 == null){
		$("#user-name").val("不可添加");
		$("#user-name").attr("disabled","disabled");
		$("input[type=submit]").attr("disabled","disabled");	
	}else{
		$("#user-name").val("");
		$("#user-name").removeAttr("disabled");
		$("input[type=submit]").removeAttr("disabled");
	}
}
</script>
</body>
</html>