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
<title><c:out value="${pageTitle}" default="기관정보-리스트" /></title>
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
  
    <h2><i class="fa-solid fa-cube my-3"></i> 기관정보관리</h2>
  
    <div class="container-lg p-3 border border-2 rounded-1">
        <input type="text" class="form-control w-50 d-inline align-middle" placeholder="검색어(구분/기관코드/기관명)를 입력하세요" id="searchText" name="searchText" value="${param.searchText}">
        <a class="btn d-inline align-middle btn-primary btnRetrieve"><i class="fa-solid fa-search"></i> 조회</a>
        <a class="btn d-inline align-middle btn-secondary btnInit"><i class="fa-solid fa-backspace"></i> 초기화</a>
        <a class="btn d-inline align-middle btn-success" href="/corp/insert">  <i class="fa-solid fa-pencil-alt"></i> 등록</a>
    </div>

    <table class="table table-sm table-hover corpTable mt-3" style="font-size:small">
      <thead class="table-light">
        <tr class="text-center">
          <th scope="col" style="width:20px">No</th>
          <th scope="col" style="width:100px">구분</th>
          <th scope="col" style="width:70px">기관코드</th>
          <th scope="col">기관한글명</th>
          <th scope="col">기관영문명</th>
          <th scope="col" style="width:70px">대외코드</th>
          <th scope="col" style="width:75px"> </th>
        </tr>
      </thead>
      <tbody class="table-group-divider" >
        <c:forEach var="corp" items="${list}" varStatus="status">
            <tr class="align-middle">
              <td scope="row" class="text-center fw-bold">${status.count }</td>
              <td class="text-center">${corp.com01CorpTypeNm }</td>
              <td class="text-center">${corp.com01CorpCd }</td>
              <td>${corp.com01CorpNm }</td>
              <td>${corp.com01CorpEnm }</td>
              <td class="text-center">${corp.com01ExtnCorpCd }</td>
              <td>
                  <button class="btn btn-primary btn-sm btnModify" data-corp-cd="${corp.com01CorpCd }"><span><i class="fa-regular fa-pen-to-square"></i></span></button>
                  <button class="btn btn-danger btn-sm btnDelete" data-corp-cd="${corp.com01CorpCd }" data-corp-nm="${corp.com01CorpNm }"><span><i class="fa-regular fa-trash-can"></i></span></button>
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
    $('.corpTable').on('click', 'tbody tr', function(event) {
        $(this).addClass('highlight').siblings().removeClass('highlight');
    });
  
    $('.btnRetrieve').on('click', function(){
        var searchText = $('#searchText').val();
        AssetUtil.submitGet('/corp/list', {searchText: searchText});
    })
    $('.btnInit').on('click', function(){
        AssetUtil.submitGet('/corp/list', {searchText: null});
    })
    $('.btnModify').on('click', function(){
        var corpCd = $(this).data('corp-cd');
        AssetUtil.submitGet('/corp/update', {com01CorpCd: corpCd});
    })
    $('.btnDelete').on('click', function(){
        var corpCd = $(this).data('corp-cd');
        var corpNm = $(this).data('corp-nm');
        if(confirm(corpNm + " 기관정보를 삭제하시겠습니까?")){
            AssetUtil.submitGet('/corp/delete', {com01CorpCd: corpCd}); 
        }
    })
});
</script>
</body>
</html>