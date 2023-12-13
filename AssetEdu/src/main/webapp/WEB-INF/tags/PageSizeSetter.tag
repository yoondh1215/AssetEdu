<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ attribute name="id" required="false" %>
<%@ attribute name="pageAttr" type="kr.co.kfs.assetedu.model.PageAttr"  required="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="<%=new int[]{5,10,15,20,30,100} %>" />
한페이지당 갯수:
<select id="${id }"  class="select" style="vertical-align:middle;">
	<c:forEach var="item" items="${list}">
	 	<option value="${item}" ${item == pageAttr.pageSize ? 'selected' : ''}>${item}</option>
	</c:forEach>
</select>

