<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
height:50px;
}
.ss{
 width:100%;

 margin-top:20px;
 padding:10px;

}
.hh4{
font-weight:900;
color:grey;
}
.hx{
height:1px;
width:100%;
border:1px solid grey;
 -webkit-box-shadow:2px 2px 10px grey;
  -moz-box-shadow:2px 2px 10px grey;
  box-shadow:2px 2px 10px grey;}
  .cw{
font-weight:800;color:red;
}
</style>

</head>
<body>

<%@include file="mynav.jsp" %>
  <h5>	<a href="index.jsp">首页</a>>>注册</h5>
       <hr class="simple" color="#6f5499" />
<div class="container">
  <div class="row">
    <div class="col-sm-3">
    </div>
   
    <div class="col-sm-6">
    <div class="cw">  <s:property value="#session.registerfail"/></div> 
<s:form action="Esave"  method="post" enctype="multipart/form-data" role="form" class="forms"> 

  <table class="ss">
     <tr class="tt"><td class="sp">工作名称：</td><td class="sp2">   
            <s:textfield name="employment.workname" class="form-control" id="employment.workname" placeholder="请输入工作名称"/></td></tr>
       
     <tr class="tt">  <td><h4 class="hh4">工作要求</h4></td> </tr>
     <tr><td><div class="hx"></div></td><td><div class="hx"></div></td><td><div class="hx"></div></td></tr>
    <tr class="tt">  
                         <td class="sp">工作地点：</td>
                         <td class="sp2">    <s:textfield name="employment.position" class="form-control" id="employment.position" placeholder="请输入工作地点"/>
                         </td></tr>
      
         <tr class="tt"><td class="sp">工作经验要求：</td><td class="sp2">
           <s:textfield name="jobseeker.worktime" class="form-control" id="jobseeker.worktime"  placeholder="请输入工作经验要求"/></td></tr>
           
         <tr class="tt"><td class="sp">学历：</td><td class="sp2">   
            <s:textfield name="employment.education" class="form-control" id="employment.education" placeholder="请输入学历要求"/></td></tr>
       
        <tr class="tt"><td class="sp">工作薪资：</td><td class="sp2">   
           <s:textfield name="employment.paymin" class="form-control" id="employment.paymin" placeholder="请输入最少工资"/> <s:textfield name="employment.paymax" class="form-control" id="employment.paymax" placeholder="请输入最多工资"/></td></tr>
           
          <tr class="tt"><td class="sp">年龄：</td><td class="sp2">   
            <s:textfield name="employment.agemin" class="form-control" id="employment.agemin" placeholder="请输入最小年龄"/>
             <s:textfield name="employment.agemax" class="form-control" id="employment.agemax" placeholder="请输入最大年龄"/></td></tr>
          
          <tr class="tt"><td class="sp">工作责任：</td><td class="sp2">  
              <s:textfield name="employment.workduty" class="form-control" id="employment.workduty" placeholder="请输入工作责任要求"/></td></tr>
       
           <tr class="tt"><td class="sp">工作具体要求：</td><td class="sp2">   
           <s:textfield name="employment.workrequire" class="form-control" id="jobseeker.workrequire" placeholder="请输入具体要求"/></td></tr>
           
            <tr class="tt"><td class="sp">工作优势：</td><td class="sp2">   
           <s:textfield name="employment.workad" class="form-control" id="employment.workad" placeholder="请输入优势"/></td></tr>
           
           </table>
  
  <table class="ss">
  
  
       <tr class="tt">  <td><h4 class="hh4">公司介绍</h4></td> </tr>
     <tr><td><div class="hx"></div></td><td><div class="hx"></div></td><td><div class="hx"></div></td></tr>             
       <tr class="tt"><td class="sp">公司名字：</td><td class="sp2">    
            <s:textfield name="employment.companyname" class="form-control" id="employment.companyname" placeholder="请输入公司名字"/></td></tr>
        <tr class="tt"><td class="sp">公司地址：</td><td class="sp2">    
            <s:textfield name="employment.workpalce" class="form-control" id="employment.workpalce" placeholder="请输入教公司地址"/></td></tr>
                 
            <tr class="tt"><td class="sp">公司描述：</td><td class="sp2">   
           <s:textfield name="employment.companydescription" class="form-control" id="employment.companydescription" placeholder="请输入公司描述"/></td></tr>
           
        
  
  <s:submit value="注册"  class="btn btn-default" style="width:100%;margin-top:20px;"/>
   </table> 
</s:form>
</div>
<div class="col-sm-3">
</div>
</div>
</div>
</body>
</html>