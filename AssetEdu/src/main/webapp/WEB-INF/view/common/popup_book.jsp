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
<title><c:out value="${pageTitle}" default="보유종목선택" /></title>
</head>
<style>
.table tbody tr.highlight td {
  background-color: #EAF0F7;
}
</style>
<body>
<main class="container-fluid mt-3">
 	<form id="form1" action="/popup/book" method="GET">
        <input type="hidden" name="bookId"   value="${param.bookId }"/>
        <input type="hidden" name="fundCd"   value="${param.fundCd }"/>
        <input type="hidden" name="fundNm"   value="${param.fundNm }"/>
        <input type="hidden" name="itemCd"   value="${param.itemCd }"/>
        <input type="hidden" name="itemNm"   value="${param.itemNm }"/>
        <input type="hidden" name="holdQty"  value="${param.holdQty }"/>
 		<input type="hidden" name="pageSize" value="${pageAttr.pageSize }"/>
<%--  		<input type="hidden" name="currentPageNumber" value="${pageAttr.currentPageNumber }"/> --%>
 		<input type="hidden" name="currentPageNumber" value="1"/>

        <div>
            <input type="text" class="form-control w-50 d-inline align-middle" placeholder="검색어(펀드/종목/보유ID)를 입력하세요" id="searchText" name="searchText" value="${param.searchText}">
            <button class="btn d-inline align-middle btn-primary btnRetrieve"><i class="fa-solid fa-search"></i> 조회</button>
            <button class="btn d-inline align-middle btn-success btnInit"><i class="fa-solid fa-backspace"></i> 초기화</button>
        </div>
	</form>

	<table class="table table-hover table-sm bookTable" style="font-size:small">
	  <thead class="table-light">
	    <tr class="text-center">
	      <th scope="col" style="width:20px">&nbsp;</th>
	      <th scope="col">펀드</th>
	      <th scope="col">종목</th>
	      <th scope="col" style="width:100px">보유수량</th>
          <th scope="col" style="width:110px">장부금액</th>
	      <th scope="col" style="width:110px">보유ID</th>
	    </tr>
	  </thead>
	  <tbody class="table-group-divider" >
	  	<c:forEach var="book" items="${list}" varStatus="status"> 
		    <tr class="align-middle">
		      <td>
		      	<input type="radio" data-bok01-book-id="${book.bok01BookId }" 
		      		                data-bok01-fund-cd="${book.fnd01FundCd }"
		      		                data-bok01-fund-nm="${book.fnd01FundNm }"
		      		                data-bok01-item-cd="${book.itm01ItemCd }"
		      		                data-bok01-item-nm="${book.itm01ItemNm }"
		      		                data-bok01-hold-qty="${book.bok01HoldQty }"
		      		                id="bok01bookId_${status.count }" name="bok01bookId"/>
		      </td>
		      <td><label for="bok01bookId_${status.count }">${book.fnd01FundNm }</label></td>
		      <td><label for="bok01bookId_${status.count }">${book.itm01ItemNm }</label></td>
		      <td class="text-end"><label for="bok01bookId_${status.count }"><fmt:formatNumber value="${book.bok01HoldQty }" pattern="#,###"/></label></td>
              <td class="text-end"><label for="bok01bookId_${status.count }"><fmt:formatNumber value="${book.bok01BookAmt }" pattern="#,###"/></label></td>
		      <td class="text-center"><label for="bok01bookId_${status.count }">${book.bok01BookId }</label></td>
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
	console.log('ready...보유종목 선택팝업');

    //테이블 클릭시 하이라이트 표시
    $('.bookTable').on('click', 'tbody tr', function(event) {
          $(this).addClass('highlight').siblings().removeClass('highlight');
    });
	
	var bookId  = '<%=request.getParameter("bookId")%>';
	var fundCd  = '<%=request.getParameter("fundCd")%>';
	var fundNm  = '<%=request.getParameter("fundNm")%>';
	var itemCd  = '<%=request.getParameter("itemCd")%>';
	var itemNm  = '<%=request.getParameter("itemNm")%>';
	var holdQty = '<%=request.getParameter("holdQty")%>';
	
	$('#btnSelect').on('click', function(){
		var count = $('input:radio[name=bok01bookId]:checked').length;
		if(count == 0){
			alert('종목을 선택해 주십시오');
			return;
		}
		var $radio = $('input:radio[name=bok01bookId]:checked');
		var val_bookId  = $radio.data('bok01-book-id');	
		var val_fundCd  = $radio.data('bok01-fund-cd');
		var val_fundNm  = $radio.data('bok01-fund-nm');
		var val_itemCd  = $radio.data('bok01-item-cd');
		var val_itemNm  = $radio.data('bok01-item-nm');
		var val_holdQty = $radio.data('bok01-hold-qty');

		$(opener.document).find('#'+bookId).val(val_bookId);
		$(opener.document).find('#'+fundCd).val(val_fundCd);
		$(opener.document).find('#'+fundNm).val(val_fundNm);
		$(opener.document).find('#'+itemCd).val(val_itemCd);
		$(opener.document).find('#'+itemNm).val(val_itemNm);
		$(opener.document).find('#'+holdQty).val(AssetUtil.displayComma(val_holdQty));
		
		window.close();
	});
	
	$('#btnCancel').click(()=>window.close());
	
	$('#btnInit').click(function(){
		$('#searchText').val(''); 
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