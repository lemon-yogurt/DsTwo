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

<link rel="stylesheet" href="./css/mynav.css" type="text/css">
<link rel="stylesheet" href="./css/secondnav.css" type="text/css">
<script src="./js/mynav.js"></script>

<style>
.my-menu{
margin-top:0px;
background:rgba(84,255,159,0.1);
color:#fff !important;
}
.img3{
width:30%;
}

.bl{
margin-top:60px;
margin-bottom:20px;
}
.hh{
transition:transform 0.1s;
}
.hh:hover{
cursor:pointer;
transform:translate(0,-10px);
text-decoration: none;
background-color:#F5F5F5;

}
a:focus {
  text-decoration: none;
}
.xs{
margin-top:30px;
}
.lifir{
backgrond-color:black;
}
.aa{
background:rgba(150,205,205,0.4)
;
}
.limg{
width:40%;
}
.rmes{

}
.rrb{
color:black;
font-size:18px;
padding-top:35px;
}
.cl{
color:#FFD700;
}
.xx{
width:100%;
}
.xm{
color:black;
font-size:20px;
font-weight:800;
}
.zt{
padding-left:10px;
color:#696969;
font-size:14px;
}
.bzt{
color:grey;
}
</style>
<title>人才信息展示</title>
</head>
<body>


<%@include file="mynav.jsp" %>


<div class="container xs">
  <div class="row">
  
     <div class="col-sm-3">
      <ul class="nav nav-pills nav-stacked my">
      <li class="active text-center"> <a><strong><h4>栏目导航</h4></strong></a></li>      
      <li class="text-center"><a href="findallC">赛事信息</a></li>
      <li class="text-center"><a href="SfindallC">校招信息</a></li>
      <li class="text-center"><a href="QfindallC">论坛讨论</a></li>
      <li class="text-center"><a href="JfindallC">人才展示</a></li>
      <li class="text-center aa"><a href="EfindallC">招聘展示</a></li>
      <hr class="simple hr1" color="#6f5499" />
      </ul>
     </div>
     
     <div class="col-sm-1">
     <div style="background: #ddd;margin-top:10px;
     width:1px;
            height: 600px;
            border-right: 1px solid #CFCFCF;"></div>
     </div>
     
      <div class="col-sm-8">
       <s:form action="EfindbyEverything"  method="post" enctype="multipart/form-data" role="form" class="forms" > 
           <table class="ss">         
              <tr class="tt"><td class="sp2">   
              <s:textfield name="employment.ss" class="form-control" id="employment.ss" placeholder="请输入搜索内容" style="width:500px;"/></td></tr> 
              
              <s:submit value="搜索"  class="btn btn-default" style="width:30%;margin-top:20px;background:#90EE90;" />
           </table> 
        </s:form>
         <h5><a href="index.jsp">首页</a>>>招聘展示</h5>
         <hr class="simple" color="#6f5499" />
         <s:iterator value="employments" >
           <div class="hh">
             <a href="Efindbyid?a=<s:property value="id"/>">
               
                  <div class="row">
  
          
                     <div class="col-sm-8">
                       
                          <span class="xm">  <s:property value="workname" /> </span>
                          <div class=""> 
                          <span>  <s:property value="paymin" />~<s:property value="paymax"/> </span>
                          <span class="zt"> <s:property value="worktime" />年经验以上 | 
                            <s:property value="education"/>年经验 |
                            <s:property value="workpalce"/>
                            </span>
                          </div>
                          <div> <s:property value="agemin"/>~<s:property value="agemax"/>岁</div>
             
                    </div>
                    <div class="col-sm-4">
                            
                       <div class="bzt"><s:property value="companyname"/></div>
                       <div class="bzt">公司描述：<s:property value="companydescription"/></div>
                    </div>
                 </div>
             
         </a>
       </div>
          <%  
          String Ma="";
          if(session.getAttribute("admin")!=null)
             Ma = session.getAttribute("admintype").toString(); //从session里把a拿出来，并赋值给M 
    
            if(Ma.equals("管理员")){
         %>  
         <a href="Jdelete?a=<s:property value="id"/>" class="btn btn-danger" style="width:30%">删除</a>
         <% }%>
         <hr class="simple" color="#6f5499" />
        </s:iterator>
   </div>     
    </div>
    </div>
</body>
</html>