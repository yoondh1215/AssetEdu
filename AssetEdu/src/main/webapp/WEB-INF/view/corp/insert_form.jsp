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
<jsp:include page="../common/meta_css.jsp" flush="false" />
<!-- =================================================== -->
<title><c:out value="${pageTitle}" default="기관정보-등록" /></title>
</head>
<body>
<!-- =================================================== -->
<jsp:include page="../common/header.jsp" flush="false" />
<!-- =================================================== -->
<main class="container mx-3 my-3">

	<h2><i class="fa-solid fa-cube my-3"></i> 기관정보관리 > 기관정보등록</h2>
    <div class="border-top border-2 p-4">

        <form:form action="/corp/insert" method="POST" modelAttribute="corp" class="validcheck" >
            <table class="table table-sm table-borderless">
                <tr class="align-middle">
                    <td class="text-end" style="width:130px">기관코드</td>
                    <td><form:input type="text" class="form-control w-25" path="com01CorpCd" data-v-max-length="5" data-v-min-length="5" required="true" /></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">기관한글명</td>
                    <td><form:input type="text" class="form-control" path="com01CorpNm" data-v-max-length="100" required="true" /></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">기관영문명</td>
                    <td><form:input type="text" class="form-control" path="com01CorpEnm" data-v-max-length="100" /></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">기관구분</td>
                    <td>
                        <form:select path="com01CorpType" class="form-select w-25">
                            <form:options items="${corpTypeList}" itemValue="com02DtlCd" itemLabel="com02CodeNm"/> 
                        </form:select>
                    </td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">대외기관코드</td>
                    <td><form:input type="text" class="form-control w-25" path="com01ExtnCorpCd" /></td>
                </tr>
            </table>
            
            <kfs:DisplayErrors modelAttribute="corp"/>
            
            <div class="row justify-content-md-center pt-5">
                <button type="submit" class="col col-lg-2 btn btn-primary">저장</button>
                &nbsp;
                <a href="/corp/list" class="col col-lg-2 btn btn-secondary">취소, 리스트로 돌아감</a>
            </div>

        </form:form>

    </div>
</main>
<!-- =================================================== -->
<jsp:include page="../common/footer.jsp" flush="false" />
<!-- -================================================== -->
<script>
$(document).ready(function () {
	//validation
    let validator = $('form.validcheck').jbvalidator({
        language: '/js/validation/lang/ko.json'
    });
    //첫번째 입력에 focus를 준다
    $("form input:text").first().focus();
	//form 안의 inputdp Enter key submit방지
	$('form input').on('keydown', function(e){
		if(e.keyCode == 13){
			e.preventDefault();
		}
	})
});
</script>
</body>
</html>