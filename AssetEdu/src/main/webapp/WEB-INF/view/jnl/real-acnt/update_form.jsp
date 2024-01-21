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
<title><c:out value="${pageTitle}" default="실계정맵핑-변경" /></title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />
</head>
<body>
<!-- =================================================== -->
<jsp:include page="../../common/header.jsp" flush="false" />
<!-- =================================================== -->
<c:set var="baseUrl" value="/jnl/real-acnt"/>
<main class="container mx-3 my-3">

	<h2><i class="fa-solid fa-cube my-3"></i> 실계정맵핑 관리 > 실계정맵핑 정보 상세보기 및 수정</h2>
    <div class="border-top border-2 p-4"></div>
	<form:form action="${baseUrl }/update" method="POST" modelAttribute="jnl14RealAcntMap" class="validcheck" >
	<!-- 	기존 KeyValue -->
	<form:hidden path="jnl14ReprAcntCdOld"/> 
	<form:hidden path="jnl14ListTypeOld"/> 
	<form:hidden path="jnl14MarketTypeOld"/> 
    <div class="row">
    	<div class="col-8">            
            <table class="table table-sm table-borderless">
                <tr class="align-middle">
                    <td class="text-end">대표계정코드</td>
                    <td class="text-start">
						<div class="input-group  w-75">
                          <kfs:CodePopup btnId="btnPopupJnl14ReprAcntCd" codeId="jnl14ReprAcntCd" nameId="jnl14ReprAcntNm" />
						</div>                     	
                    </td>
                </tr>
                 <tr class="align-middle">
					<td class="text-end">상장구분</td>
                    <td class="text-start">
                        <form:select path="jnl14ListType" class="form-select w-25" required="true">
                            <form:option value="" />
                            <form:options items="${listTypeList}" itemValue="com02DtlCd" itemLabel="com02CodeNm"/> 
                        </form:select>  
                        <form:hidden path="jnl14ListTypeNm"/>                     
                    </td>
                 </tr>
                <tr class="align-middle">
                    <td class="text-end">시장구분</td>
                    <td class="text-start" style="width:80%">
                        <form:select path="jnl14MarketType" class="form-select w-25" required="true">
                            <form:option value="" />
                            <form:options items="${marketTypeList}" itemValue="com02DtlCd" itemLabel="com02CodeNm"/> 
                        </form:select>           
                        <form:hidden path="jnl14MarketTypeNm"/>                     
                    </td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">실계정과목</td>
                    <td class="text-start" style="width:300px">
						<div class="input-group w-75">
						  <kfs:CodePopup btnId="btnPopupJnl14RealAcntCd" codeId="jnl14RealAcntCd" nameId="jnl14RealAcntNm" />
						</div>                     	
                    </td>
                </tr>
            </table>
        </div>
        <div class="col-4"></div>
     </div>   

     <!-- 오류메세지 표시부분  -->
     <div class="row">
        <div class="col-8">
            <kfs:DisplayErrors modelAttribute="jnl14RealAcntMap"/>
        </div>
     </div>

     <div class="row pt-5">
     	<div class="col-8 d-flex justify-content-center">
           <button type="submit" class="btn btn-primary w-25 mx-1">저장</button>
           <a href="${baseUrl}/list" class="btn btn-secondary w-25">취소, 리스트로 돌아감</a>
        </div>   
        <div class="col-4"></div>
      </div>
     </form:form>
</main>
<!-- =================================================== -->
<jsp:include page="../../common/footer.jsp" flush="false" />
<!-- -================================================== -->
<script type="text/javascript" src="/js/input-format.js"></script>
<script>
$(document).ready(function () {
	console.log("계정과목 update");
	//validation
    let validator = $('form.validcheck').jbvalidator({
        language: '/js/validation/lang/ko.json'
    });
	
	//form 안의 inputdp Enter key submit방지
	$('form input').on('keydown', function(e){
		if(e.keyCode == 13){
			e.preventDefault();
		}
	});

    //상장구분
    $('#jnl14ListType').on('change', function(){
        var listTypeNm = $("select[name=jnl14ListType] option:selected").text();
        $("#jnl14ListTypeNm").val(listTypeNm);
    });

    //시장구분
    $('#jnl14MarketType').on('change', function(){
        var marketypeNm = $("select[name=jnl14MarketType] option:selected").text();
        $("#jnl14MarketTypeNm").val(marketypeNm);
    });
	
});

</script>
</body>
</html>