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
<title><c:out value="${pageTitle }" default="계정과목선택" /></title>
</head>
<style>
.table tbody tr.highlight td {
  background-color: #EAF0F7;
}
</style>
<body>
<main class="container-fluid mt-3">
 	<form id="form1" action="/popup/jnl/acnt/${parentCode }" method="GET">
 		<input type="hidden" name="acntCd"   value="${param.acntCd   }"/>
 		<input type="hidden" name="acntNm"   value="${param.acntNm   }"/> 	
 		<input type="hidden" name="pageSize" value="${pageAttr.pageSize }"/>
 		<input type="hidden" name="currentPageNumber" value="1"/>

        <div>
            <input type="text" class="form-control w-50 d-inline align-middle" placeholder="검색어(계정코드/계정코드명)를 입력하세요" id="searchText" name="searchText" value="${param.searchText}">
            <button class="btn d-inline align-middle btn-primary btnRetrieve"><i class="fa-solid fa-search"></i> 조회</button>
            <button class="btn d-inline align-middle btn-success btnInit"><i class="fa-solid fa-backspace"></i> 초기화</button>
        </div>
	</form>

	<table class="table table-hover table-sm jnlTable mt-3" style="font-size:small">
	  <thead class="table-light">
	    <tr class="text-center">
	      <th scope="col" style="width:20px">&nbsp;</th>
	      <th scope="col" style="width:100px">계정코드</th>
	      <th scope="col">계정명</th>
	    </tr>
	  </thead>
	  <tbody class="table-group-divider" >
	  	<c:forEach var="item" items="${list}" varStatus="status">
		    <tr class="align-middle">
		      <td><input type="radio" data-acnt-cd="${item.jnl10AcntCd }" data-acnt-nm="${item.jnl10AcntNm }" id="acnt_${status.count }" name="jnl10AcntCd"/></td>
		      <td class="text-center"><label for="acnt_${status.count }">${item.jnl10AcntCd }</label></td>
		      <td><label for="acnt_${status.count }">${item.jnl10AcntNm }</label></td>
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
    console.log('ready...계정코드팝업');

    //테이블 클릭시 하이라이트 표시
    $('.jnlTable').on('click', 'tbody tr', function(event) {
          $(this).addClass('highlight').siblings().removeClass('highlight');
    });
    
    var acntCd = '<%=request.getParameter("acntCd")%>';
    var acntNm = '<%=request.getParameter("acntNm")%>';
    $('#btnSelect').on('click', function(){
        var count = $('input:radio[name=jnl10AcntCd]:checked').length;
        if(count == 0){
            alert('계정코드를 선택해 주십시오');
            return;
        }
        var $radio = $('input:radio[name=jnl10AcntCd]:checked');
        var cd = $radio.data('acnt-cd');
        var nm = $radio.data('acnt-nm');
        console.log(cd + ", " + nm);
        $(opener.document).find('#'+acntCd).val(cd);
        $(opener.document).find('#'+acntNm).val(nm);
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
</html>