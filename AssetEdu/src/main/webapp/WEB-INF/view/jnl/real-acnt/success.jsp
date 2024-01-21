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
<jsp:include page="../../common/meta_css.jsp" flush="false" />
<!-- =================================================== -->
<title><c:out value="${pageTitle}" default="Acnt Add Success" /></title>
</head>
<body>
<!-- =================================================== -->
<jsp:include page="../../common/header.jsp" flush="false" />
<!-- =================================================== -->
<c:set var="baseUrl" value="/jnl/real-acnt"/>
<main class="container mx-3 my-3">

    <c:if test="${mode eq 'insert'}">
	   <h2><i class="fa-solid fa-cube my-3"></i> 실계정맵핑 관리 > 실계정맵핑 등록 Success</h2>
	</c:if>
    <c:if test="${mode eq 'update'}">
       <h2><i class="fa-solid fa-cube my-3"></i> 실계정맵핑 관리 > 실계정맵핑 수정 Success</h2>
    </c:if>
    
	<div class="border-top border-2 p-4">
		<div class="text-left py-5">
            <c:if test="${mode eq 'insert'}">
			     <h1>실계정맵핑이 등록되었습니다.</h1><br>
            </c:if>
            <c:if test="${mode eq 'update'}">
                 <h1>실계정맵핑이 수정되었습니다.</h1><br>
            </c:if>
            <p class="px-4">· 대표계정 : ${realAcntMap.jnl14ReprAcntCd} ${realAcntMap.jnl14ReprAcntNm}</p>
            <p class="px-4">· 상장구분 : ${realAcntMap.jnl14ListTypeNm}</p>
            <p class="px-4">· 시장구분 : ${realAcntMap.jnl14MarketTypeNm}</p>
            <p class="px-4">· 계정과목 : ${realAcntMap.jnl14RealAcntCd} ${realAcntMap.jnl14RealAcntNm}</p>
		</div>
		
		<div>
			<table>
				<tr>
					<td>
						<a href="<c:url value='${baseUrl }/list '/>" class="btn btn-primary">리스트</a>
					</td>
					<td>
						<c:if test="${mode eq 'insert'}">
							<a href="${baseUrl }/insert" class="btn btn-warning">계속입력</a>
						</c:if>
						<c:if test="${mode eq 'update'}">
							<form id="form1" method="GET" action="${baseUrl }/update">
								<input type="hidden" name="jnl14ReprAcntCd" value="${realAcntMap.jnl14ReprAcntCd }"/>
								<input type="hidden" name="jnl14ListType" value="${realAcntMap.jnl14ListType }"/>
								<input type="hidden" name="jnl14MarketType" value="${realAcntMap.jnl14MarketType }"/>
								<input type="hidden" name="jnl14RealAcntCd" value="${realAcntMap.jnl14RealAcntCd }"/>
								<button type="submit" class="btn btn-warning">계속수정</button>
							</form>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	</div>
</main>
<!-- =================================================== -->
<jsp:include page="../../common/footer.jsp" flush="false" />
<!-- -================================================== -->
<script>
$(document).ready(function () {
	console.log('ready...');
});
</script>	
</body>
</html>