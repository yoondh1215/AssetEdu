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
<title><c:out value="${pageTitle}" default="종목정보-리스트" /></title>
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

    <h2><i class="fa-solid fa-cube my-3"></i> 주식종목정보관리</h2>
  
    <div class="container-lg p-3 border border-2 rounded-1">
        <input type="text" class="form-control w-50 d-inline align-middle" placeholder="검색어(종목코드/종목명/단축코드)를 입력하세요" id="searchText" name="searchText" value="${param.searchText}">
        <a class="btn d-inline align-middle btn-primary btnRetrieve"><i class="fa-solid fa-search"></i> 조회</a>
        <a class="btn d-inline align-middle btn-secondary btnInit"><i class="fa-solid fa-backspace"></i> 초기화</a>
        <a class="btn d-inline align-middle btn-success" href="/item/insert">  <i class="fa-solid fa-pencil-alt"></i> 등록</a>
    </div>

    <table class="table table-sm table-hover mt-3 itemTable" style="font-size:small">
      <thead class="table-light">
        <tr class="text-center">
          <th scope="col" style="width:20px">No</th>
          <th scope="col" style="width:100px">종목코드</th>
          <th scope="col">종목한글명</th>
          <th scope="col">종목영문명</th>
          <th scope="col" style="width:85px">단축코드</th>
          <th scope="col" style="width:85px">증권종류</th>
          <th scope="col" style="width:85px">상장구분</th>
          <th scope="col" style="width:85px">시장구분</th>
          <th scope="col" style="width:85px">액면가</th>
          <th scope="col" style="width:85px"> </th>
        </tr>
      </thead>
      <tbody class="table-group-divider" >
        <c:forEach var="item" items="${list}" varStatus="status">
            <tr class="align-middle">
              <td scope="row" class="text-center fw-bold">${status.count }</td>
              <td class="text-center">${item.itm01ItemCd }</td>
              <td>${item.itm01ItemNm }</td>
              <td>${item.itm01ItemEnm }</td>
              <td class="text-center">${item.itm01ShortCd }</td>
              <td class="text-center">${item.itm01StkTypeNm }</td>
              <td class="text-center">${item.itm01ListTypeNm }</td>
              <td class="text-center">${item.itm01MarketTypeNm }</td>
              <td class="text-end"><fmt:formatNumber value="${item.itm01Par}" pattern="#,###"/></td>
              <td class="text-end">
                  <button class="btn btn-primary btn-sm btnModify" data-item-cd="${item.itm01ItemCd }"><span><i class="fa-regular fa-pen-to-square"></i></span></button>
                  <button class="btn btn-danger btn-sm btnDelete" data-item-cd="${item.itm01ItemCd }" data-item-nm="${item.itm01ItemNm }"><span><i class="fa-regular fa-trash-can"></i></span></button>
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
    $('.itemTable').on('click', 'tbody tr', function(event) {
        $(this).addClass('highlight').siblings().removeClass('highlight');
    });

    $('.btnRetrieve').on('click', function(){
        var searchText = $('#searchText').val();
        AssetUtil.submitGet('/item/list', {searchText: searchText});
    })
    $('.btnInit').on('click', function(){
        AssetUtil.submitGet('/item/list', {searchText: null});
    })
    $('.btnModify').on('click', function(){
        var itemCd = $(this).data('item-cd');
        AssetUtil.submitGet('/item/update', {itm01ItemCd: itemCd});
    })
    $('.btnDelete').on('click', function(){
        var itemCd = $(this).data('item-cd');
        var itemNm = $(this).data('item-nm');
        if(confirm("종목 " + itemNm + "을(를) 삭제하시겠습니까?")){
            AssetUtil.submitGet('/item/delete', {itm01ItemCd: itemCd}); 
        }
    })
});
</script>
</body>
</html>