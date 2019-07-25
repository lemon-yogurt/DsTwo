<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<head>
<s:head theme="xhtml"/>
<sx:head parseContent="true" extraLocales="UTF-8"/> 

<script src="./js/jquery/2.0.0/jquery.min.js"></script>
<link href="./css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="./js/bootstrap/3.3.6/bootstrap.min.js"></script>

<link rel="stylesheet" href="./css/mynav.css" type="text/css">
<link rel="stylesheet" href="./css/secondnav.css" type="text/css">
<script src="./js/mynav.js"></script>

<style>
.forms{
  width:100%;
}
.sp{
font-size:15px;
}
.sp2{
 
 margin-left:333px;
  padding-left:0px;
}
.tt{
 width:100%;
}
.ss{
 width:100%;
}
.cw{
font-weight:800;color:red;
}
</style>


</head>
<body>

<%@include file="mynav.jsp" %>

 <h5>	<a href="index.jsp">首页</a>>>政策信息添加</h5>
       <hr class="simple" color="#6f5499" />
<div class="container">
  <div class="row">
    <div class="col-sm-3">
    </div>
    <div class="col-sm-6">
 <div class="cw">  <s:property value="#session.updatefail"/></div> 
<s:form action="Psave"  method="post" enctype="multipart/form-data" role="form" class="forms"> 
 
  <table class="ss">
      
         <tr><td class="sp">文章标题：</td><td class="sp2">
           <s:textfield name="policy.title" class="form-control" id="policy.title"  placeholder="请输入文章标题"/></td></tr>
           
  <tr class="tt"><td class="sp">文章内容：</td><td class="sp2">   
            <s:textfield name="policy.essay" class="form-control" id="schoolrepolicy.essay" placeholder="请输入文章内容"/></td></tr>
  
  <s:submit value="添加"  class="btn btn-default" style="width:100%;margin-top:20px;"/>
   </table> 
</s:form>
</div>
<div class="col-sm-3">
</div>
</div>
</div>


</body>
</html>