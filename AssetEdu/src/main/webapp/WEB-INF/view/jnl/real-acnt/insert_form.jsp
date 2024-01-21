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
<title><c:out value="${pageTitle}" default="실계정맵핑-등록" /></title>
</head>
<body>
<!-- =================================================== -->
<jsp:include page="../../common/header.jsp" flush="false" />
<!-- =================================================== -->
<c:set var="baseUrl" value="/jnl/real-acnt"/>
<main class="container mx-3 my-3">

	<h2><i class="fa-solid fa-cube my-3"></i> 실계정맵핑 관리 > 실계정맵핑 등록</h2>
    <div class="border-top border-2 p-4"></div>
    <form:form action="${baseUrl }/insert" method="POST" modelAttribute="jnl14RealAcntMap" class="validcheck" >
    <div class="row">
    	<div class="col-8">
            <table  class="table table-sm table-borderless" >
                <tr class="align-middle">
                    <td class="text-end" style="width:150px">대표계정코드</td>
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
                <a href="${baseUrl }/list" class="btn btn-secondary w-25">취소, 리스트로 돌아감</a>
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
    //대표계정코드 팝업
	$('#btnPopupJnl14ReprAcntCd').on('click', function(){
        var url = '/popup/jnl/repr-acnt?openerCdId=jnl14ReprAcntCd&openerNmId=jnl14ReprAcntNm';
        var prop = {};
        var width = 720;
        var height = 518;
        var win = AssetUtil.popupWindow(url, '실계정과목 선택', {}, width, height);
        return false;	
	});
	//실계정과목 팝업
	$('#btnPopupJnl14RealAcntCd').on('click', function(){
        var url = '/popup/jnl/acnt/child?acntCd=jnl14RealAcntCd&acntNm=jnl14RealAcntNm';
        var prop = {};
        var width = 720;
        var height = 518;
        var win = AssetUtil.popupWindow(url, '대표계정코드 선택', {}, width, height);
        return false;	
	});
	$('form').submit(function(){
		var cd = $('#jnl14ReprAcntCd').val();
		if(!cd){
			alert("대표계정코드를 넣어주십시오");
			return false;
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