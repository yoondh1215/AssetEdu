<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="kfs" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="asset"  uri="/WEB-INF/asset-tags/asset.tld"%>
    
<!DOCTYPE html>
<html>
<head>
<!-- =================================================== -->
<jsp:include page="../common/meta_css.jsp" flush="false" />
<!-- =================================================== -->
<title><c:out value="${pageTitle}" default="Buy Success" /></title>
</head>
<body>
<!-- =================================================== -->
<jsp:include page="../common/header.jsp" flush="false" />
<!-- =================================================== -->
<main class="container mx-3 my-3">

	<h2><i class="fa-solid fa-cube my-3"></i> 주식매수 거래내역 > 매수처리/취소</h2>
	
	<div class="border-top border-2 p-4">

		<div class="text-left py-5">
			<h1>${msg}</h1>
		</div>
		<div>
			<table>
			<tr>
			<td>
				<a href="<c:url value='/opr/buy_list '/>" class="btn btn-primary">리스트</a>
			</td>
			<td>
				<c:if test="${mode eq 'insert'}">
					<a href="/opr/buy_insert" class="btn btn-warning">계속입력</a>
				</c:if>
			</td>
			</tr>
			</table>
		</div>
	</div>
</main>
<!-- =================================================== -->
<jsp:include page="../common/footer.jsp" flush="false" />
<!-- -================================================== -->
<script>
$(document).ready(function () {
	console.log('ready...');
});
</script>	
</body>
</html>