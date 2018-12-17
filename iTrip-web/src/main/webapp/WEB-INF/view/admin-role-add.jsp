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
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
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

<title>新建网站角色 - 管理员管理 - H-ui.admin v3.1</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form action="updateUser.do" method="post" class="form form-horizontal" id="form1">
		<input type="hidden" id="id" value="${user.id}">
		<div class="row cl">
		<div style="color:red;margin-left:26%;" id="massage"></div>
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>账号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${user.phone}" placeholder="" id="phone" name="roleName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${user.name}" placeholder="" id="name" name="">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" value="${user.pwd}" placeholder="" id="pwd" name="">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">确认密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" value="${user.pwd}" placeholder="" id="pwds" name="">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">角色：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<dl class="permission-list">
					<dt>
						<label>
							<input type="radio" value="0" name="status" checked="checked" id="status">
							超级管理员
							<c:if test="${type eq 2}">
								<input type="radio" value="1" name="status" id="status">
								会员用户
							</c:if>
						</label>
					</dt>
				</dl>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">性别：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<dl class="permission-list">
					<dt>
						<label>
							<input type="radio" value="1" name="sex" checked="checked" id="sex">
							男
							<input type="radio" value="0" name="sex" id="sex">
							女
						</label>
					</dt>
				</dl>
			</div>
		</div>

		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<c:if test="${type eq 1}">
					<botton type="button" class="btn btn-success radius" id="admin-role-save" name="admin-role-save"><i class="icon-ok"></i> 确定</botton>
				</c:if>
				<c:if test="${type eq 2}">
					<botton type="button" class="btn btn-success radius" id="admin-role-save2" name="admin-role-save2"><i class="icon-ok"></i>确定</botton>
				</c:if>
			</div>
		</div>
	</form>
</article>

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
	$("#admin-role-save").click(function(){
		var phone = $.trim($("#phone").val());
		var pwd = $.trim($("#pwd").val());
		var pwds = $.trim($("#pwds").val());
		var name = $.trim($("#name").val());
		
		var status = $("input[name=status]:checked").val();
		var sex = $("input[name=sex]:checked").val();
		//提示
		var massage = $("#massage");
		if(phone == "" || phone.length < 3){
			$("#massage").text("账号格式不正确");
		}else if(pwd =="" || pwd.length < 6){
			$("#massage").text("密码格式不正确");
		}else if(name == ""){
			$("#massage").text("请输入用户姓名");
		}else if(pwds == "" || pwds.length < 6 || pwd != pwds){
			$("#massage").text("密码不一致");
		}else{
			$.post("insertUser.do",{
				phone:phone,
				pwd:pwd,
				status:status,
				name:name,
				sex:sex
				},function(data){
				if(data == "1"){
					layer.msg('添加成功!', {
						icon : 1,
						time : 1000
					});
					setTimeout(function(){
						location = "admin-role.do";
					}, 2000);
				}else{
					layer.msg('添加失败!', {
						icon : 1,
						time : 1000
					});
				}
			});
		}
	});
	
	$("#admin-role-save2").click(function(){
		var phone = $.trim($("#phone").val());
		var pwd = $.trim($("#pwd").val());
		var pwds = $.trim($("#pwds").val());
		var name = $.trim($("#name").val());
		var id = $("#id").val();
		var status = $("input[name=status]:checked").val();
		var sex = $("input[name=sex]:checked").val();
		//提示
		var massage = $("#massage");
		if(phone == "" || phone.length < 3){
			$("#massage").text("账号格式不正确");
		}else if(pwd =="" || pwd.length < 6){
			$("#massage").text("密码格式不正确");
		}else if(name == ""){
			$("#massage").text("请输入用户姓名");
		}else if(pwds == "" || pwds.length < 6 || pwd != pwds){
			$("#massage").text("密码不一致");
		}else{
			$.ajax({
				url:"updateUser.do",
				data:{
					id:id,
					phone:phone,
					pwd:pwd,
					name:name,
					status:status,
					sex:sex
				},
				type:"post",
				success:function(data){
					if(data == "1"){
						layer.msg('修改成功!', {
							icon : 1,
							time : 1000
						});
						setTimeout(function(){
							location = "admin-role.do";
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
	
	
	$(".permission-list dt input:checkbox").click(function(){
		$(this).closest("dl").find("dd input:checkbox").prop("checked",$(this).prop("checked"));
	});
	$(".permission-list2 dd input:checkbox").click(function(){
		var l =$(this).parent().parent().find("input:checked").length;
		var l2=$(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
		if($(this).prop("checked")){
			$(this).closest("dl").find("dt input:checkbox").prop("checked",true);
			$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",true);
		}
		else{
			if(l==0){
				$(this).closest("dl").find("dt input:checkbox").prop("checked",false);
			}
			if(l2==0){
				$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",false);
			}
		}
	});
	
	$("#form-admin-role-add").validate({
		rules:{
			roleName:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		}
	});
});
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>