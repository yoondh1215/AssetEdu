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
<title><c:out value="${pageTitle}" default="주식종목정보-등록" /></title>
</head>
<body>
<!-- =================================================== -->
<jsp:include page="../common/header.jsp" flush="false" />
<!-- =================================================== -->
<main class="container mx-3 my-3">

	<h2><i class="fa-solid fa-cube my-3"></i> 주식종목정보관리 > 종목정보수정</h2>
    <div class="border-top border-2 p-4">

        <form:form action="/item/update" method="POST" modelAttribute="item" class="validcheck" >
            <table class="table table-sm table-borderless">
                <tr class="align-middle">
                    <td class="text-end" style="width:150px">종목코드/단축코드</td>
                    <td style="width:250px"><form:input type="text" class="form-control bg-light" path="itm01ItemCd" data-v-max-length="12" data-v-min-length="12" required="true" readonly="true" /></td>
                    <td style="width:150px"><form:input type="text" class="form-control" path="itm01ShortCd" /></td>
                    <td></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">종목한글명</td>
                    <td colspan=3><form:input type="text" class="form-control" path="itm01ItemNm" required="true" /></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">종목영문명</td>
                    <td colspan=3><form:input type="text" class="form-control" path="itm01ItemEnm" /></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">상장구분</td>
                    <td>
                        <form:select path="itm01ListType" class="form-select">
                            <form:option value="" />
                            <form:options items="${stkListTypeList}" itemValue="com02DtlCd" itemLabel="com02CodeNm"/> 
                        </form:select>
                    </td>
                    <td colspan=2></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">시장구분</td>
                    <td>
                        <form:select path="itm01MarketType" class="form-select">
                            <form:option value="" />
                            <form:options items="${marketTypeList}" itemValue="com02DtlCd" itemLabel="com02CodeNm"/> 
                        </form:select>
                    </td>
                    <td colspan=2></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">증권종류</td>
                    <td>
                        <form:select path="itm01StkType" class="form-select">
                            <form:option value="" />
                            <form:options items="${stkTypeList}" itemValue="com02DtlCd" itemLabel="com02CodeNm"/> 
                        </form:select>
                    </td>
                    <td colspan=2></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">액면가</td>
                    <td><form:input type="text" class="form-control text-end amtinput" path="itm01Par" /></td>
                    <td colspan=2></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">발행기관</td>
                    <td>
                        <form:hidden path="itm01IssCoCd" />
                        <form:input type="text" class="form-control bg-light" path="itm01IssCoNm" readonly="true" />
                    </td>
                    <td><button class="btn btn-primary" id="btnPopupCorp"><i class="fa-solid fa-search"></i></button></td>
                    <td></td>
                </tr>
            </table>
            
            <kfs:DisplayErrors modelAttribute="item"/>

            <div class="row justify-content-md-center pt-5">
                <button type="submit" class="col col-lg-2 btn btn-primary">저장</button>
                &nbsp;
                <a href="/item/list" class="col col-lg-2 btn btn-secondary">취소, 리스트로 돌아감</a>
            </div>
        </form:form>

    </div>
</main>
<!-- =================================================== -->
<jsp:include page="../common/footer.jsp" flush="false" />
<!-- -================================================== -->
<script type="text/javascript" src="/js/input-format.js"></script>
<script>
$(document).ready(function () {
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
	
    //amt format set
    $('input.amtinput').inputMoneyFormat();
    
    $('#btnPopupCorp').on('click', function(){
//     	발행기관은 일반회사만 이므로 corpType=01 추가
        var url = '/popup/corp?corpCd=itm01IssCoCd&corpNm=itm01IssCoNm&corpType=01';
        var prop = {};
        var width = 720;
        var height = 518;
        var win = AssetUtil.popupWindow(url, '기관선택', {}, width, height);
        return false;
    });
});
</script>
</body>
</html>