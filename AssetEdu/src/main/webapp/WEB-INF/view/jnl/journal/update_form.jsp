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
<title><c:out value="${pageTitle}" default="펀드정보 상세보기 및 변경" /></title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />
</head>
<body>
<!-- =================================================== -->
<jsp:include page="../../common/header.jsp" flush="false" />
<!-- =================================================== -->
<main class="container mx-3 my-3">

	<h2><i class="fa-solid fa-cube my-3"></i> 펀드정보관리 > 상세보기 및 정보수정</h2>
    <div class="border-top border-2 p-4">

        <form:form action="/fund/update" method="POST" modelAttribute="fund" class="validcheck" >
            <table class="table table-sm table-borderless">
                <tr class="align-middle">
                    <td class="text-end" style="width:130px">펀드코드/명</td>
                    <td class="w-25"><form:input type="text" class="form-control bg-light" path="fnd01FundCd" data-v-max-length="12" readonly="true" /></td>
                    <td colspan="4"><form:input type="text" class="form-control" path="fnd01FundNm" required="true" /></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">예탁원코드</td>
                    <td class="w-25"><form:input type="text" class="form-control" path="fnd01KsdItemCd" data-v-max-length="12" /></td>
                    <td style="width:50px">&nbsp;</td>
                    <td class="text-end">설정일자</td>
                    <td><form:input type="text" class="form-control w-50" path="fnd01StartDate" /></td>
                    <td style="width:50px">&nbsp;</td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">협회표준코드</td>
                    <td class="w-25"><form:input type="text" class="form-control" path="fnd01KofiaCd" data-v-max-length="12" /></td>
                    <td style="width:50px">&nbsp;</td>
                    <td class="text-end">해지일자</td>
                    <td><form:input type="text" class="form-control w-50" path="fnd01EndDate" /></td>
                    <td style="width:50px">&nbsp;</td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">금감원코드</td>
                    <td class="w-25"><form:input type="text" class="form-control" path="fnd01FssCd" data-v-max-length="12" /></td>
                    <td style="width:50px">&nbsp;</td>
                    <td class="text-end">최초결산일자</td>
                    <td><form:input type="text" class="form-control w-50" path="fnd01FirstCloseDate" /></td>
                    <td style="width:50px">&nbsp;</td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">펀드유형</td>
                    <td class="w-25">
                    	<form:select path="fnd01FundType" class="form-select">
                    		<form:option value="" />
                    		<form:options items="${fundTypeList}" itemValue="com02DtlCd" itemLabel="com02CodeNm"/> 
                    	</form:select>
					</td>
                    <td style="width:50px">&nbsp;</td>
                    <td class="text-end">회계기간</td>
                    <td><form:input type="number" class="form-control w-25 text-end d-inline" path="fnd01AccPeriod" />
                        <span class="d-inline">개월</span></td>
                    <td style="width:50px">&nbsp;</td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">공모/사모</td>
                    <td class="w-25">
						<form:select path="fnd01PublicCd" class="form-select">
						    <form:option value="" />
						    <form:options items="${publicCdList}" itemValue="com02DtlCd" itemLabel="com02CodeNm"/> 
						</form:select>
                    </td>
                    <td style="width:50px">&nbsp;</td>
                    <td class="text-end">주운용역</td>
                    <td><form:input type="text" class="form-control" path="fnd01Manager" /></td>
                    <td style="width:50px">&nbsp;</td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">펀드단위</td>
                    <td class="w-25">
						<form:select path="fnd01UnitCd" class="form-select">
						    <form:option value="" />
						    <form:options items="${unitCdList}" itemValue="com02DtlCd" itemLabel="com02CodeNm"/> 
						</form:select>
                    </td>
                    <td style="width:50px">&nbsp;</td>
                    <td class="text-end">부운용역</td>
                    <td><form:input type="text" class="form-control" path="fnd01SubManager" /></td>
                    <td style="width:50px">&nbsp;</td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">모자구분</td>
                    <td class="w-25">
						<form:select path="fnd01ParentCd" class="form-select">
						    <form:option value="" />
						    <form:options items="${parentCdList}" itemValue="com02DtlCd" itemLabel="com02CodeNm"/> 
						</form:select>                    
                    </td>
                    <td style="width:50px">&nbsp;</td>
                    <td class="text-end w-25">운용사</td>
                    <td>
                    	<form:hidden path="fnd01MngCoCd" />
                    	<form:input type="text" class="form-control bg-light" path="fnd01MngCoNm" readonly="true" />
                    </td>
                    <td><button class="btn btn-primary" id="btnPopupMngCo"><i class="fa-solid fa-search"></i></button></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">모펀드</td>
                    <td>
	                    <form:hidden path="fnd01ParentFundCd" />
	                    <form:input type="text" class="form-control bg-light" path="fnd01ParentFundNm" readonly="true" />
                    </td>
                    <td><button class="btn btn-primary" id="btnPopupFund"><i class="fa-solid fa-search"></i></button></td>
                    <td class="text-end">수탁사</td>
                    <td>
                    	<form:hidden path="fnd01TrustCoCd" />
                    	<form:input type="text" class="form-control bg-light" path="fnd01TrustCoNm" readonly="true" />
                    </td>
                    <td><button class="btn btn-primary" id="btnPopupTrustCo"><i class="fa-solid fa-search"></i></button></td>
                </tr>
                <tr class="align-middle">
                    <td colspan=3></td>
                    <td class="text-end">사무수탁사</td>
                    <td>
                    	<form:hidden path="fnd01OfficeCoCd" />
                    	<form:input type="text" class="form-control bg-light" path="fnd01OfficeCoNm" readonly="true"/>
                    </td>
                    <td><button class="btn btn-primary" id="btnPopupOfficeCo"><i class="fa-solid fa-search"></i></button></td>
                </tr>
            </table>
            
            <div class="row justify-content-md-center pt-5">
	            <button type="submit" class="col col-lg-2 btn btn-primary">저장</button>
	            &nbsp;
	            <a href="/fund/list" class="col col-lg-2 btn btn-secondary">취소, 리스트로 돌아감</a>
            </div>

            <!-- 임시로 종목과 보유종목 팝업 -->
            <br><br>
		    <div class="container-lg p-3 border border-2 rounded-1">
	            <input type=hidden id="itm01ItemCd"/>
	            <input type="text" class="form-control d-inline w-25" id="itm01ItemNm"/>
	            <button class="btn d-inline btn-primary" id="btnPopupItem">종목 팝업</button>
		    </div>
		    <div class="container-lg p-3 border border-2 rounded-1">
	            <input type="text" class="form-control d-inline w-25" id="bok01BookId1"/>
	            <input type="text" class="form-control d-inline w-25" id="fnd01FundCd1"/>
	            <input type="text" class="form-control d-inline w-25" id="fnd01FundNm1"/>
	            <input type="text" class="form-control d-inline w-25" id="itm01ItemCd1"/>
	            <input type="text" class="form-control d-inline w-25" id="itm01ItemNm1"/>
	            <input type="text" class="form-control d-inline w-25" id="bok01HoldQty1"/>
	            <button class="btn d-inline btn-primary" id="btnPopupBook">보유종목 팝업</button>
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
	
    //date format set
    $('input.dateinput').inputDateFormat();

    //datepicker셋팅
    $('#fnd01StartDate, #fnd01EndDate, #fnd01FirstCloseDate')
    .datepicker({
       format: 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
       autoclose: true,
       todayHighlight: true,
       language: 'ko' //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
    })
    .on('changeDate', function (e) {
       console.log(e);
    });
    
	//기관정보
	$('#btnPopupMngCo').on('click', function(){
		var url = '/popup/corp?corpCd=fnd01MngCoCd&corpNm=fnd01MngCoNm';
		var prop = {};
		var width = 720;
		var height = 518;
    	var win = AssetUtil.popupWindow(url, '기관선택', {}, width, height);
    	return false;
    });
	
    $('#btnPopupTrustCo').on('click', function(){
        var url = '/popup/corp?corpCd=fnd01TrustCoCd&corpNm=fnd01TrustCoNm';
        var prop = {};
        var width = 720;
        var height = 518;
        var win = AssetUtil.popupWindow(url, '기관선택', {}, width, height);
        return false;
    });
    $('#btnPopupOfficeCo').on('click', function(){
        var url = '/popup/corp?corpCd=fnd01OfficeCoCd&corpNm=fnd01OfficeCoNm';
        var prop = {};
        var width = 720;
        var height = 518;
        var win = AssetUtil.popupWindow(url, '기관선택', {}, width, height);
        return false;
    });
    //펀드팝업
    $('#btnPopupFund').on('click', function(){
		var url = '/popup/fund?fundCd=fnd01ParentFundCd&fundNm=fnd01ParentFundNm&parentYn=true';
		var prop = {};
		var width = 720;
		var height = 518;
    	var win = AssetUtil.popupWindow(url, '펀드선택', {}, width, height);
    	return false;
    });
    //종목팝업
    $('#btnPopupItem').on('click', function(){
		var url = '/popup/item?itemCd=itm01ItemCd&itemNm=itm01ItemNm';
		var prop = {};
		var width = 720;
		var height = 518;
    	var win = AssetUtil.popupWindow(url, '종목선택', {}, width, height);
    	return false;
    });
    //보유종목팝업
    
    $('#btnPopupBook').on('click', function(){
		var url = '/popup/book?';
		url += 'bookId=' + 'bok01BookId1' + '&';
		url += 'fundCd=' + 'fnd01FundCd1' + '&';
		url += 'fundNm=' + 'fnd01FundNm1' + '&';
		url += 'itemCd=' + 'itm01ItemCd1' + '&';
		url += 'itemNm=' + 'itm01ItemNm1' + '&';
		url += 'holdQty=' + 'bok01HoldQty1';
		
		var prop = {};
		var width = 500;
		var height = 700;
    	var win = AssetUtil.popupWindow(url, '보유종목선택', {}, width, height);
    	return false;
    });
});

</script>
</body>
</html>