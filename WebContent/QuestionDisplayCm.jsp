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
<title>论坛讨论</title>
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
      <li class="text-center aa"><a href="QfindallC">论坛讨论</a></li>
      <li class="text-center"><a href="JfindallC">人才展示</a></li>
      <li class="text-center"><a href="EfindallC">招聘展示</a></li>
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
         <h5><a href="index.jsp">首页</a>>>论坛讨论</h5>
         <hr class="simple" color="#6f5499" />
         <s:iterator value="Questions" >
           <div class="hh">
             <a href="Cfindbyqid?a=<s:property value="id"/>">
               
                  <div class="row">
  
                     <div class="col-sm-8">
                       <s:property value="title"/>
                     </div  >
                     <div class="col-sm-2">
                        <img src="images/<s:property value="img"/>" style="width:100%;">
                    </div>
                    
                 </div>
             
         </a>
       </div>
         
         <hr class="simple" color="#6f5499" />
        </s:iterator>
         <%  
        
          if(session.getAttribute("admin")!=null){
         %>  
         <a href="QuestionSave.jsp" class="btn btn-danger" style="width:30%">提问</a>
         <% }%>
   </div>     
    </div>
    </div>
</body>
</html>