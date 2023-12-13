<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ attribute name="modelAttribute" required="true" %>
<%@ attribute name="cssName" required="false" %>
<spring:hasBindErrors name="${modelAttribute }">
<!-- 	<div style="color: #000;background-color: #ffEEEE;border: 3px solid #ff0000;padding: 8px;margin: 16px;"> -->
    <c:if test="${empty cssName }">
<%--         <c:set var="cssName" value="form-control p-3 mt-5 mx-3 text-danger border-danger"/> --%>
        <c:set var="cssName" value="alert alert-danger p-3 mt-5 mx-3"/>
     </c:if>   
    <div class="${cssName }">
	<ul>
		<c:forEach var="error" items="${errors.allErrors}">
       	<li><spring:message message="${error}" /></li>
       </c:forEach>
   </ul>
   </div>    
</spring:hasBindErrors>

