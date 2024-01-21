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
<title><c:out value="${pageTitle}" default="보유주식 평가처리" /></title>
<style>
#evalDate {
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
	<h2><i class="fa-solid fa-cube my-3"></i> 보유주식 평가처리</h2>
  
	<div class="container-lg p-3 border border-2 rounded-1">
		<span class="align-middle fw-bold">평가일자 </span> 
		<input type="text" class="form-control d-inline align-middle text-center dateinput" id="evalDate" name="evalDate" value="${evalDate}"/>
		<input type="text" class="form-control w-50 d-inline align-middle" placeholder="검색어(펀드코드/펀드명/종목코드/종목명)를 입력하세요" id="searchText" name="searchText" value="${param.searchText}">
		<a class="btn d-inline align-middle btn-primary btnRetrieve"><i class="fa-solid fa-search"></i> 조회</a>
        <a class="btn d-inline align-middle btn-secondary btnInit"><i class="fa-solid fa-backspace"></i> 초기화</a>
        <a class="btn d-inline align-middle btn-success btnProcess"><i class="fa-solid fa-check"></i> 평가처리</a>
        <a class="btn d-inline align-middle btn-danger btnCancel"><i class="fa-solid fa-undo"></i> 평가취소</a>
	</div>

	<table class="table table-hover table-sm mt-3 bookTable" style="font-size:small">
	  <thead class="table-light">
	    <tr class="text-center">
	      <th scope="col" style="width:30px">No</th>
	      <th scope="col" style="width:90px">펀드코드</th>
	      <th scope="col">펀드명</th>
          <th scope="col" style="width:120px">종목코드</th>
	      <th scope="col">종목명</th>
	      <th scope="col" style="width:100px">보유주수</th>
	      <th scope="col" style="width:120px">장부금액</th>
          <th scope="col" style="width:100px">평가단가</th>
	      <th scope="col" style="width:120px">평가금액</th>
	      <th scope="col" style="width:120px">평가손익</th>
	      <th scope="col" style="width:90px">처리여부</th>
	    </tr>
	  </thead>
	  <tbody class="table-group-divider" >
        <c:set var="bookAmtSum" value="0"/>
        <c:set var="evalAmtSum" value="0"/>
        <c:set var="evalPlSum"  value="0"/>
	  
	  	<c:forEach var="book" items="${list}" varStatus="status">
		    <tr class="align-middle">
		      <td scope="row" class="text-center fw-bold">${status.count }</td>
		      <td class="text-center">${book.bok01FundCd}</td>
		      <td>${book.fnd01FundNm }</td>
              <td class="text-center">${book.bok01ItemCd}</td>
		      <td>${book.itm01ItemNm }</td>
              <td class="text-end"><fmt:formatNumber value="${book.bok01HoldQty }" pattern="#,###"/></td>
		      <td class="text-end"><fmt:formatNumber value="${book.bok01BookAmt }" pattern="#,###"/></td>
              <td class="text-end"><fmt:formatNumber value="${book.bok01EvalPrice }" pattern="#,###"/></td>
		      <td class="text-end"><fmt:formatNumber value="${book.bok01EvalAmt }" pattern="#,###"/></td>
		      <td class="text-end"><fmt:formatNumber value="${book.bok01EvalPl }" pattern="#,###"/></td>
		      <td class="text-center">${book.bok01EvalYnStr }</td>
		    </tr>
		    
            <c:set var="bookAmtSum" value="${bookAmtSum + book.bok01BookAmt}"/>
            <c:set var="evalAmtSum" value="${evalAmtSum + book.bok01EvalAmt}"/>
            <c:set var="evalPlSum"  value="${evalPlSum  + book.bok01EvalPl}"/>
	    </c:forEach>
	    
	    <c:if test="${list.size() > 0}">
	       <tr class="align-middle text-center fw-bold" style="background-color:#FAF4F4">
	           <td colspan="6">합 계</td>
               <td class="text-end"><fmt:formatNumber value="${bookAmtSum}" pattern="#,###"/></td>
               <td></td>
               <td class="text-end"><fmt:formatNumber value="${evalAmtSum}" pattern="#,###"/></td>
               <td class="text-end"><fmt:formatNumber value="${evalPlSum }" pattern="#,###"/></td>
               <td></td>
	       </tr>
	    </c:if>
	  </tbody>
	</table>
	
    <c:if test="${not empty resultErrMsg}">
	  <div class="alert alert-danger p-3 mt-5 mx-3">
	       ${resultErrMsg}
	  </div>
    </c:if>

</main>
<!-- =================================================== -->
<jsp:include page="../common/footer.jsp" flush="false" />
<!-- -================================================== -->
<script type="text/javascript" src="/js/input-format.js"></script>
<script>
$(document).ready(function () {
	console.log('보유주식 평가리스트...ready');
	
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

    //amt format set
    $('input.amtinput').inputMoneyFormat();
    
    //date format set
    $('input.dateinput').inputDateFormat();
    
	//보유일자 datepicker셋팅
    $('#evalDate')
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
		var evalDate = $('#evalDate').val();
		var data = {
			searchText : $('#searchText').val(), 
			evalDate   : $('#evalDate').val()
		}
		AssetUtil.submitGet('/book/eval_list', data );	
	});
	
	//초기화
	$('.btnInit').on('click', function(){
		var data = {
				searchText : null, 
				evalDate : AssetUtil.today()
			}
		AssetUtil.submitGet('/book/eval_list', data );	
	});

    //평가처리
    $('.btnProcess').on('click', function(){
        var data = {
                searchText : $('#searchText').val(), 
                evalDate : $('#evalDate').val()
            }
        AssetUtil.submitGet('/book/eval_process', data );   
    });

    //평가취소
    $('.btnCancel').on('click', function(){
        var data = {
                searchText : $('#searchText').val(), 
                evalDate : $('#evalDate').val()
            }
        AssetUtil.submitGet('/book/eval_cancel', data );   
    });
	
}); 
</script>
</body>
</html>