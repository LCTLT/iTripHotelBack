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
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>产品分类</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 分类管理<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<iframe ID="testIframe" Name="testIframe" FRAMEBORDER=0 SCROLLING=AUTO width=100%  height=390px SRC="product-category-add.do"></iframe>
<div style="color:#FF0000">温馨提示：一级分类暂不支持删除</div>
<table class="table" border="1">
	<tr>
		<td width="5">ID</td>
		<td width="10">分类名称</td>
		<td width="10">父级ID</td>
		<td width="10">所属分类</td>
		<td width="10">操作</td>
	</tr>
	<c:forEach items="${level}" var="lev">
	<tr>
		<td id="id">${lev.id}</td>
		<td id="name">${lev.name}</td>
		<td id="parentId">${lev.parentId}</td>
		<td id="type">${lev.type}</td>
		<td>
			<button class="btn btn-primary radius" type="button" onClick="product_del(this,'${lev.id}','${lev.type}')"><i class="Hui-iconfont">&#xe632;</i>删除</button>
			<input type="button" value="编辑" style="width:80px;height:30px;border:1px;background-color:pink">
		</td>
	</tr>
	</c:forEach>
</table>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script> 
<script type="text/javascript">
$(function() {
	$("input:button").click(function() {
		var ids=null;
		var name=null;
		var parentId=null;
		var type=null;
		var bool = true;
		str=$(this).val()=="编辑"?"确定":"编辑";
		$(this).val(str);// 按钮被点击后，在“编辑”和“确定”之间切换
		$(this).parent().siblings("td").each(function() {// 获取当前行的其他单元格
			obj_text = $(this).find("input:text");    // 判断单元格下是否有文本框
			  if(!obj_text.length){
				// 如果没有文本框，则添加文本框使之可以编辑
	                $(this).html("<input id="+$(this).attr("id")+" type='text' value='"+$(this).text()+"'>"); 
			  }else{  // 如果已经存在文本框，则将其显示为文本框修改的值
				  if(obj_text.attr("id") == "type"){
					  if(!((/^[1-3]$/).test(obj_text.val()))){
						  bool = false;
							 {layer.msg('所属分类只能为1、2、3', {
									icon : 2,
									time : 2000
								});return false;}
					  }
					  if(obj_text.val()==""){
						  bool=false;
						  {layer.msg('所属分类不能为空！', {
								icon : 2,
								time : 2000
							});return false;}
					  }
	            }
			  	 if(obj_text.attr("id")=="parentId"){
				  if(!((/^[0-9]*$/).test(obj_text.val()))){
					  bool=false;
					  {layer.msg('父级ID只能为数字', {
							icon : 2,
							time : 2000
						});return false;}
				  }
				  if(obj_text.val()==""){
					  bool=false;
					  {layer.msg('父级ID不能为空！', {
							icon : 2,
							time : 2000
						});return false;}
				  }
				  
			  }
			  	 if(obj_text.attr("id")=="name"){
					  if(obj_text.val()==""){
						  bool=false;
						  {layer.msg('酒店名称不能为空！', {
								icon : 2,
								time : 2000
							});return false;}
					  }
				  }
	            if(obj_text.attr("id") == "id"){
	            	ids = obj_text.val()
	            }else if(obj_text.attr("id") == "name"){
	            	name = obj_text.val()
	            }else if(obj_text.attr("id") == "parentId"){
	            	parentId = obj_text.val()
	            }else if(obj_text.attr("id") == "type"){
	            	type = obj_text.val()
	            }
	        }	
		})
		 if(str=="编辑" && bool){
			 var url = "?id="+ids+"&name="+name+"&parentId="+parentId+"&type="+type;
			 location="product-updateLevel.do"+url;
		}
	});
});
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
				demoIframe.attr("src",treeNode.file + ".html");
				return true;
			}
		}
	}
};	
var code;
		
function showCode(str) {
	if (!code) code = $("#code");
	code.empty();
	code.append("<li>"+str+"</li>");
}
		
$(document).ready(function(){
	var t = $("#treeDemo");
	t = $.fn.zTree.init(t, setting, zNodes);
	demoIframe = $("#testIframe");
	//demoIframe.on("load", loadReady);
	var zTree = $.fn.zTree.getZTreeObj("tree");
	//zTree.selectNode(zTree.getNodeByParam("id",'11'));
});
/*分类-删除*/
function product_del(obj,id,type){
	if(type==1){
		{layer.msg('暂不支持删除一级分类！', {
			icon : 2,
			time : 2000
		});return false;}
	}
	layer.confirm('数据下的子级也会一并删除，确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'product-deleLevel.do',
			data : {
				id : id,
			},
			dataType: 'text',
			success: function(data){
				if(data>0){
					$(obj).parents("tr").remove();
					layer.msg('已删除!',{
						icon:1,
						time:2000
					});
					setTimeout(function(){
						location.reload();
					},1500);
				}else{
					layer.msg('删除失败!', {
						icon : 2,
						time : 2000
					});
				}
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
</script>
</body>
</html>