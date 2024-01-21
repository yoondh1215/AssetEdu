<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"    uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="asset" uri="/WEB-INF/asset-tags/asset.tld"%>
<%@ taglib prefix="kfs"   tagdir="/WEB-INF/tags"%>
    
<!DOCTYPE html>
<html>
<head>
<!-- =================================================== -->
<jsp:include page="../../common/meta_css.jsp" flush="false" />
<!-- =================================================== -->
<title><c:out value="${pageTitle}" default="사용자수정" /></title>
</head>
<body>
<!-- =================================================== -->
<jsp:include page="../../common/header.jsp" flush="false" />
<!-- =================================================== -->
<main class="container mx-3 my-3">

	<h2><i class="fa-solid fa-cube my-3"></i> USER LIST > USER MODIFY</h2>
	<div class="border-top border-2 p-4">

		<form:form action="/admin/user/update" method="POST" modelAttribute="user" class="validcheck" >
		  <div class="mb-3">
		    <form:label for="sys01UserId" class="form-label" path="sys01UserId">사용자Id</form:label>
		    <form:input type="text" class="form-control bg-light"  path="sys01UserId" readonly="true"/>
		  </div>
		  <div class="mb-3">
		    <form:label for="sys01UserNm" class="form-label"  path="sys01UserNm">사용자명</form:label>
		    <form:input type="text" class="form-control" path="sys01UserNm" placeholder="사용자명 입력" required="true" />
		  </div>
		  
		  <div class="mb-3">
		    <form:label for="sys01Tel" class="form-label"  path="sys01Tel">사용자 전화번호</form:label>
		    <form:input type="text" class="form-control" path="sys01Tel" placeholder="사용자전화번호 입력" required="true" />
		  </div>
		  <div class="mb-3">
		    <form:label for="sys01Email" class="form-label"  path="sys01Email">사용자이메일</form:label>
		    <form:input type="text" class="form-control" path="sys01Email" placeholder="이메일 입력" required="true" />
		  </div>
		  
		  
		  <div class="mb-3">
		    <form:label for="sys01Pwd" class="form-label" path="sys01Pwd">Password</form:label>
		    <form:password class="form-control" path="sys01Pwd" showPassword="false" required="true" data-v-min-length="4" />
		  </div>
		  <div class="mb-3">
		    <label for="sys01UserPwd2" class="form-label">Password 확인</label>
		    <input type="password" class="form-control" id="sys01Pwd2" name="sys01Pwd2" required data-v-equal="#sys01Pwd" />
		  </div>    
		  <button type="submit" class="btn btn-primary">저장</button>
		  <a href="★★★[수정]★★★" class="btn btn-secondary">취소, 리스트로 돌아감</a>
		</form:form>

	</div>
</main>
<!-- =================================================== -->
<jsp:include page="../../common/footer.jsp" flush="false" />
<!-- -================================================== -->
<script>
$(document).ready(function () {
    let validator = $('form.validcheck').jbvalidator({
        language: '/js/validation/lang/ko.json'
    });
});
</script>	
</body>
</html>