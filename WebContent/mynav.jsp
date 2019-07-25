<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="./js/jquery/2.0.0/jquery.min.js"></script>
<link href="./css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="./js/bootstrap/3.3.6/bootstrap.min.js"></script>
<style>
  .my-menu{
margin-top:0px;
background:rgba(84,255,159,0.1);
color:#fff !important;
}   
</style>
</head>
<body>
<img src="./img/3.jpg" class="img2"></img>


<nav class="navbar navbar-fixed-top my-navbar" role="navigation">
<div class="container-fluid">
            <div class="navbar-header xx">
                <a class="navbar-brand " href="index.jsp"><img src="./img/logo.png" class="img1"></img>成荫</a>
            </div>
            <div class="collapse navbar-collapse " id="example-navbar-collapse">
                <ul class="nav navbar-nav">
                <li class="active"><a href="#">首页</a></li>
                    <li class="dropdown">
		                <a class="dropdown-toggle" data-toggle="dropdown" href="#">人才智库 <span class="caret"></span>
		                </a>
		                     <ul class="dropdown-menu my-menu">
			                     <li><a href="findallC">赛事信息</a></li>
			                       <li><a href="SfindallC">校招信息</a></li>
			                          <li><a href="QfindallC">论坛讨论</a></li>
			                          <li><a href="JfindallC">人才展示</a></li>
			                           <li><a href="EfindallC">招聘展示</a></li>
			                             <%  
          
          if(session.getAttribute("hrid")!=null) {  %>  
             <li><a href="EmploymentSave.jsp">增加招聘</a></li><%} %>
             <%  
        
          if(session.getAttribute("admin")!=null){
         %>  
        <li> <a href="QuestionSave.jsp">提问</a></li>
         <% }%>
		                   </ul>
	              </li>
	               <li class="dropdown">
		                <a class="dropdown-toggle" data-toggle="dropdown" href="#">绿色建筑 <span class="caret"></span>
		                </a>
		                     <ul class="dropdown-menu my-menu">
			                      <li><a href="GfindallC">绿建信息</a></li>
			                          <li><a href="PfindallC">政策信息</a></li>

		                   </ul>
	              </li>
                 <li role="presentation"><a href="#">绿筑商城</a></li>
                   <%  
          String Maa="";
          if(session.getAttribute("admin")!=null)
             Maa = session.getAttribute("admintype").toString(); //从session里把a拿出来，并赋值给M 
    
            if(Maa.equals("管理员")){
         %>  
        <li role="presentation"><a href="AdministratorSave.jsp">添加管理员</a></li>
         <li class="dropdown">
		                <a class="dropdown-toggle" data-toggle="dropdown" href="#">添加 <span class="caret"></span>
		                </a>
		                     <ul class="dropdown-menu my-menu">
			                      <li><a href="ContestSave.jsp">添加赛事信息</a></li>
			                          <li><a href="PolicySave.jsp">添加政策信息</a></li>
			                            <li><a href="SchoolreSave.jsp">添加校招信息</a></li>
			                              <li><a href="GreenbuildSave.jsp">添加绿建信息</a></li>

		                   </ul>
	              </li>
         <% }%>
               <li role="presentation"><a></a></li>
               <li role="presentation"><a></a></li>
                  <%  
          String M="";
          if(session.getAttribute("admin")!=null)
          {  M = session.getAttribute("adminname").toString(); //从session里把a拿出来，并赋值给M %>  
           <li role="presentation" class="dlleft"><div class="dlm"><s:property value="#session.adminname"/>，欢迎你.</li>
           <li role="presentation" style="padding-left:20px;"><div class="dlm"><a href="tc">退出登陆</a></li><%} else {%>
                 <li role="presentation" class="dlleft"><a href="LoginChoose.jsp">登陆</a></li>
                 <li role="presentation" class=""><a href="RegisterChoose.jsp">注册</a></li><%} %>
                </ul>
            </div>
        </div>
</nav>

</body>
</html>