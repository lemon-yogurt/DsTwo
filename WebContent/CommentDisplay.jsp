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
.xmi{
color:grey;
}
.ss{
padding-left:10%;
}
.plq{
margin-left:6%;
}
.tjplq{
padding-left:6%;
}
</style>
<title>论坛讨论</title>
</head>
<body>


<%@include file="mynav.jsp" %>
  <h5><a href="index.jsp">首页</a>>>论坛讨论</h5>
         <hr class="simple" color="#6f5499" />
<div class="container xs">
               
                  <div class="row">
  
                     <div class="col-sm-8">
                     <div class="xm"> <s:property value="#session.title"/></div>
                     <s:property value="#session.des"/>
                     
                     </div  >
                     <div class="col-sm-2">
                      <div class="xx"> <img src="images/<s:property value="#session.img"/>" style="width:100%;"></div>
                    </div>
                   
  
                 </div>
             </div>
             
  <hr class="simple" color="#6f5499" />
  <div class="tjplq">
    <% if(session.getAttribute("admin")!=null){ %>  
        <s:form action="Cmsave"  method="post" enctype="multipart/form-data" role="form" class="forms"> 
         <table class="ss">
           <tr class="tt"><td class="sp">添加评论：</td><td class="sp2">    <s:textfield name="comment.comment" class="form-control" id="comment.comment" placeholder="请输入评论"/>
                </td></tr>
      
          <s:submit value="评论"  class="btn btn-default" style="width:100%;margin-top:20px;"/>
        </table> 
       </s:form>
    <% }%>     
 <hr class="simple" color="#6f5499" />    
       </div>
    <div class="plq">  
       
         <s:iterator value="comments" >
         
         
                    <s:set name="fb" value="humanid" scope="request"/>
                    <s:set name="sb" value="humantype" scope="request"/>
                    
                    
             <% 
                       if(request.getAttribute("sb").equals("人才")){%>
                        <a href="Jfindbyid?a=<s:property value="humanid"/>"> <div class="xmi"> id：<s:property value="humanname"/></div></a>  
                          
                        <%}else if(request.getAttribute("sb").equals("hr")){%>
                        <a href="Hfindbyid?a=<s:property value="humanid"/>"> <div class="xmi">id： <s:property value="humanname"/></div></a>    
                        
                        <%}else if(request.getAttribute("sb").equals("学生")){%> 
                         <a href="Sfindbyid?a=<s:property value="humanid"/>"> <div class="xmi">id: <s:property value="humanname"/></div></a> <%} %>
                    
                    
                   
                    <div class="xm"> <s:property value="comment"/></div>
                    
                   
                     <% if(session.getAttribute("admin")!=null){ 
                       if(request.getAttribute("fb").equals(session.getAttribute("adminid"))&&request.getAttribute("sb").equals(session.getAttribute("admintype"))){%>
                        <a href="Cmdelete?a=<s:property value="id"/>" class="btn btn-danger" style="width:15%">删除</a>    <%} }%>   
                  
                <hr class="simple" color="#6f5499" />
        </s:iterator>
    </div>     
</body>
</html>