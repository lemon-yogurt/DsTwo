<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<head>
<s:head theme="xhtml"/>
<sx:head parseContent="true" extraLocales="UTF-8"/> 
</head>
<body>
<form action="Gdelete" method="post">
<table border=1>
<tr>
<th>复选框</th>
<th>标题</th>
<th>材料名称</th>
<th>图片</th>
<th>文章</th>
<th>发布日期</th>
<th>修改</th>
</tr>
<s:iterator value="greenbuilds" >
<tr>
<td><input type="checkbox" name="checkid" value="<s:property value="id"/>"/> </td>
<td><s:property value="title" /></td>
<td><s:property value="materialname" /></td>
<td><img src="images/<s:property value="img"/>" style="width:100px;s"></td>
<td><s:property value="essay" /></td>
<td><s:property value="date"/></td>
<td><a href="./Gupdatefind?a=<s:property value="id"/>">修改</a></td>
</tr>
</s:iterator>
</table>
<s:submit value="删除"/>
  <s:reset value="重置"/>
</form>
</body>
</html>