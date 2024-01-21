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
<title><c:out value="${pageTitle}" default="주식매수-리스트" /></title>
<style>
#frDate, #toDate {
    width :120px;
}
.table tbody tr.highlight td {
  background-color: #EAF0F7;
}
</style>
</head>
<body>
<!-- =================================================== -->
<jsp:include page="../common/header.jsp" flush="false" />
<!-- =================================================== -->
<main class="container mx-3 my-3">

    <h2><i class="fa-solid fa-cube my-3"></i> 주식매수 거래내역</h2>

    <div class="container-lg p-3 mb-3 border border-2 rounded-1">
        <span class="align-middle fw-bold">거래일자 </span>
        <input type="text" class="form-control d-inline align-middle text-center dateinput" id="frDate" name="frDate" value="${frDate}">
        <span class="align-middle">~</span>
        <input type="text" class="form-control d-inline align-middle text-center dateinput" id="toDate" name="toDate" value="${toDate}"> 
        <input type="text" class="form-control w-25 d-inline align-middle" placeholder="검색어(펀드/종목/거래구분/매매처) 입력" id="searchText" name="searchText" value="${param.searchText}">
        <a class="btn d-inline align-middle btn-primary btnRetrieve"><i class="fa-solid fa-search"></i> 조회</a>
        <a class="btn d-inline align-middle btn-secondary btnInit"><i class="fa-solid fa-backspace"></i> 초기화</a>
        <a class="btn d-inline align-middle btn-success" href="/opr/buy_insert">  <i class="fa-solid fa-pencil-alt"></i> 매수등록</a>
    </div>

    <table class="table table-sm table-hover mt-3 contTable" style="font-size:small">
      <thead class="table-light">
        <tr class="text-center">
          <th scope="col" style="width:20px">No</th>
          <th scope="col" style="width:90px">거래일자</th>
          <th scope="col">펀드</th>
          <th scope="col">종목</th>
          <th scope="col" style="width:100px">거래구분</th>
          <th scope="col" style="width:70px">수량</th>
          <th scope="col" style="width:70px">단가</th>
          <th scope="col" style="width:100px">약정금액</th>
          <th scope="col" style="width:70px">수수료</th>
          <th scope="col" style="width:100px">결제금액</th>
          <th scope="col" style="width:90px">결제일자</th>
          <th scope="col" style="width:150px">매매처</th>
          <th scope="col" style="width:40px"> </th>
        </tr>
      </thead>
      <tbody class="table-group-divider" >
        <c:forEach var="cont" items="${list}" varStatus="status">
            <tr class="align-middle">
              <td scope="row" class="text-center fw-bold">${status.count }</td>
              <td class="text-center"><asset:displayYmd ymd="${cont.opr01ContDate }"/></td>
              <td>${cont.opr01FundNm }</td>
              <td>${cont.opr01ItemNm }</td>
              <td class="text-center">${cont.opr01TrNm }</td>
              <td class="text-end"><fmt:formatNumber value="${cont.opr01Qty }"       pattern="#,###"/></td>
              <td class="text-end"><fmt:formatNumber value="${cont.opr01Price }"     pattern="#,###"/></td>
              <td class="text-end"><fmt:formatNumber value="${cont.opr01ContAmt }"   pattern="#,###"/></td>
              <td class="text-end"><fmt:formatNumber value="${cont.opr01Fee }"       pattern="#,###"/></td>
              <td class="text-end"><fmt:formatNumber value="${cont.opr01SettleAmt }" pattern="#,###"/></td>
              <td class="text-center"><asset:displayYmd ymd="${cont.opr01SettleDate }"/></td>
              <td>${cont.opr01TrCoNm }</td>
              <td>
                  <button class="btn btn-primary btn-sm btnDetail" data-cont-id="${cont.opr01ContId }"><span><i class="fa-solid fa-search"></i></span></button>
              </td>
            </tr>
        </c:forEach>
      </tbody>
    </table>
          
</main>
<!-- =================================================== -->
<jsp:include page="../common/footer.jsp" flush="false" />
<!-- -================================================== -->
<script type="text/javascript" src="/js/input-format.js"></script>
<script>
$(document).ready(function () {
    console.log('ready...');
    
    //date format set
    $('input.dateinput').inputDateFormat();

    //datepicker셋팅
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
    $('.contTable').on('click', 'tbody tr', function(event) {
        $(this).addClass('highlight').siblings().removeClass('highlight');
    });
    
    //조회버튼 클릭
    $('.btnRetrieve').on('click', function(){
        var frDate = $('#frDate').val();
        var toDate = $('#toDate').val();
        var searchText = $('#searchText').val();
        
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
        
        AssetUtil.submitGet('/opr/buy_list', {frDate: frDate, toDate: toDate, searchText: searchText});
    });
    
    //초기화버튼 클릭
    $('.btnInit').on('click', function(){
        AssetUtil.submitGet('/opr/buy_list', {frDate: AssetUtil.today(), toDate: AssetUtil.today(), searchText: null});
    });
    
    //상세보기
    $('.btnDetail').on('click', function(){
        var contId = $(this).data('cont-id');
        AssetUtil.submitGet('/opr/buy_delete', {opr01ContId: contId});
    });
    
    //조회일자 Default SET
//     $('#frDate').val(AssetUtil.today());
//     $('#toDate').val(AssetUtil.today());
});
</script>
</body>
</html>