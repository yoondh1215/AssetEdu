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
<title><c:out value="${pageTitle}" default="계정과목-변경" /></title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />
</head>
<body>
<!-- =================================================== -->
<jsp:include page="../../common/header.jsp" flush="false" />
<!-- =================================================== -->
<c:set var="baseUrl" value="/jnl/acnt"/>
<main class="container mx-3 my-3">

	<h2><i class="fa-solid fa-cube my-3"></i> 계정과목 관리 > 계정과목 상세보기 및 정보수정</h2>
    <div class="border-top border-2 p-4">

        <form:form action="${baseUrl }/update" method="POST" modelAttribute="jnl10Acnt" class="validcheck" >
            <table  class="table table-sm table-borderless" >
                <tr class="align-middle">
                    <td class="text-end" style="width:150px">계정코드</td>
                    <td class="text-start"><form:input type="text" class="form-control" path="jnl10AcntCd" style="width:200px;background-color:#F0EEEE" readonly="true" /></td>
                </tr>
                 <tr class="align-middle">
					<td class="text-end">계정과목</td>
                    <td class="text-start"><form:input type="text" class="form-control" path="jnl10AcntNm" data-v-max-length="12" required="true" /></td>
                 </tr>
                <tr class="align-middle">
                    <td class="text-end">상위계정과목</td>
                    <td class="text-start">
					<div class="input-group">
					  <button class="btn btn-outline-secondary text-warning bg-secondary btnPopupParentCode" type="button" id="btnDisplayAcntPopup"><i class="fa-solid fa-search"></i></button>
					  <form:hidden path="jnl10ParentCd"  data-v-max-length="1" required="true"  />
					  <form:input type="text" path="jnl10ParentNm" class="form-control" style="background-color:#F0EEEE" readonly="true" />
					</div>                    
                    </td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">계정속성</td>
                    <td class="text-start">
                        <form:select path="jnl10AcntAttrCd" class="form-select w-25"  required="true">
                            <form:option value="" />
                            <form:options items="${acntAttrCodeList}" itemValue="com02DtlCd" itemLabel="com02CodeNm"/> 
                        </form:select>                    	
                    </td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">차대구분</td>
                    <td class="text-start">
                        <form:select path="jnl10DrcrType" class="form-select w-25" required="true">
                            <form:option value="" />
                            <form:options items="${drcrTypeList}" itemValue="com02DtlCd" itemLabel="com02CodeNm"/> 
                        </form:select>                    	                      
                     </td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end" height="45px">전표생성여부</td>
                    <td class="text-start">
                    	<c:choose>
                    		<c:when test="${jnl10Acnt.jnl10SlipYn == 'true' }">
					            <input type="radio" name="jnl10SlipYn" id="jnl10SlipYn11" value="true" checked /> <label for="jnl10SlipYn11"> 생성</label>&nbsp;
								<input type="radio" name="jnl10SlipYn" id="jnl10SlipYn22" value="false" /> <label for="jnl10SlipYn22"> 미생성</label>
                    		</c:when>
                    		<c:otherwise>
					            <input type="radio" name="jnl10SlipYn" id="jnl10SlipYn11" value="true" /> <label for="jnl10SlipYn11"> 생성</label>&nbsp;
								<input type="radio" name="jnl10SlipYn" id="jnl10SlipYn22" value="false" checked /> <label for="jnl10SlipYn22"> 미생성</label>                    		
                    		</c:otherwise>
                    	</c:choose>
                    </td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end" height="40px">사용여부</td>
                    <td class="text-start">
                    	<c:choose>
                    		<c:when test="${jnl10Acnt.jnl10UseYn == 'true'}">
			            <input type="radio" name="jnl10UseYn" id="jnl10UseYn11" value="true" checked /> <label for="jnl10UseYn11"> 사용함</label>&nbsp;
						<input type="radio" name="jnl10UseYn" id="jnl10UseYn22" value="false"/> <label for="jnl10UseYn22"> 사용안함</label>                    	
                    		</c:when>
                    		<c:otherwise>
			            <input type="radio" name="jnl10UseYn" id="jnl10UseYn11" value="true"  /> <label for="jnl10UseYn11"> 사용함</label>&nbsp;
						<input type="radio" name="jnl10UseYn" id="jnl10UseYn22" value="false" checked/> <label for="jnl10UseYn22"> 사용안함</label>                    	
                    		</c:otherwise>
                    	</c:choose>
                    </td>
                </tr>
            </table>
            
            <div class="row justify-content-md-center pt-5">
                <button type="submit" class="btn btn-primary w-25 mx-1">저장</button>
                <a href="${baseUrl}/list" class="btn btn-secondary w-25">취소, 리스트로 돌아감</a>
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
	})
	
    $('.btnPopupParentCode').on('click', function(){
        var url = '/popup/jnl/acnt/parent?acntCd=jnl10ParentCd&acntNm=jnl10ParentNm';
        var prop = {};
        var width = 720;
        var height = 518;
        var win = AssetUtil.popupWindow(url, '종목선택', {}, width, height);
        return false;
    });	
	
	//hidden변수 validcheck
	$('form').submit(function(){
		var cd = $('#jnl10ParentCd').val();
		if(!cd){
			alert("상위계정과목을 넣어주십시오");
			return false;
		}
	});

	
});

</script>
</body>
</html>