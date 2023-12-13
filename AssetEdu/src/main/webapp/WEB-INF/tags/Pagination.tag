<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ attribute name="id" required="true" %>
<%@ attribute name="pageAttr" type="kr.co.kfs.assetedu.model.PageAttr"  required="true" %>
<%@ attribute name="functionName" required="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty functionName}" >
	<c:set var="functionName" value="goPageClick" />
</c:if>
<c:if test="${pageAttr.totalPageCount > 1}">
	<nav aria-label="Page navigation example">
	  <ul id=${id } class="pagination">
	  	<c:if test="${pageAttr.isExistPrevPageNumber }">
	    	<li class="page-item"><a class="page-link" href="#">Previous</a></li>
	    </c:if>
	    
		<c:forEach var="i" begin="${pageAttr.startPageNumber }" end="${pageAttr.endPageNumber }" step="1">
			<c:choose>
				<c:when test="${i == pageAttr.currentPageNumber}">
					<li class="page-item"><a class="page-link active" href="#">${i}</a></li> 
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="javascript:${functionName }(${i })">${i}</a></li>
				</c:otherwise>
			</c:choose>
			
		</c:forEach>
	    <c:if test="${pageAttr.isExistNextPageNumber }">
	    	<li class="page-item"><a class="page-link" href="#">Next</a></li>
	    </c:if>
	  </ul>
	</nav>
</c:if>	