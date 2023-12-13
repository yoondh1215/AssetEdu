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
<title><c:out value="${pageTitle}" default="기관선택" /></title>
</head>
<style>
.table tbody tr.highlight td {
  background-color: #EAF0F7;
}
</style>
<body>
<main class="container-fluid mt-3">
 	<form id="form1" action="/popup/corp" method="GET">
 		<input type="hidden" name="corpCd" value="${param.corpCd }"/>
 		<input type="hidden" name="corpNm" value="${param.corpNm }"/>
 		<input type="hidden" name="pageSize" value="${pageAttr.pageSize }"/>
<%--  		<input type="hidden" name="currentPageNumber" value="${pageAttr.currentPageNumber }"/> --%>
 		<input type="hidden" name="currentPageNumber" value="1"/>

        <div>
            <input type="text" class="form-control w-50 d-inline align-middle" placeholder="검색어(기관코드/기관명)를 입력하세요" id="searchText" name="searchText" value="${param.searchText}">
            <button class="btn d-inline align-middle btn-primary btnRetrieve"><i class="fa-solid fa-search"></i> 조회</button>
            <button class="btn d-inline align-middle btn-success btnInit"><i class="fa-solid fa-backspace"></i> 초기화</button>
        </div>
	</form>

	<table class="table table-hover table-sm corpTable" style="font-size:small">
	  <thead class="table-light">
	    <tr class="text-center">
	      <th scope="col" style="width:20px">&nbsp;</th>
	      <th scope="col" style="width:90px">기관구분</th>
          <th scope="col" style="width:80px">기관코드</th>
	      <th scope="col">기관명</th>
	      <th scope="col">기관영문명</th>
	    </tr>
	  </thead>
	  <tbody class="table-group-divider" >
	  	<c:forEach var="corp" items="${list}" varStatus="status"> 
		    <tr class="align-middle">
		      <td><input type="radio" data-com01-corp-cd="${corp.com01CorpCd }" data-com01-corp-nm="${corp.com01CorpNm }" id="com01CorpCd_${status.count }" name="com01CorpCd"/></td>
              <td class="text-center"><label for="com01CorpTypeNm_${status.count }">${corp.com01CorpTypeNm }</label></td>
              <td class="text-center"><label for="com01CorpCd_${status.count }">${corp.com01CorpCd }</label></td>
		      <td>                    <label for="com01CorpCd_${status.count }">${corp.com01CorpNm }</label></td>
		      <td>                    <label for="com01CorpCd_${status.count }">${corp.com01CorpEnm }</label></td>
		    </tr>
	    </c:forEach>
	  </tbody>
	</table>

	<div class="container-fluid mb-3" style="position:absolute;bottom:0;left:0">
        <hr>
        <div class="row">
            <div class="col"><kfs:Pagination pageAttr="${pageAttr }" id="pageAttr"></kfs:Pagination> </div>
            <div class="col"><kfs:PageInfo pageAttr="${pageAttr }" id="pageAttr"></kfs:PageInfo> </div>
        </div>

        <div class="footer-menu text-center">
            <button type="button" id="btnSelect" class="btn btn-primary" >선택</button>
            <button type="button" id="btnCancel"  class="btn btn-secondary">닫기</button>
        </div> 
    </div>
</main>
<!-- =================================================== -->
<jsp:include page="../common/footer.jsp" flush="false" />
<!-- -================================================== -->
<script>
$(document).ready(function () {
	console.log('ready...기관선택팝업');

    //테이블 클릭시 하이라이트 표시
    $('.corpTable').on('click', 'tbody tr', function(event) {
          $(this).addClass('highlight').siblings().removeClass('highlight');
    });
	
	var corpCd = '<%=request.getParameter("corpCd")%>';
	var corpNm = '<%=request.getParameter("corpNm")%>';
	$('#btnSelect').on('click', function(){
		var count = $('input:radio[name=com01CorpCd]:checked').length;
		if(count == 0){
			alert('기관을 선택해 주십시오');
			return;
		}
		var $radio = $('input:radio[name=com01CorpCd]:checked');
		var cd = $radio.data('com01-corp-cd');
		var nm = $radio.data('com01-corp-nm');
		console.log(cd + ", " + nm);
		$(opener.document).find('#'+corpCd).val(cd);
		$(opener.document).find('#'+corpNm).val(nm);
		window.close();
	});
	$('#btnCancel').click(()=>window.close());
	$('.btnInit').on('click', function(){
        $('#searchText').val(''); 
        $('#form1').submit();
    });
    $('.btnRetrieve').on('click', function(){
        $('#form1').submit();
    });
});
function goPageClick(pageNo){
	$('#form1 input[name=currentPageNumber]').val(pageNo);
	$('#form1').submit();
}
</script>	
</body>
</html>