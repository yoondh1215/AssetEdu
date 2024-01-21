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
<title><c:out value="${pageTitle}" default="대표계정코드-리스트" /></title>
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
<c:set var="baseUrl" value="/jnl/repr-acnt"/>
<main class="container mx-3 my-3">

	<h2><i class="fa-solid fa-cube my-3"></i> 대표계정코드 관리</h2>

	<div class="container-lg p-3 border border-2 rounded-1">
		<input type="text" class="form-control w-50 d-inline align-middle" placeholder="검색어(계정코드/대표계정코드)를 입력하세요" id="searchText" name="searchText" value="${param.searchText}">
		<a class="btn d-inline align-middle btn-primary btnRetrieve"><i class="fa-solid fa-search"></i> 조회</a>
        <a class="btn d-inline align-middle btn-secondary btnInit"><i class="fa-solid fa-backspace"></i> 초기화</a>
        <a class="btn d-inline align-middle btn-success btnInsert" href="${baseUrl }/insert"><i class="fa-solid fa-backspace"></i> 등록</a>
	</div>

	<table class="table table-hover table-sm mt-3 mainTable" style="font-size:small">
	  <thead class="table-light">
	    <tr class="text-center align-middle">
	      <th scope="col" style="width:70px">No</th>
	      <th scope="col" style="width:100px">대표계정코드</th>
	      <th scope="col">대표계정코드명</th>
	      <th scope="col" style="width:100px">속성</th>
	      <th scope="col" style="width:150px">상대대표계정코드</th>
          <th scope="col">상대대표계정코드명</th>
	      <th scope="col"></th>
	    </tr>
	  </thead>
	  <tbody class="table-group-divider" >
	  	<c:forEach var="item" items="${list}" varStatus="status">
		    <tr class="align-middle">
		      <td scope="col" class="text-center">${status.count }</td>
		      <td scope="col" class="text-center"><c:out value="${item.jnl11ReprAcntCd }"/></td>
		      <td scope="col" class="text-center"><c:out value="${item.jnl11ReprAcntNm }"/></td>
		      <td scope="col" class="text-center"><c:out value="${item.jnl11AcntAttributeNm }"/></td>
		      <td scope="col" class="text-center"><c:out value="${item.jnl11TgtReprAcntCd }"/></td>
              <td scope="col" class="text-center"><c:out value="${item.jnl11TgtReprAcntNm }"/></td>
		      <td scope="col" class="text-end">
			      <button class="btn btn-primary btn-sm btnModify" data-id="${item.jnl11ReprAcntCd }"><span><i class="fa-regular fa-pen-to-square"></i></span> 수정</button>
			      <button class="btn btn-danger btn-sm btnDelete" data-id="${item.jnl11ReprAcntCd}" data-nm="${item.jnl11ReprAcntNm }"><span><i class="fa-regular fa-trash-can"></i></span> 삭제</button>		      
		      </td>
		    </tr>
	    </c:forEach>
	  </tbody>
	</table>
  
</main>
<!-- =================================================== -->
<jsp:include page="../../common/footer.jsp" flush="false" />
<!-- -================================================== -->
<script type="text/javascript" src="/js/input-format.js"></script>
<script>
$(document).ready(function () {
	console.log('acnt 대표계정코드 리스트..');
	const baseUrl = "/jnl/repr-acnt";
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
	
    //테이블 클릭시 하이라이트 표시
    $('.mainTable').on('click', 'tbody tr', function(event) {
          $(this).addClass('highlight').siblings().removeClass('highlight');
    });
	
	//조회버튼
	$('.btnRetrieve').on('click', function(){
		var data = {
			searchText : $('#searchText').val(), 
		}
		AssetUtil.submitGet(baseUrl + '/list', data );	
	});
	//초기화
	$('.btnInit').on('click', function(){
		var data = {
				searchText : null, 
			}
		AssetUtil.submitGet(baseUrl + '/list', data );
	});
	//수정 
	$('.btnModify').on('click', function(e){
 		e.stopPropagation();
 		var cd = $(this).data('id');
 		var nm = $(this).data('nm');
 		var msg = nm + "(" + cd + ")";
 		var url = baseUrl + "/update/" + cd;
		AssetUtil.submitGet(url);
	});	
	//삭제
	$('.btnDelete').on('click', function(e){
 		e.stopPropagation();
 		var cd = $(this).data('id');
 		var nm = $(this).data('nm');
 		var msg = nm + "(" + cd + ")";
 		debugger;
 		var url = baseUrl + '/delete/' +cd;
 		if (confirm(msg + ' 를 삭제하시겠습니까?')){
 			
			AssetUtil.submitGet(url);
 		}		
	});
}); 
</script>
</body>
</html>