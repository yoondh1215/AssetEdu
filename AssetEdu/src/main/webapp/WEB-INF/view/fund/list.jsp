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
<title><c:out value="${pageTitle}" default="펀드정보-리스트" /></title>
</head>
<style>
.table tbody tr.highlight td {
  background-color: #EAF0F7;
}
</style>
<body>
<!-- =================================================== -->
<jsp:include page="../common/header.jsp" flush="false" />
<!-- =================================================== -->
<main class="container mx-3 my-3">

    <h2><i class="fa-solid fa-cube my-3"></i> 펀드정보관리</h2>
  
    <div class="container-lg p-3 border border-2 rounded-1">
        <input type="text" class="form-control w-50 d-inline align-middle" placeholder="검검색어(펀드코드/펀드명/펀드유형)를 입력하세요" id="searchText" name="searchText" value="${param.searchText}">
        <a class="btn d-inline align-middle btn-primary btnRetrieve"><i class="fa-solid fa-search"></i> 조회</a>
        <a class="btn d-inline align-middle btn-secondary btnInit"><i class="fa-solid fa-backspace"></i> 초기화</a>
        <a class="btn d-inline align-middle btn-success" href="/fund/insert">  <i class="fa-solid fa-pencil-alt"></i> 등록</a>
    </div>

    <table class="table table-sm table-hover mt-3 fundTable" style="font-size:small">
      <thead class="table-light">
        <tr class="text-center">
          <th scope="col" style="width:20px">No</th>
	      <th scope="col" style="width:50px">펀드</th>
	      <th scope="col">펀드명</th>
	      <th scope="col" style="width:80px">펀드유형</th>
	      <th scope="col">공모/사모</th>
	      <th scope="col" style="width:60px">단위</th>
	      <th scope="col" style="width:50px">모/자</th>
	      <th scope="col" style="width:85px">설정일자</th>
	      <th scope="col" style="width:100px">예탁원코드</th>
	      <th scope="col">운용사</th>
	      <th scope="col">수탁사</th>
	      <th scope="col">사무수탁사</th>
	      <th scope="col" style="width:75px"></th>
        </tr>
      </thead>
      <tbody class="table-group-divider" >
        <c:forEach var="fund" items="${list}" varStatus="status">
            <tr class="align-middle">
              <td scope="row" class="text-center fw-bold">${status.count }</td>
             <td class="text-center">${fund.fnd01FundCd }</td>
		      <td>${fund.fnd01FundNm }</td>
		      <td>${fund.fnd01FundTypeNm }</td>
              <td>${fund.fnd01PublicNm }</td>
              <td>${fund.fnd01UnitNm }</td>
              <td class="text-center">${fund.fnd01ParentNm }</td>
              <td class="text-center"><asset:displayYmd ymd="${fund.fnd01StartDate}"/></td>
              <td class="text-center">${fund.fnd01KsdItemCd }</td>
              <td>${fund.fnd01MngCoNm }</td>
              <td>${fund.fnd01TrustCoNm }</td>
              <td>${fund.fnd01OfficeCoNm }</td>
              <td>
                  <button class="btn btn-primary btn-sm btnModify" data-fund-cd="${fund.fnd01FundCd }"><span><i class="fa-regular fa-pen-to-square"></i></span></button>
                  <button class="btn btn-danger btn-sm btnDelete" data-fund-cd="${fund.fnd01FundCd }" data-fund-nm="${fund.fnd01FundNm }"><span><i class="fa-regular fa-trash-can"></i></span></button>
              </td>
            </tr>
        </c:forEach>
      </tbody>
    </table>

</main>
<!-- =================================================== -->
<jsp:include page="../common/footer.jsp" flush="false" />
<!-- -================================================== -->
<script>
$(document).ready(function () {
	console.log('ready...');
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
	
	//Row Select Highlight
    $('.fundTable').on('click', 'tbody tr', function(event) {
        $(this).addClass('highlight').siblings().removeClass('highlight');
    });

    $('.btnRetrieve').on('click', function(){
        var searchText = $('#searchText').val();
        AssetUtil.submitGet('/fund/list', {searchText: searchText});
    })
    $('.btnInit').on('click', function(){
        AssetUtil.submitGet('/fund/list', {searchText: null});
    })
    $('.btnModify').on('click', function(){
        var fundCd = $(this).data('fund-cd');
        AssetUtil.submitGet('/fund/update', {fnd01FundCd: fundCd});
    })
    $('.btnDelete').on('click', function(){
    	var fundCd = $(this).data('fund-cd');
		var fundNm = $(this).data('fund-nm');
		if(confirm("펀드 " + fundNm + "을(를) 삭제하시겠습니까?")){
			AssetUtil.submitGet('/fund/delete', {fnd01FundCd: fundCd});	
		}
    })
});
</script>
</body>
</html>