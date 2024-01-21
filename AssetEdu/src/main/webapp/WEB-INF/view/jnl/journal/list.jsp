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
<jsp:include page="../../common/meta_css.jsp" flush="false" />
<!-- =================================================== -->
<title><c:out value="${pageTitle}" default="분개장-리스트" /></title>
</head>
<style>
#frDate, #toDate {
	width :120px;
}
.table tbody tr.highlight td {
  background-color: #EAF0F7;
}
.table tbody tr.subSumTr td {
  background-color: #FAF4F4;
}

</style>
<body>
<!-- =================================================== -->
<jsp:include page="../../common/header.jsp" flush="false" />
<!-- =================================================== -->
<main class="container mx-3 my-3">

	<h2><i class="fa-solid fa-cube my-3"></i> 분개장 관리</h2>

	<div class="container-lg p-3 border border-2 rounded-1">
		<span class="align-middle fw-bold">분개일자 </span> 
		<input type="text" class="form-control d-inline align-middle text-center dateinput" id="frDate" name="frDate" value="${frDate}"/>
		<span class="align-middle">~</span>
		<input type="text" class="form-control d-inline align-middle text-center mx-2 dateinput" id="toDate" name="toDate" value="${toDate}"/>
		<input type="text" class="form-control w-50 d-inline align-middle" placeholder="검색어(거래구분/펀드/종목)를 입력하세요" id="searchText" name="searchText" value="${param.searchText}">
		<a class="btn d-inline align-middle btn-primary btnRetrieve"><i class="fa-solid fa-search"></i> 조회</a>
        <a class="btn d-inline align-middle btn-secondary btnInit"><i class="fa-solid fa-backspace"></i> 초기화</a>
	</div>

	<table class="table table-hover table-sm mt-3 journalTable" style="font-size:small">
	  <thead class="table-light">
	    <tr class="text-center align-middle">
          <th scope="col" rowspan="2" style="width:30px">No</th>
          <th scope="col" rowspan="2" style="width:90px">분개일자</th>
          <th scope="col" rowspan="2">거래구분</th>
          <th scope="col" rowspan="2">펀드</th>
          <th scope="col" rowspan="2">종목</th>
	      <th scope="col" colspan="3">차변</th>
	      <th scope="col" colspan="3">대변</th>
	    </tr>	  
	    <tr class="text-center">
	      <th scope="col" style="width:70px">계정코드</th>
	      <th scope="col">계정명</th>
	      <th scope="col">금액</th>
	      <th scope="col" style="width:70px">계정코드</th>
	      <th scope="col">계정명</th>
	      <th scope="col">금액</th>
	    </tr>
	  </thead>
	  <tbody class="table-group-divider" >
	  	<c:set var="drSubSum" value="0"/>
	  	<c:set var="crSubSum" value="0"/>
	  	<c:set var="drTotal" value="0"/>
	  	<c:set var="crTotal" value="0"/>
	  	<c:set var="prevId" value=""/>
	  	<c:set var="nowId" value=""/>
	  	<c:forEach var="journal" items="${list}" varStatus="status">
	  		<c:set var="nowId" value="${journal.jnl01ContId }"/>
	  		<c:if test="${(status.count eq 1) or(prevId eq nowId)}"> 
		    <tr class="align-middle">
		      <td scope="row" class="text-center fw-bold">${status.count }</td>
		      <td class="text-center"><asset:displayYmd ymd="${journal.opr01ContDate}"/></td>
		      <td>${journal.opr01TrNm }</td>
		      <td>${journal.fnd01FundNm }</td>
		      <td>${journal.itm01ItemNm }</td>

		      <td class="text-center">${journal.drJnl10AcntCd }</td>
		      <td>${journal.drJnl10AcntNm }</td>
		      <td class="text-end"><fmt:formatNumber value="${journal.jnl01DrAmt  }" pattern="#,###"/></td>
		      
		      <td class="text-center">${journal.crJnl10AcntCd }</td>
		      <td>${journal.crJnl10AcntNm }</td>
		      <td class="text-end"><fmt:formatNumber value="${journal.jnl01CrAmt  }" pattern="#,###"/></td>
		    </tr>
			</c:if>			
			
			<c:if test="${status.count > 1 and prevId ne nowId}">
				<tr class="align-middle fw-bold subSumTr">
					<td class="text-center" colspan="5">소 계</td>
					<td class="text-end" colspan="3"><fmt:formatNumber value="${drSubSum}" pattern="#,###"/></td>
					<td class="text-end" colspan="3"><fmt:formatNumber value="${crSubSum}" pattern="#,###"/></td>					
				</tr>			
				<tr class="align-middle">
			      <td scope="row" class="text-center fw-bold">${status.count }</td>
			      <td class="text-center"><asset:displayYmd ymd="${journal.opr01ContDate}"/></td>
			      <td>${journal.opr01TrNm }</td>
			      <td>${journal.fnd01FundNm }</td>
			      <td>${journal.itm01ItemNm }</td>
	
			      <td class="text-center">${journal.drJnl10AcntCd }</td>
			      <td>${journal.drJnl10AcntNm }</td>
			      <td class="text-end"><fmt:formatNumber value="${journal.jnl01DrAmt  }" pattern="#,###"/></td>
			      
			      <td class="text-center">${journal.crJnl10AcntCd }</td>
			      <td>${journal.crJnl10AcntNm }</td>
			      <td class="text-end"><fmt:formatNumber value="${journal.jnl01CrAmt  }" pattern="#,###"/></td>
			    </tr>

				<c:set var="drSubSum" value="0"/>
	  			<c:set var="crSubSum" value="0"/>
			</c:if>
				
			<c:set var="prevId" value="${nowId }"/>
			<c:set var="drSubSum" value="${ drSubSum + journal.jnl01DrAmt }"/> 
			<c:set var="crSubSum" value="${ crSubSum + journal.jnl01CrAmt }"/> 
			<c:set var="drTotal" value="${ drTotal + journal.jnl01DrAmt }"/> 
			<c:set var="crTotal" value="${ crTotal+ journal.jnl01CrAmt }"/> 
	    </c:forEach>
		<c:if test="${list.size() > 0}">
			<tr class="align-middle fw-bold subSumTr">
				<td class="text-center" colspan="5">소 계</td>
				<td class="text-end" colspan="3"><fmt:formatNumber value="${drSubSum}" pattern="#,###"/></td>
				<td class="text-end" colspan="3"><fmt:formatNumber value="${crSubSum}" pattern="#,###"/></td>					
			</tr>		
			<tr class="align-middle fw-bold" style="background-color:#DCE2E8">
				<td class="text-center" colspan="5">합 계</td>
				<td class="text-end" colspan="3"><fmt:formatNumber value="${drTotal}" pattern="#,###"/></td>
				<td class="text-end" colspan="3"><fmt:formatNumber value="${crTotal}" pattern="#,###"/></td>
			</tr>
		</c:if>
		<c:if test="${list.size() == 0}">
			<tr class="align-middle text-bg-warning text-center"><td colspan="11">검색조건에 대한 데이터가 없습니다.</td></tr>
		</c:if>		    	
	  </tbody>
	</table>
  
</main>
<!-- =================================================== -->
<jsp:include page="../../common/footer.jsp" flush="false" />
<!-- -================================================== -->
<script type="text/javascript" src="/js/input-format.js"></script>
<script>
$(document).ready(function () {
	console.log('분개장 list...ready');
	
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
    $('#frDate, #toDate')
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
    $('.journalTable').on('click', 'tbody tr', function(event) {
          $(this).addClass('highlight').siblings().removeClass('highlight');
    });
	
	//조회버튼
	$('.btnRetrieve').on('click', function(){
		var frDate = $('#frDate').val();
		var toDate = $('#toDate').val();
		
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
			frDate : $('#frDate').val(),
			toDate : $('#toDate').val()
		}
		AssetUtil.submitGet('/jnl/journal/list', data );	
	});
	//초기화
	$('.btnInit').on('click', function(){
		var data = {
				searchText : null, 
				frDate : AssetUtil.today(),
				toDate : AssetUtil.today()
			}
		AssetUtil.submitGet('/jnl/journal/list', data );	
	});
}); 
</script>
</body>
</html>