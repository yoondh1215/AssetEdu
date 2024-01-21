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
<title><c:out value="${pageTitle}" default="펀드선택" /></title>
</head>
<style>
.table tbody tr.highlight td {
  background-color: #EAF0F7;
}
</style>
<body>
<main class="container-fluid mt-3">
 	<form id="form1" action="/popup/fund" method="GET">
 		<input type="hidden" name="fundCd"   value="${param.fundCd   }"/>
 		<input type="hidden" name="fundNm"   value="${param.fundNm   }"/>
        <input type="hidden" name="parentYn" value="${param.parentYn }"/>
 		<input type="hidden" name="pageSize" value="${pageAttr.pageSize }"/>
<%--  		<input type="hidden" name="currentPageNumber" value="${pageAttr.currentPageNumber }"/> --%>
 		<input type="hidden" name="currentPageNumber" value="1"/>

        <div>
            <input type="text" class="form-control w-50 d-inline align-middle" placeholder="검색어(펀드코드/펀드명)를 입력하세요" id="searchText" name="searchText" value="${param.searchText}">
            <button class="btn d-inline align-middle btn-primary btnRetrieve"><i class="fa-solid fa-search"></i> 조회</button>
            <button class="btn d-inline align-middle btn-success btnInit"><i class="fa-solid fa-backspace"></i> 초기화</button>
        </div>
	</form>

	<table class="table table-hover table-sm fundTable" style="font-size:small">
	  <thead class="table-light">
	    <tr class="text-center">
	      <th scope="col" style="width:20px">&nbsp;</th>
	      <th scope="col" style="width:100px">펀드코드</th>
	      <th scope="col">펀드명</th>
	    </tr>
	  </thead>
	  <tbody class="table-group-divider" >
	  	<c:forEach var="fund" items="${list}" varStatus="status"> 
		    <tr class="align-middle">
		      <td><input type="radio" data-fnd01-fund-cd="${fund.fnd01FundCd }" data-fnd01-fund-nm="${fund.fnd01FundNm }" id="fnd01FundCd_${status.count }" name="fnd01FundCd"/></td>
		      <td class="text-center"><label for="fnd01FundCd_${status.count }">${fund.fnd01FundCd }</label></td>
		      <td><label for="fnd01FundCd_${status.count }">${fund.fnd01FundNm }</label></td>
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
    console.log('ready...펀드선택팝업');

    //테이블 클릭시 하이라이트 표시
    $('.fundTable').on('click', 'tbody tr', function(event) {
          $(this).addClass('highlight').siblings().removeClass('highlight');
    });
    
    var fundCd = '<%=request.getParameter("fundCd")%>';
    var fundNm = '<%=request.getParameter("fundNm")%>';
    $('#btnSelect').on('click', function(){
        var count = $('input:radio[name=fnd01FundCd]:checked').length;
        if(count == 0){
            alert('펀드를 선택해 주십시오');
            return;
        }
        var $radio = $('input:radio[name=fnd01FundCd]:checked');
        var cd = $radio.data('fnd01-fund-cd');
        var nm = $radio.data('fnd01-fund-nm');
        console.log(cd + ", " + nm);
        $(opener.document).find('#'+fundCd).val(cd);
        $(opener.document).find('#'+fundNm).val(nm);
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