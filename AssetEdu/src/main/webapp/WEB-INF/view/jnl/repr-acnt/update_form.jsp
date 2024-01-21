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
<title><c:out value="${pageTitle}" default="대표계정코드-변경" /></title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />
</head>
<body>
<!-- =================================================== -->
<jsp:include page="../../common/header.jsp" flush="false" />
<!-- =================================================== -->
<c:set var="baseUrl" value="/jnl/repr-acnt"/>
<main class="container mx-3 my-3">

	<h2><i class="fa-solid fa-cube my-3"></i> 대표계정코드 관리 > 대표계정코드 상세보기 및 정보수정</h2>
    <div class="border-top border-2 p-4">
        <form:form action="${baseUrl }/update" method="POST" modelAttribute="jnl11ReprAcnt" class="validcheck" >
			<div class="row">
				<div class="col-8">
		            <table class="table table-sm table-borderless">
		                 <tr class="align-middle">
							<td class="text-end" style="width:150px">대표계정코드</td>
		                    <td class="text-start">
		                    	<form:input type="text" class="form-control w-25" path="jnl11ReprAcntCd" style="background-color:#F0EEEE" readonly="true" />
		                    </td>
		                 </tr>
		                <tr class="align-middle">
		                    <td class="text-end">대표계정명</td>
		                    <td class="text-start"><form:input type="text" class="form-control" path="jnl11ReprAcntNm" data-v-max-length="100" required="true" /></td>
		                </tr>
		                <tr class="align-middle">
		                    <td class="text-end">계정속성</td>
		                    <td class="text-start">
		                       <form:select path="jnl11AcntAttributeCd" class="form-select w-25"  required="true">
		                            <form:option value="" />
		                            <form:options items="${acntAttrCodeList}" itemValue="com02DtlCd" itemLabel="com02CodeNm"/> 
		                        </form:select>                       
		                    </td>
		                </tr>
		                <tr class="align-middle">
		                    <td class="text-end">상대 대표계정코드</td>
		                    <td class="text-start">
							<div class="input-group">
							  <button class="btn btn-outline-secondary text-warning bg-secondary btnPopupParentCode" type="button" id="btnDisplayAcntPopup"><i class="fa-solid fa-search"></i></button>
							  <form:hidden path="jnl11TgtReprAcntCd"  required="true"  />
							  <form:input type="text" path="jnl11TgtReprAcntNm" class="form-control" style="background-color:#F0EEEE" readonly="true" />
							</div>                      	
		                    </td>
		                </tr>
		            </table>
	            </div>
	            <div class="col-4"></div>
            </div>

            <div class="row  pt-5">
            	<div class="col-8 d-flex justify-content-center">
	                <button type="submit" class="btn btn-primary w-25 mx-1">저장</button>
	                <a href="${baseUrl}/list" class="btn btn-secondary w-25">취소, 리스트로 돌아감</a>
                </div>
                <div class="col-4"></div>
            </div>
        </form:form>

    </div>
</main>
<!-- =================================================== -->
<jsp:include page="../../common/footer.jsp" flush="false" />
<!-- -================================================== -->
<script type="text/javascript" src="/js/input-format.js"></script>
<script>
$(document).ready(function () {
	console.log("대표계정코드 update");
	//validation
    let validator = $('form.validcheck').jbvalidator({
        language: '/js/validation/lang/ko.json'
    });
	
	//form 안의 inputdp Enter key submit방지
	$('form input').on('keydown', function(e){
		if(e.keyCode == 13){
			e.preventDefault();
		}
	})
	//상대 대표계정코드 팝업
    $('.btnPopupParentCode').on('click', function(){
        var url = '/popup/jnl/repr-acnt?openerCdId=jnl11TgtReprAcntCd&openerNmId=jnl11TgtReprAcntNm';
        var prop = "";
        var width = 720;
        var height = 518;
        var win = AssetUtil.popupWindow(url, '상대 대표계정코드', prop , width, height);
        return false;
    });		
});

</script>
</body>
</html>