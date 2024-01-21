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
<title><c:out value="${pageTitle}" default="실계정맵핑-리스트" /></title>
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
<c:set var="baseUrl" value="/jnl/real-acnt"/>
<main class="container mx-3 my-3">

	<h2><i class="fa-solid fa-cube my-3"></i> 실계정맵핑 관리</h2>

	<div class="container-lg p-3 border border-2 rounded-1">
		<input type="text" class="form-control w-50 d-inline align-middle" placeholder="검색어(대표계정코드(명)/실계정코드(명))를 입력하세요" id="searchText" name="searchText" value="${param.searchText}">
		<a class="btn d-inline align-middle btn-primary btnRetrieve"><i class="fa-solid fa-search"></i> 조회</a>
        <a class="btn d-inline align-middle btn-secondary btnInit"><i class="fa-solid fa-backspace"></i> 초기화</a>
        <a class="btn d-inline align-middle btn-success btnInsert" href="${baseUrl }/insert"><i class="fa-solid fa-backspace"></i> 등록</a>
	</div>

	<table class="table table-hover table-sm mt-3 mainTable" style="font-size:small">
	  <thead class="table-light">
	    <tr class="text-center">
	      <th scope="col" style="width:70px">No</th>
	      <th scope="col" style="width:100px">대표계정코드</th>
	      <th scope="col">대표계정명</th>
	      <th scope="col" style="width:120px">상장구분</th>
	      <th scope="col" style="width:120px">시장구분</th>
	      <th scope="col" style="width:120px">실계정코드</th>
	      <th scope="col">실계정과목</th>
	      <th scope="col"></th>
	    </tr>
	  </thead>
	  <tbody class="table-group-divider" >
	  	<c:forEach var="item" items="${list}" varStatus="status">
		    <tr  class="align-middle">
		      <td scope="col" class="text-center" >${status.count }</td>
		      <td scope="col" class="text-center" ><c:out value="${item.jnl14ReprAcntCd }"/></td>
		      <td scope="col"><c:out value="${item.jnl14ReprAcntNm }"/></td>
		      <td scope="col" class="text-center" ><c:out value="${item.jnl14ListTypeNm }"/></td>
		      <td scope="col" class="text-center" ><c:out value="${item.jnl14MarketTypeNm }"/></td>
		      <td scope="col" class="text-center" ><c:out value="${item.jnl14RealAcntCd }"/></td>
		      <td scope="col"><c:out value="${item.jnl14RealAcntNm }"  /></td>
		      <td scope="col" class="text-end" >
			      <button class="btn btn-primary btn-sm btnModify" 
			      	data-repr-acnt-cd="${item.jnl14ReprAcntCd }"
			      	data-list-type="${item.jnl14ListType }"
			      	data-market-type="${item.jnl14MarketType}" 
			      	>
			      	<span><i class="fa-regular fa-pen-to-square"></i></span> 수정
			      </button>
			      <button class="btn btn-danger btn-sm btnDelete" 
			      	data-repr-acnt-cd="${item.jnl14ReprAcntCd }"
			      	data-list-type="${item.jnl14ListType }"
			      	data-market-type="${item.jnl14MarketType}"
			      	data-repr-acnt-nm="${item.jnl14ReprAcntNm}"
			      >
			      	<span><i class="fa-regular fa-trash-can"></i></span> 삭제</button>		      
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
	console.log('acnt 실계정맵핑 리스트..');
	
	const baseUrl = "/jnl/real-acnt";
	
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
			searchText : $('#searchText').val()
		}
		AssetUtil.submitGet(baseUrl + '/list', data );	
	});
	//초기화
	$('.btnInit').on('click', function(){
		var data = {
				searchText : null
			}
		AssetUtil.submitGet(baseUrl + '/list', data );
	});
	//수정 
	$('.btnModify').on('click', function(e){
 		e.stopPropagation();
 		var cd = $(this).data('repr-acnt-cd');
 		var listType = $(this).data('list-type');
 		var marketType = $(this).data('market-type');

 		var url = baseUrl + "/update";
 		var data = {
 				jnl14ReprAcntCd : cd,
 				jnl14ListType : listType,
 				jnl14MarketType : marketType
 		}
		AssetUtil.submitGet(url, data);
	});	
	//삭제
	$('.btnDelete').on('click', function(e){
 		e.stopPropagation();
 		var cd = $(this).data('repr-acnt-cd');
 		var listType = $(this).data('list-type');
 		var marketType = $(this).data('market-type');
 		var nm = $(this).data('repr-acnt-nm');
 		var msg = nm + "(" + cd + ")";
 		//debugger;
 		var url = baseUrl + '/delete';
 		if (confirm(msg + ' 를 삭제하시겠습니까?')){

 			var data = {
 	 				jnl14ReprAcntCd : cd,
 	 				jnl14ListType : listType,
 	 				jnl14MarketType : marketType
 	 		}
 			
			AssetUtil.submitGet(url, data);
 		}		
	});
}); 
</script>
</body>
</html>