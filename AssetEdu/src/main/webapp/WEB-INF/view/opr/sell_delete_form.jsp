<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="asset"  uri="/WEB-INF/asset-tags/asset.tld"%>
<%@ taglib prefix="kfs"    tagdir="/WEB-INF/tags"%>
    
<!DOCTYPE html>
<html>
<head>
<!-- =================================================== -->
<jsp:include page="../common/meta_css.jsp" flush="false" />
<!-- =================================================== -->
<title><c:out value="${pageTitle}" default="주식매도처리내역(상세)" /></title>
</head>
<body>
<!-- =================================================== -->
<jsp:include page="../common/header.jsp" flush="false" />
<!-- =================================================== -->
<main class="container mx-3 my-3">

	<h2><i class="fa-solid fa-cube my-3"></i> 주식매도 거래내역 > 상세내역</h2>
    <div class="border-top border-2 p-4">
    
        <form:form action="/opr/sell_delete" method="POST" modelAttribute="cont" class="validcheck">
            <table class="table table-sm table-borderless">
                <tr class="align-middle">
                    <td class="text-end" style="width:130px">거래구분</td>
                    <td class="w-25"> <form:input type="text" class="form-control bg-light" path="opr01TrNm" readonly="true"/></td>
                    <td class="text-end">체결ID</td>
                    <td class="w-25"><form:input type="text" class="form-control bg-light" path="opr01ContId" readonly="true"/></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">펀드</td>
                    <td ><form:input type="text" class="form-control bg-light" path="opr01FundCd" readonly="true" /></td>
                    <td colspan=2>   <form:input type="text" class="form-control bg-light" path="opr01FundNm" readonly="true" /></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">종목</td>
                    <td class="w-25"><form:input type="text" class="form-control bg-light" path="opr01ItemCd" readonly="true" /></td>
                    <td colspan=2>   <form:input type="text" class="form-control bg-light" path="opr01ItemNm" readonly="true" /></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">매매처</td>
                    <td class="w-25"><form:input type="text" class="form-control bg-light" path="opr01TrCoCd" readonly="true" /></td>
                    <td colspan=2>   <form:input type="text" class="form-control bg-light" path="opr01TrCoNm" readonly="true"  /></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end" colspan="3">보유ID</td>
                    <td class="w-25"><form:input type="text" class="form-control bg-light" path="opr01BookId" readonly="true" /></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">수량</td>
                    <td class="w-25"><form:input type="text" class="form-control text-end bg-light" path="opr01Qty" readonly="true" /></td>
                    <td class="text-end">수수료</td>
                    <td class="w-25"><form:input type="text" class="form-control text-end bg-light" path="opr01Fee" readonly="true" /></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">단가</td>
                    <td class="w-25"><form:input type="text" class="form-control text-end bg-light" path="opr01Price" readonly="true" /></td>
                    <td class="text-end">제세금</td>
                    <td class="w-25"><form:input type="text" class="form-control text-end bg-light" path="opr01Tax" readonly="true" /></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">약정금액</td>
                    <td class="w-25"><form:input type="text" class="form-control text-end bg-light" path="opr01ContAmt" readonly="true" /></td>
                    <td class="text-end">결제금액</td>
                    <td class="w-25"><form:input type="text" class="form-control text-end bg-light" path="opr01SettleAmt" readonly="true" /></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end" colspan="3">결제일자</td>
                    <td class="w-25"><form:input type="text" class="form-control text-center w-50 bg-light" path="opr01SettleDate" readonly="true" /></td>
                </tr>
                <tr class="align-middle">
                    <td colspan=3 class="text-end">체결일자</td>
                    <td class="w-25"><form:input type="text" class="form-control text-center w-50 bg-light" path="opr01ContDate" readonly="true"/></td>
                </tr>
            </table>

            <kfs:DisplayErrors modelAttribute="cont"/>

            <div class="row justify-content-md-center pt-5">
                <c:if test="${cont.opr01ContDate == cont.opr01BizDate}">
                    <button type="submit" class="col col-lg-2 btn btn-danger" tabindex="110">매도처리취소</button>
                    &nbsp;
                </c:if>
                <a href="/opr/sell_list" class="col col-lg-2 btn btn-secondary" tabindex="120">취소, 리스트로 돌아감</a>
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
    console.log('ready...');

    //form 안의 inputdp Enter key submit방지
    $('form input').on('keydown', function(e){
        if(e.keyCode == 13){
            e.preventDefault();
        }
    });
});
</script>
</body>
</html>