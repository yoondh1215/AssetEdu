<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="kfs" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="asset"  uri="/WEB-INF/asset-tags/asset.tld"%>
    
<!DOCTYPE html>
<html>
<head>
<!-- =================================================== -->
<jsp:include page="../common/meta_css.jsp" flush="false" />
<!-- =================================================== -->
<title><c:out value="${pageTitle}" default="주식보유원장" /></title>
<style>
#frHoldDate, #toHoldDate {
	width :120px;
}
.table tbody tr.highlight td {
  background-color: #EAF0F7;
}
</style>
</head>
<body>
<!-- =================================================== -->
<jsp:include page="../common/header.jsp" flush="false" />
<!-- =================================================== -->
<main class="container mx-3 my-3">
	<h2><i class="fa-solid fa-cube my-3"></i> 주식 보유원장</h2>
  
	<div class="container-lg p-3 border border-2 rounded-1">
		<span class="align-middle fw-bold">보유일자 </span> 
		<input type="text" class="form-control d-inline align-middle text-center dateinput" id="frHoldDate" name="frHoldDate" value="${frHoldDate}"/>
		<span class="align-middle">~</span>
		<input type="text" class="form-control d-inline align-middle text-center dateinput" id="toHoldDate" name="toHoldDate" value="${toHoldDate}"/>		
		<input type="text" class="form-control w-50 d-inline align-middle" placeholder="검색어(펀드명/종목명/보유ID)를 입력하세요" id="searchText" name="searchText" value="${param.searchText}">
		<a class="btn d-inline align-middle btn-primary btnRetrieve"><i class="fa-solid fa-search"></i> 조회</a>
        <a class="btn d-inline align-middle btn-secondary btnInit"><i class="fa-solid fa-backspace"></i> 초기화</a>
	</div>

	<table class="table table-hover table-sm mt-3 bookTable" style="font-size:small">
	  <thead class="table-light">
	    <tr class="text-center">
	      <th scope="col" style="width:30px">No</th>
	      <th scope="col" style="width:90px">보유일자</th>
	      <th scope="col">펀드</th>
	      <th scope="col">종목</th>
	      <th scope="col" style="width:90px">시장구분</th>
	      <th scope="col" style="width:100px">보유수량</th>
	      <th scope="col" style="width:120px">취득금액</th>
	      <th scope="col" style="width:120px">장부금액</th>
	      <th scope="col" style="width:120px">평가금액</th>
	      <th scope="col" style="width:120px">평가손익</th>
	      <th scope="col" style="width:90px">보유ID</th>
	    </tr>
	  </thead>
	  <tbody class="table-group-divider" >
	    <c:set var="holdQtySum" value="0"/>
        <c:set var="purAmtSum"  value="0"/>
        <c:set var="bookAmtSum" value="0"/>
        <c:set var="evalAmtSum" value="0"/>
        <c:set var="evalPlSum"  value="0"/>
	  
	  	<c:forEach var="book" items="${list}" varStatus="status">
		    <tr class="align-middle">
		      <td scope="row" class="text-center fw-bold">${status.count }</td>
		      <td class="text-center"><asset:displayYmd ymd="${book.bok01HoldDate}"/></td>
		      <td>${book.fnd01FundNm }</td>
		      <td>${book.itm01ItemNm }</td>
		      <td class="text-center">${book.itm01MarketTypeNm }</td>
              <td class="text-end"><fmt:formatNumber value="${book.bok01HoldQty }" pattern="#,###"/></td>
		      <td class="text-end"><fmt:formatNumber value="${book.bok01PurAmt }" pattern="#,###"/></td>
		      <td class="text-end"><fmt:formatNumber value="${book.bok01BookAmt }" pattern="#,###"/></td>
		      <td class="text-end"><fmt:formatNumber value="${book.bok01EvalAmt }" pattern="#,###"/></td>
		      <td class="text-end"><fmt:formatNumber value="${book.bok01EvalPl }" pattern="#,###"/></td>
		      <td class="text-center">${book.bok01BookId }</td>
		    </tr>
		    
		    <c:set var="holdQtySum" value="${holdQtySum + book.bok01HoldQty}"/>
            <c:set var="purAmtSum"  value="${purAmtSum  + book.bok01PurAmt}"/>
            <c:set var="bookAmtSum" value="${bookAmtSum + book.bok01BookAmt}"/>
            <c:set var="evalAmtSum" value="${evalAmtSum + book.bok01EvalAmt}"/>
            <c:set var="evalPlSum"  value="${evalPlSum  + book.bok01EvalPl}"/>
	    </c:forEach>
	    
	    <c:if test="${list.size() > 0}">
	       <tr class="align-middle text-center fw-bold" style="background-color:#FAF4F4">
	           <td colspan="5">합 계</td>
	           <td class="text-end"><fmt:formatNumber value="${holdQtySum}" pattern="#,###"/></td>
               <td class="text-end"><fmt:formatNumber value="${purAmtSum }" pattern="#,###"/></td>
               <td class="text-end"><fmt:formatNumber value="${bookAmtSum}" pattern="#,###"/></td>
               <td class="text-end"><fmt:formatNumber value="${evalAmtSum}" pattern="#,###"/></td>
               <td class="text-end"><fmt:formatNumber value="${evalPlSum }" pattern="#,###"/></td>
               <td></td>
	       </tr>
	    </c:if>
	  </tbody>
	</table>
  
</main>
<!-- =================================================== -->
<jsp:include page="../common/footer.jsp" flush="false" />
<!-- -================================================== -->
<script type="text/javascript" src="/js/input-format.js"></script>
<script>
$(document).ready(function () {
	console.log('보유원장리스트...ready');
	
	//화면뜨면 검색창에 포커스 
	$("#searchText").focus();
	
	//검색창에서 enter이면 조회
	$("#searchText").on("keyup",function(key){
        if(key.keyCode==13) { //enter
        	$('.btnRetrieve').trigger('click');
        }else if(key.keyCode == 46){ //DEL
        	$(this).val('');
        }
	});	
	
	//날짜를 키입력받는다.
	$('input.dateinput').inputDateFormat();
	
	//보유일자 datepicker셋팅
    $('#frHoldDate, #toHoldDate')
    .datepicker({
       format: 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
       autoclose: true,
       todayHighlight: true,
       language: 'ko' //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
    })
    .on('changeDate', function (e) {
       console.log(e);
    });

    //테이블 클릭시 하이라이트 표시
    $('.bookTable').on('click', 'tbody tr', function(event) {
          $(this).addClass('highlight').siblings().removeClass('highlight');
    });
	
	//조회버튼
	$('.btnRetrieve').on('click', function(){
		var frDate = $('#frHoldDate').val();
		var toDate = $('#toHoldDate').val();
		
		if(frDate.length < 1 || toDate.length < 1){
            alert("기준일자의 범위를 넣어주십시오");
            return;
        }
		
		if(frDate.length > 0 && toDate.length > 0){
			if(frDate.replace(/\D/gi,'') > toDate.replace(/\D/gi,'')){
				alert('날짜 범위의 시작일자가 종료일자보다 미래입니다.');
				return;
			}
		}
		
		var data = {
			searchText : $('#searchText').val(), 
			frHoldDate : $('#frHoldDate').val(),
			toHoldDate : $('#toHoldDate').val()
		}
		AssetUtil.submitGet('/book/list', data );	
	});
	
	//초기화
	$('.btnInit').on('click', function(){
		var data = {
				searchText : null, 
				frHoldDate : AssetUtil.today(),
				toHoldDate : AssetUtil.today()
			}
		AssetUtil.submitGet('/book/list', data );	
	});
}); 
</script>
</body>
</html>