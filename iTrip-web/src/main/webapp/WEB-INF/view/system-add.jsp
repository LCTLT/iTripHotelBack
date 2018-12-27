<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,system-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
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
<!--/meta 作为公共模版分离出去-->

<title>添加用户 - H-ui.admin v3.1</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<input type="hidden" value="${system.id}" id="id">
	<div style="color:red;margin-left:26%;" id="massage"></div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>对应外键：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${system.typeCode}" placeholder="" id="typeCode" name="typeCode">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>业务代码编号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${system.dictCode}" placeholder="" id="dictCode" name="dictCode">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>配置项名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${system.info}" placeholder="" id="info" name="info">
			</div>
		</div>
			
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>字段说明：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${system.typeName}" placeholder="" id="typeName" name="typeName">
			</div>
		</div>
		
		<div class="row cl" align="center">
				
				<botton type="button" class="btn btn-success radius" id="save2" ><i class="icon-ok"></i>提交</botton>
		
			</div>
		</div>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	
	$("#save2").click(function(){
		var typeCode = $("#typeCode").val(); //获得name参数
		var dictCode= $("#dictCode").val();
		var info= $("#info").val();
		var typeName= $("#typeName").val();
		var id= $("#id").val();
		//提示
		var massage = $("#massage");
		
		if(typeCode == ""|| dictCode == "" || info == "" ||typeName == ""){
			$("#massage").text("请确认填写完!");
		}else{
			$.ajax({
				url:"system-role-add.do",
				data:{id:id,
					typeCode:typeCode,
					dictCode:dictCode,
					info:info,
					typeName:typeName},
				type:"post",
				success:function(data){
					if(data == "1"){
						layer.msg('修改成功!', {
							icon : 1,
							time : 1000
						});
						setTimeout(function(){
							location = "system-data.do";
						}, 2000);
					}else{
						layer.msg('修改失败!', {
							icon : 1,
							time : 1000
						});
					}				
				}
			});
		}
	});
	
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>