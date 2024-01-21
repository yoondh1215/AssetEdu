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
<title><c:out value="${pageTitle}" default="주식매수처리" /></title>
</head>
<body>
<!-- =================================================== -->
<jsp:include page="../common/header.jsp" flush="false" />
<!-- =================================================== -->
<main class="container mx-3 my-3">
	<h2><i class="fa-solid fa-cube my-3"></i> 주식매수 거래내역 > 매수처리</h2>
    <div class="border-top border-2 p-4">
        <form:form action="/opr/buy_insert" method="POST" modelAttribute="cont" class="validcheck">
        	<form:hidden  path="opr01ContDate"/>
            <table class="table table-sm table-borderless">
                <tr class="align-middle">
                    <td class="text-end" style="width:130px">거래구분</td>
                    <td class="w-25">
                        <form:select path="opr01TrCd" class="form-select" required="true" tabindex="10">
                            <form:options items="${trCdList}" itemValue="com02DtlCd" itemLabel="com02CodeNm"/> 
                        </form:select>
                    </td>
                    <td colspan=3></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">펀드</td>
                    <td ><form:input type="text" class="form-control bg-light" path="opr01FundCd" readonly="true" required="true" tabindex="-1"/></td>
                    <td colspan=2>   <form:input type="text" class="form-control bg-light" path="opr01FundNm" readonly="true" tabindex="-1"/></td>
                    <td style="width:50px"><button class="btn btn-primary" id="btnPopupFund" tabindex="20"><i class="fa-solid fa-search"></i></button></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">종목</td>
                    <td class="w-25"><form:input type="text" class="form-control bg-light" path="opr01ItemCd" readonly="true" required="true" tabindex="-1" /></td>
                    <td colspan=2>   <form:input type="text" class="form-control bg-light" path="opr01ItemNm" readonly="true" tabindex="-1"/></td>
                    <td style="width:50px"><button class="btn btn-primary" id="btnPopupItem" tabindex="30"><i class="fa-solid fa-search"></i></button></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">매매처</td>
                    <td class="w-25"><form:input type="text" class="form-control bg-light" path="opr01TrCoCd" readonly="true" required="true" tabindex="-1" /></td>
                    <td colspan=2>   <form:input type="text" class="form-control bg-light" path="opr01TrCoNm" readonly="true" tabindex="-1" /></td>
                    <td style="width:50px"><button class="btn btn-primary" id="btnPopupCorp" tabindex="40"><i class="fa-solid fa-search"></i></button></td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">수량</td>
                    <td class="w-25"><form:input type="text" class="form-control text-end amtinput" path="opr01Qty" required="true" tabindex="50"/></td>
                    <td class="text-end">수수료</td>
                    <td class="w-25"><form:input type="text" class="form-control text-end amtinput" path="opr01Fee" tabindex="80"/></td>
                    <td style="width:50px">&nbsp;</td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">단가</td>
                    <td class="w-25"><form:input type="text" class="form-control text-end amtinput" path="opr01Price" required="true" tabindex="60"/></td>
                    <td class="text-end">결제금액</td>
                    <td class="w-25"><form:input type="text" class="form-control text-end amtinput" path="opr01SettleAmt" required="true" tabindex="90"/></td>
                    <td style="width:50px">&nbsp;</td>
                </tr>
                <tr class="align-middle">
                    <td class="text-end">약정금액</td>
                    <td class="w-25"><form:input type="text" class="form-control text-end amtinput" path="opr01ContAmt" required="true" tabindex="70"/></td>
                    <td class="text-end">결제일자</td>
                    <td class="w-25"><form:input type="text" class="form-control text-center w-50 dateinput" path="opr01SettleDate" required="true" tabindex="100"/></td>
                    <td style="width:50px">&nbsp;</td>
                </tr>
            </table>

            <kfs:DisplayErrors modelAttribute="cont"/>

            <div class="row justify-content-md-center pt-5">
                <button type="submit" class="col col-lg-2 btn btn-primary" tabindex="110">매수처리</button>
                &nbsp;
                <a href="/opr/buy_list" class="col col-lg-2 btn btn-secondary" tabindex="120">취소, 리스트로 돌아감</a>
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

    //validation
    let validator = $('form.validcheck').jbvalidator({
        language: '/js/validation/lang/ko.json'
    });
    //첫번째 입력에 focus를 준다
    $("form input:text").first().focus();
    
    //form 안의 inputdp Enter key submit방지
    $('form input').on('keydown', function(e){
        if(e.keyCode == 13){
            var id = $(this).attr('id');
            if(id == 'opr01Qty' || id == 'opr01Price') {
            	$(id).focusout(setContAmt());
            }
            else if(id == 'opr01ContAmt' || id == 'opr01Fee') {
                $(id).focusout(setSettleAmt());
            }
            e.preventDefault();
            //console.log('...............id : ' + $(this).attr('id'));
        }
    });
    
    //amt format set
    $('input.amtinput').inputMoneyFormat();
    
    //date format set
    $('input.dateinput').inputDateFormat();
    
    //datepicker셋팅
    $('#opr01SettleDate')
    .datepicker({
       format: 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
       autoclose: true,
       todayHighlight: true,
       language: 'ko' //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
    })
    .on('changeDate', function (e) {
       console.log(e);
    });

    $('#btnPopupCorp').on('click', function(){
    	//증권사만 나오게 하기 위해 &corpType=03 추가. 
        var url = '/popup/corp?corpCd=opr01TrCoCd&corpNm=opr01TrCoNm&corpType=03';
        var prop = {};
        var width = 720;
        var height = 518;
        var win = AssetUtil.popupWindow(url, '기관선택', {}, width, height);
        return false;
    });
    $('#btnPopupFund').on('click', function(){
        var url = '/popup/fund?fundCd=opr01FundCd&fundNm=opr01FundNm&parentYn=false';
        var prop = {};
        var width = 720;
        var height = 518;
        var win = AssetUtil.popupWindow(url, '펀드선택', {}, width, height);
        return false;
    });
    $('#btnPopupItem').on('click', function(){
        var url = '/popup/item?itemCd=opr01ItemCd&itemNm=opr01ItemNm';
        var prop = {};
        var width = 720;
        var height = 518;
        var win = AssetUtil.popupWindow(url, '종목선택', {}, width, height);
        return false;
    });
    
    //거래구분 변경시 결제일자SET
    $('#opr01TrCd').change(function(e){
    	getSettleDate();
    });

    //수량,단가 입력/변경시 약정금액, 결제금액 계산
    $('#opr01Qty, #opr01Price').change(function(e){
        setContAmt();
    });

    //약정금액 입력/변경시 결제금액 계산
    $('#opr01ContAmt, #opr01Fee').change(function(e){
        setSettleAmt();
    });

    //약정금액 SET
    function setContAmt(){
        var qty = $("#opr01Qty").val();
        if(qty == false) {
            qty = 0;
        } else {
            qty = qty.replace(/\D/gi, "");
        }
        var price = $("#opr01Price").val();
        if(price == false) {
            price = 0;
        } else {
            price = price.replace(/\D/gi, "");
        }

        $("#opr01ContAmt").val(AssetUtil.displayComma(qty * price));

        setSettleAmt();
    }
    
    //결제금액 SET
    function setSettleAmt(){
        var contAmt = $("#opr01ContAmt").val();
        if(contAmt == false) {
        	contAmt = 0;
        } else {
        	contAmt = Number(contAmt.replace(/\D/gi, "")) ;
        }
        var fee = $("#opr01Fee").val();
        if(fee == false) {
        	fee = 0;
        } else {
        	fee = Number(fee.replace(/\D/gi, ""));
        }
        
        $("#opr01SettleAmt").val(AssetUtil.displayComma(contAmt + fee));
    }
    
    //결제일자 가져오기
    function getSettleDate(){
    	var trCd = $("#opr01TrCd").val();
    	var stdDate = AssetUtil.today().replace(/-/gi,"");
    	
    	//장내매수(1001)인 경우 D+2일, 장외매수(1002)인 경우 당일
    	if(trCd == "1001"){
            AssetUtil.ajax('/date/getBizDate'
            		      ,{stdDate:stdDate, days:2}
                          ,{success : (response)=>{
                        	  setSettleDate(response.bizDate);
                            }
                          });
    	} else {
    		setSettleDate(stdDate);
    	}
    }

    function setSettleDate(settleDate){
    	var settleDate = settleDate.substring(0,4) + "-" + settleDate.substring(4,6) + "-" + settleDate.substring(6);
    	$("#opr01SettleDate").val(settleDate);
    }
    
    getSettleDate(); //거래구분 Default가 장내매수이므로 한번 댕겨와야함.
    
});
</script>
</body>
</html>