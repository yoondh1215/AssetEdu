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
<title><c:out value="${pageTitle}" default="거래유형별 분개맵핑-리스트" /></title>
</head>
<style>
.table tbody tr.highlight td {
  background-color: #EAF0F7;
}
.table tbody tr.subSumTr td {
  background-color: #FAF4F4;
}
@media (min-width: 100%) {
    .container{
        max-width: 90%;
    }
}
</style>
<body>
<!-- =================================================== -->
<jsp:include page="../../common/header.jsp" flush="false" />
<!-- =================================================== -->
<c:set var="baseUrl" value="/jnl/trmap"/>
<main class="container mx-3 my-3" >

	<h2><i class="fa-solid fa-cube my-3"></i> 거래유형별 분개맵핑</h2>

	<div class="container-lg p-3 border border-2 rounded-1">
		<input type="text" class="form-control w-50 d-inline align-middle" placeholder="검색어(거래코드/거래명)를 입력하세요" id="searchText" name="searchText" value="${param.searchText}">
		<a class="btn d-inline align-middle btn-primary btnRetrieve"><i class="fa-solid fa-search"></i> 조회</a>
        <a class="btn d-inline align-middle btn-secondary btnInit"><i class="fa-solid fa-backspace"></i> 초기화</a>
	</div>
	
	<div class="row">
		<div class="col-5 tr12 py-3">
		<table id="table12" class="table table-hover table-bordered table-sm" style="font-size:small">
			  <thead class="table-light">
			    <tr class="text-center align-middle">
			      <th scope="col" style="width:50px">No</th>
			      <th scope="col" style="width:70px">거래코드</th>
			      <th scope="col">거래명</th>
			      <th scope="col" style="width:100px">입출고구분</th>
			      <th scope="col" style="width:85px">사용여부</th>
			      <th scope="col" style="width:80px">
			         <button class="btn btn-success btn-sm btnDisplayEditTr12"><span><i class="fa-regular fa-pen-to-square"></i> 추가</span></button>
<!-- 			      	<a class="d-inline  btn btn-success btnDisplayEditTr12"> -->
<!-- 			      		<span title="거래코드 추가"><i class="fa-sharp fa-solid fa-plus"></i></span> -->
<!-- 			      	</a> -->
			      </th>
			    </tr>
			  </thead>
			  <tbody class="table-group-divider" >
			  	<c:forEach var="item" items="${list12}" varStatus="status">
				    <tr data-tr-cd="${item.jnl12TrCd }" data-tr-nm="${item.jnl12TrNm }" class="align-middle">
				      <td scope="col" class="text-center" >${status.count }</td>
				      <td scope="col" class="text-center" ><c:out value="${item.jnl12TrCd }"/></td>
				      <td scope="col" class="text-start"  ><c:out value="${item.jnl12TrNm }"/></td>
				      <td scope="col" class="text-center" ><c:out value="${item.jnl12InOutTypeNm }"/></td>
				      <td scope="col" class="text-center" ><c:out value="${item.jnl12UseYn }"/></td>
				      <td scope="col" class="text-center">
					      <button class="btn btn-primary btn-sm btnModify12" data-tr-cd="${item.jnl12TrCd}"><span title="수정"><i class="fa-regular fa-pen-to-square"></i></span></button>
					      <button class="btn btn-danger btn-sm btnDelete12" data-tr-cd="${item.jnl12TrCd}" data-tr-nm="${item.jnl12TrNm}"><span title="삭제"><i class="fa-regular fa-trash-can"></i></span></button>		      
				      </td>
				    </tr>
			    </c:forEach>
			  </tbody>
			</table>
		</div>
		<div class="col-7 tr13  py-3 px-3">
			<table id="table13" class="table table-hover table-bordered table-sm" style="font-size:small">
			  <thead class="table-light">
			    <tr class="text-center align-middle">
<!-- 			      <th scope="col" style="width:8%">No</th> -->
<!-- 			      <th scope="col" style="width:9%">순번</th> -->
<!-- 			      <th scope="col" style="width:33%">대표계정명</th> -->
<!-- 			      <th scope="col" style="width:12%">차대구분</th> -->
<!-- 			      <th scope="col" style="width:28%">계산식</th> -->

                  <th scope="col" style="width:70px">No</th>
                  <th scope="col" style="width:50px">순번</th>
                  <th scope="col">대표계정명</th>
                  <th scope="col" style="width:100px">차대구분</th>
                  <th scope="col">계산식</th>
			      <th scope="col" style="width:80px">
                      <button class="btn btn-success btn-sm btnDisplayEditTr13"><span><i class="fa-regular fa-pen-to-square"></i> 추가</span></button>
			      </th>
			    </tr>
			  </thead>
			  <tbody class="table-group-divider" >
			  	<!-- 이곳에 Ajax로 가져온 데이터를 출력 -->
			  </tbody>
			</table>
		</div>
	</div>
  
</main>

<script id="table12-tr-list-template" type="text/x-handlebars-template">
<!-- jnl12Tr 리스트 TR -->
{{#each list}}
<tr data-tr-cd="{{jnl12TrCd }}" data-tr-nm="{{jnl12TrNm }}" class="align-middle">
  <td scope="col" class="text-center">{{inc @index}}</td>
  <td scope="col" class="text-center">{{jnl12TrCd}}</td>
  <td scope="col">{{jnl12TrNm}}</td>
  <td scope="col" class="text-center">{{jnl12InOutTypeNm}}</td>
  <td scope="col" class="text-center">{{jnl12UseYn}}</td>
  <td scope="col">
      <button class="btn btn-primary btn-sm btnModify12" data-tr-cd="{{jnl12TrCd}}"><span><i class="fa-regular fa-pen-to-square"></i></span></button>
      <button class="btn btn-danger btn-sm btnDelete12" data-tr-cd="{{jnl12TrCd}}" data-tr-nm="{{jnl12TrNm }}"><span><i class="fa-regular fa-trash-can"></i></span></button>		      
  </td>
</tr>
 {{/each}}
</script>

<script id="table12-tr-form-template" type="text/x-handlebars-template">
<!-- jnl12Tr 편집(수정,추가) TR -->
<tr id="tr12-grid" class="align-middle">
  <td scope="col" class="text-center fw-bolder">{{mode-name}}</td>
  <td scope="col"><input type="text" name="jnl12TrCd" value="{{jnl12TrCd}}"  class="form-control form-control-sm" maxlength="4" /></td>
  <td scope="col"><input type="text" name="jnl12TrNm" value="{{jnl12TrNm}}"  class="form-control form-control-sm"/></td>
  <td scope="col">
	<!--input type="text" name="jnl12InOutType" value="{{jnl12InOutType}}" /-->
	<select name="jnl12InOutType" class="form-select form-select-sm">
		<option value=""></option>
		<option value="1" {{#cond jnl12InOutType '==' '1'}}selected{{/cond}}>입고</option>
		<option value="2" {{#cond jnl12InOutType '==' '2'}}selected{{/cond}}>출고</option>
		<option value="3" {{#cond jnl12InOutType '==' '3'}}selected{{/cond}}>평가</option>
    </select>
  </td>
  <td scope="col">
		<!-- input type="text" name="jnl12UseYn" value="{{jnl12UseYn}}"/ -->
	<div class="form-check">
		<input type="radio" class="form-check-input form-check-input-sm" name="jnl12UseYn" id="jnl12UseYn1" value="true" {{#cond jnl12UseYn '==' 'true'}}checked{{/cond}}/> <label for="jnl12UseYn1" class="form-check-label">사용</label>&nbsp;
	</div>
	<div class="form-check">
		<input type="radio" class="form-check-input" name="jnl12UseYn" id="jnl12UseYn2" value="false" {{#cond jnl12UseYn '==' 'false'}}checked{{/cond}}/> <label for="jnl12UseYn2"  class="form-check-label">사용안함</label>
	</div>
  </td>
  <td scope="col" class="form-control text-center">
      <button class="btn btn-primary btn-sm btnSaveGrid" data-mode="{{mode-name}}"><span><i class="fa-solid fa-database"></i></span></button>
      <button class="btn btn-danger btn-sm btnCancelGrid" data-mode="{{mode-name}}"><span><i class="fa-solid fa-xmark"></i></span></button>		      
  </td>
</tr>
</script>
<script id="table13-tr-list-template" type="text/x-handlebars-template">
<!-- jnl13Tr 리스트 TR -->
{{#each list}}
<tr class="align-middle">
  <td scope="col" class="text-center">{{inc @index}}</td>
  <td scope="col" class="text-center" >{{jnl13Seq }}</td>
  <td scope="col">
     <input type="hidden" value="{{jnl13ReprAcntCd}}" />
     {{jnl11ReprAcntNm }}
  </td>
  <td scope="col" class="text-center" >{{jnl13DrcrTypeNm }}</td>
  <td scope="col">{{jnl13Formula }}</td>
  <td scope="col" class="text-center">
	  <button class="btn btn-primary btn-sm btnModify" data-tr-nm="{{jnl11ReprAcntNm}}" data-tr-cd="{{jnl13TrCd }}" data-seq="{{jnl13Seq }}"><span title="수정"><i class="fa-regular fa-pen-to-square"></i></span></button>
	  <button class="btn btn-danger btn-sm btnDelete" data-tr-cd="{{jnl13TrCd }}" data-seq="{{jnl13Seq }}"><span title="삭제"><i class="fa-regular fa-trash-can"></i></span></button>		      
  </td>
</tr>
 {{/each}}
</script>
<script id="table13-tr-form-template" type="text/x-handlebars-template">
<!-- jnl13Tr 편집(수정,추가) TR -->
<tr id="tr13-grid" class="align-middle">
  <td scope="col" class="text-center">{{jnl13TrCd}}<br/>[{{jnl13TrNm}}]</td>
  {{#cond mode '==' '추가'}}  
  <td scope="col"><input type="text" name="jnl13Seq" value="{{jnl13Seq }}" class="form-control form-control-sm" /></td>
  {{else}}
  <td scope="col" class="text-center">{{jnl13Seq}}</td>
  {{/cond}}
  <td scope="col">
	<div class="d-flex">
     <button class="btn btn-outline-secondary btn-sm text-warning bg-secondary" type="button" id="jnl13ReprAcntCdPopup"><i class="fa-solid fa-search"></i></button>
     <input type="hidden" id="jnl13ReprAcntCd" name="jnl13ReprAcntCd" value="{{jnl13ReprAcntCd}}" />
     <input  type="text" id="jnl13ReprAcntNm" name="jnl13ReprAcntNm" value="{{jnl11ReprAcntNm}}" class="form-control form-control-sm" readonly="true" style="background-color:#F5F5F5"/>
  </div>
  </td>
  <td scope="col">
	<!--input type="text"  name="jnl13DrcrType" value="{{jnl13DrcrType }}" /-->
	<select name="jnl13DrcrType" class="form-select form-select-sm">
		<option value=""selected></option>
		<option value="D" {{#cond jnl13DrcrType '==' 'D'}}selected{{/cond}}>차변</option>
		<option value="C" {{#cond jnl13DrcrType '==' 'C'}}selected{{/cond}}>대변</option>
    </select>

  </td>
  <td scope="col"><input type="text"  name="jnl13Formula" value="{{jnl13Formula }}"  class="form-control form-control-sm" /></td>
  <td scope="col" class="text-end">
	  <button class="btn btn-primary btn-sm btnSave13" data-mode="{{mode}}" data-tr-cd="{{jnl13TrCd }}" data-seq="{{jnl13Seq }}"><span title="저장"><i class="fa-solid fa-database"></i></span></button>
	  <button class="btn btn-danger btn-sm btnCancel13" data-mode="{{mode}}" data-tr-cd="{{jnl13TrCd }}" data-seq="{{jnl13Seq }}"><span title="취소"><i class="fa-solid fa-xmark"></i></span></button>		      
  </td>
</tr>
</script>

<!-- =================================================== -->
<jsp:include page="../../common/footer.jsp" flush="false" />
<!-- -================================================== -->
<script type="text/javascript" src="/js/input-format.js"></script>
<script>
$(document).ready(function () {
	console.log('acnt 거래유형별 분개맵핑 리스트..');
	
	var highlightCssName = 'highlight';//'table-danger' ;
	
	function generateHtml(templateId, data){
		var template = $(templateId).html();
		var compiledTemplate =  Handlebars.compile(template);
		return html = compiledTemplate(data);
	}
	
	const baseUrl = "/jnl/trmap";
	
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
	function makeTbody13(trCd){
	  var url = baseUrl + "/jnl13/" + trCd;
	  $.get(url, function(response, status){
		  console.log(response);
		  makeTbody13List(response.list)
	  });
	}
	function makeTbody13List(list){
		var $table13Body = $('#table13 tbody');
		var html = '';
		if(list.length == 0){
			html = '<tr class="table-warning text-center"><td colspan="6">매핑데이터가 없습니다</td></tr>';
		}else{
			html = generateHtml('#table13-tr-list-template', {list:list});
		}
		console.log(html);
		$table13Body.html(html);			
	}
	
    //거래 테이블 클릭시 하이라이트 표시 & 분개맵핑 조회
    $('#table12').on('click', 'tbody tr', function(event) {
    	event.stopPropagation();
    	//만약 편집중이라면 해제한다.
    	if($(this).find(".btnCancelGrid").length == 1) return;
    	$('#table12').find(".btnCancelGrid").trigger('click');
    	$('#table13').find(".btnCancel13").trigger('click');
    	
        $(this).addClass(highlightCssName)
        	   .siblings().removeClass(highlightCssName);
        var trCd = $(this).data('tr-cd');
        makeTbody13(trCd);
    });
	
    //분개캡핑 테이블 클릭시 하이라이트 표시
    $('#table13').on('click', 'tbody tr', function(event) {
        event.stopPropagation();
        //만약 편집중이라면 해제한다.
        if($(this).find(".btnCancel13").length == 1) return;
        $('#table13').find(".btnCancel13").trigger('click');
        
        $(this).addClass(highlightCssName)
               .siblings().removeClass(highlightCssName);
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
	//---------------------------------------------------------------
	//list 로 tr들을 만듬	
	function makeTbody12(list){
		var $table12Body = $('#table12 tbody');
		var template = $('#table12-tr-list-template').html();
		var compiledTemplate =  Handlebars.compile(template)
		var html = compiledTemplate({list:list});
		console.log(html);
		$table12Body.html(html);		
	}
	//trlist의 수정버튼
	$('#table12 tbody').on('click', '.btnModify12', function(){
		var $this = $(this);
		var trCd= $this.data('tr-cd');
		var data = null;
		var url = baseUrl+"/jnl12tr/" + trCd;
		$.ajax({
		    url: url, // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
		    data: data,  // HTTP 요청과 함께 서버로 보낼 데이터
		    method: "GET",   // HTTP 요청 메소드(GET, POST 등)
		    dataType: "json" // 서버에서 보내줄 데이터의 타입
		})
		// HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
		.done(function(response) {
			var $table12Body = $('#table12 tbody');
	 		var template = $('#table12-tr-form-template').html();
	 		var compiledTemplate =  Handlebars.compile(template);
	 		var jnl12Tr = response.jnl12Tr;
	 		var data = {
	 			'mode-name' : '수정',
	 			jnl12TrCd : jnl12Tr.jnl12TrCd,
	 			jnl12TrNm : jnl12Tr.jnl12TrNm,
	 			jnl12InOutType : jnl12Tr.jnl12InOutType,
	 			jnl12UseYn : jnl12Tr.jnl12UseYn
	 		}		
	 		//debugger;
	 		let html = compiledTemplate(data);
	 		console.log(html);
	 		//1. 자신을 찾아서 html을 localStorage에 저장
	 		//2. html을 자신 앞에 추가 
	 		//3. 자신을 삭제
	 		var $tr = $this.closest("tr");
	 		var nowTrHtml =  $tr.wrap('<p/>').parent().html();
	 		localStorage.setItem("editTr", nowTrHtml);
	 		$tr.unwrap();
	 		//핸들바로 만든 것을 앞에 넣고 자신은 remove한다
	 		$tr.before(html);
	 		$tr.remove();
		})
		// HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
		.fail(function(xhr, status, errorThrown) {
			console.log(xhr);
			console.log(status);
		})
		// 성공하든 실패하든 호출됨 
		.always(function(xhr, status) {
			console.log('always')
		});		
	});
	//trlist의 삭제버튼
	$('#table12 tbody').on('click', '.btnDelete12', function(){
		var $this = $(this);
		var trCd= $this.data('tr-cd');
		var trNm= $this.data('tr-nm');
		if(confirm(trNm + " 을 삭제하시겠습니까?") === false) return;
		var data = null;
		var url = baseUrl+"/jnl12tr/" + trCd;
		$.ajax({
		    url: url, // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
		    data: data,  // HTTP 요청과 함께 서버로 보낼 데이터
		    method: "DELETE",   // HTTP 요청 메소드(GET, POST 등)
		    dataType: "json" // 서버에서 보내줄 데이터의 타입
		})
		// HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
		.done(function(response) {
			makeTbody12(response.list);
		})
		// HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
		.fail(function(xhr, status, errorThrown) {
			console.log(xhr);
			console.log(status);
		})
		// 성공하든 실패하든 호출됨 
		.always(function(xhr, status) {
			console.log('always')
		});
		
	});

	//버튼들을 동작하지 않게한다
	// diable true or false
	function buttonsDisEnable(disable){
		
		$('.tr12').find("button, a").attr("disabled", disable);

		$('.tr13').find("button, a").attr("disabled", disable);
		
		if(disable){
			$('.btnDisplayEditTr13, .btnDisplayEditTr12').addClass('disabled');	
		}else {
			$('.btnDisplayEditTr13, .btnDisplayEditTr12').removeClass('disabled');
		}
		
	}
	//InsertTr12 등록 버튼 
	$('.btnDisplayEditTr12').click(function(e){
		e.preventDefault();
		e.stopPropagation();
	
		buttonsDisEnable(true);		
		
		//$('.tr12').removeClass('col-6').addClass('col-12');
		//$table12Body.empty();
		var $table12Body = $('#table12 tbody');
 		var template = $('#table12-tr-form-template').html();
 		var compiledTemplate =  Handlebars.compile(template);
 			
 		let html = compiledTemplate({'mode-name' : '추가', 'jnl12UseYn': 'true'});		
		$table12Body.prepend(html);
	});
	//grid추가
	$('#table12 tbody').on('click', '#tr12-grid .btnSaveGrid', function(){
		console.log('grid tr12 edit save clicked');
		var mode = $(this).data('mode');
		var jnl12TrCd =$('#tr12-grid').find('input[name=jnl12TrCd]').val(); 
		var jnl12TrNm =$('#tr12-grid').find('input[name=jnl12TrNm]').val(); 
		var jnl12InOutType =$('#tr12-grid').find('select[name=jnl12InOutType]').val(); 
		var jnl12UseYn =$('#tr12-grid').find('input[name=jnl12UseYn]:checked').val();
		//valid check
		if(jnl12TrCd.length == 4 &&  /^\d+$/.test(jnl12TrCd)){;}
		else{ alert('거래코드는 4자리 숫자입니다'); return;}
		if(jnl12TrNm.length < 1){
			alert('거래명을 넣어주십시오'); return;	
		}
		var searchText=$("#searchText").val();
		var json = { 
						jnl12TrCd:jnl12TrCd,
						jnl12TrNm:jnl12TrNm, 
						jnl12InOutType:jnl12InOutType, 
						jnl12UseYn:jnl12UseYn
				  };
		var json = JSON.stringify(json);
		var url = baseUrl + "/tr12/insert?searchText=" + searchText;
		if(mode === '수정'){
			url = baseUrl + "/tr12/update?searchText=" + searchText;
		}
 		AssetUtil.ajax(url, json, 
 			{
 				method:'POST', 
 				success:(response)=>{
		 			if(response.result == 'OK'){
		 				console.log(response);
		 				alert('저장되었습니다.');
		 				$('#tr12-grid .btnCancelGrid').trigger('click');

		 		 		makeTbody12(response.list);
		 			}else{
		 				console.log(response)
		 				alert("저장에 실패하였습니다 " + response.msg);
		 			}
 				},
 				 error: function (request, status, error) {
 					// debugger;
 			        console.log("code: " + request.status)
 			        console.log("message: " + request.responseText)
 			        console.log("error: " + error);
 			        alert("error: " + error);
 			        $('#tr12-grid .btnCancelGrid').trigger('click');
 			     }
 			}
 	   );
	});
	//편집모드에서의 cancel
	$('#table12 tbody').on('click', '#tr12-grid .btnCancelGrid', function(){
		console.log('grid tr12 edit cancel clicked');
		var mode= $(this).data('mode');
		if(mode == "추가"){
			$('#tr12-grid').remove();
		}else if(mode == "수정"){
			//저장된 것을 넣고 자신은 삭제
			var html = localStorage.getItem('editTr');
			$('#tr12-grid').before(html);
			$('#tr12-grid').remove();
		}		
		//버튼들 활성화
		buttonsDisEnable(false);

	});
	
	//--------------- TR13
	//등록버튼
	$('.btnDisplayEditTr13').on('click', function(e){
		e.preventDefault();
		e.stopPropagation();
	
		buttonsDisEnable(true);	
		$(this).attr('disabled', true);
		
		var $tbody = $('#table12 tbody');
		var $tr = $('#table12 > tbody').find('tr.'+highlightCssName);
		var trCd = $tr.data('tr-cd');
		var trNm = $tr.data('tr-nm');
		if(!trCd){
			console.log('not selected trcd');
			buttonsDisEnable(false);
			alert("거래코드를 선택해 주십시오");
			return;
		}
		var data = {
				mode:'추가',	jnl13TrCd : trCd, jnl13TrNm: trNm
		};
		$tbody = $('#table13 tbody');
		var html = generateHtml('#table13-tr-form-template', data);		
		$tbody.prepend(html);		
	});
	//수정버튼
	$('#table13').on('click', '.btnModify', function(e){
		e.preventDefault();
		e.stopPropagation();
		var $this = $(this);
		buttonsDisEnable(true);	
		
		
		var $tbody = $('#table13 tbody');
		var trCd = $this.data('tr-cd');
		var trSeq = $this.data('seq');
		var url = baseUrl + "/jnl13tr/" + trCd + "/" + trSeq;
		$.get(url, function(response, status){
			console.log(response);
			var data = response.jnl13TrMap;
			data.mode = '수정';
			var html = generateHtml('#table13-tr-form-template', data);
	 		var $tr = $this.closest("tr");
	 		var nowTrHtml =  $tr.wrap('<p/>').parent().html();
	 		localStorage.setItem("editTr13", nowTrHtml);
	 		$tr.unwrap();
	 		//핸들바로 만든 것을 앞에 넣고 자신은 remove한다
	 		$tr.before(html);
	 		$tr.remove();			
		});
		
	});	
	//list에서 삭제버튼
	$('#table13').on('click', '.btnDelete', function(){
		var $this = $(this);
		var trCd= $this.data('tr-cd');
		var trSeq= $this.data('seq');
		if(confirm("거래코드 : " + trCd + ", Seq : " + trSeq + " 을(를) 삭제하시겠습니까?") === false) return;
		var data = null;
		var url = baseUrl+"/jnl13tr/" + trCd + "/" + trSeq;
		$.ajax({
		    url: url, // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
		    data: data,  // HTTP 요청과 함께 서버로 보낼 데이터
		    method: "DELETE",   // HTTP 요청 메소드(GET, POST 등)
		    dataType: "json" // 서버에서 보내줄 데이터의 타입
		})
		// HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
		.done(function(response) {
			makeTbody13List(response.list);
		})
		// HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
		.fail(function(xhr, status, errorThrown) {
			console.log(xhr);
			console.log(status);
		})
		// 성공하든 실패하든 호출됨 
		.always(function(xhr, status) {
			console.log('always')
		});
		
	});
	//Edit에서 cancel
	$('#table13').on('click', '.btnCancel13', function(){
		console.log('tr13 cancel button clicked');
		var mode= $(this).data('mode');
		if(mode == "추가"){
			$('#tr13-grid').remove();
		}else if(mode == "수정"){
			//저장된 것을 넣고 자신은 삭제
			var html = localStorage.getItem('editTr13');
			$('#tr13-grid').before(html);
			$('#tr13-grid').remove();
		}		
		//버튼들 활성화
		buttonsDisEnable(false);
	});
	
	//edit에서 저장 버튼
	$('#table13').on('click', '.btnSave13', function(){
		console.log('tr13 save button clicked');
		var mode = $(this).data('mode');
		var $tr = $('#tr13-grid');

		var jnl13TrCd = $(this).data('tr-cd');
		var jnl13Seq;
		if(mode == '수정'){
			jnl13Seq = $(this).data('seq');
		}else {
			jnl13Seq =$tr.find('input[name=jnl13Seq]').val();
		}
		var jnl13ReprAcntCd =$tr.find('input[name=jnl13ReprAcntCd]').val(); 
		var jnl13DrcrType =$tr.find('select[name=jnl13DrcrType]').val(); 
		var jnl13Formula =$tr.find('input[name=jnl13Formula]').val();
		//debugger;
		if(jnl13Seq.length < 1) {
			alert('순번를 넣어주십시오'); return;
		}
		if(jnl13ReprAcntCd.length < 1){
			alert('대표계정명을 선택해 주십시오'); return;
		}
		if(jnl13Formula.length < 1){
			alert('계산식을 넣어주십시오') ;return;
		}
		var json = { 
				jnl13TrCd       : jnl13TrCd,
				jnl13Seq		: jnl13Seq,
				jnl13ReprAcntCd	: jnl13ReprAcntCd, 
				jnl13DrcrType  	: jnl13DrcrType, 
				jnl13Formula	: jnl13Formula
			  };
		console.log(json);
		var json = JSON.stringify(json);
		var url = baseUrl + "/tr13/insert";
		if(mode === '수정'){
			url = baseUrl + "/tr13/update";
		}
 		AssetUtil.ajax(url, json, 
 			{
 				method:'POST', 
 				success:(response)=>{
		 			if(response.result == 'OK'){
		 				console.log(response);
		 				alert('저장되었습니다.');
		 				//$('#tr13-grid .btnCancel13').trigger('click');

		 		 		makeTbody13List(response.list);
		 			}else{
		 				console.log(response)
		 				alert("저장에 실패하였습니다 " + response.msg);
		 				makeTbody13List(response.list);
		 			}
 				},
 				 error: function (request, status, error) {
 			        console.log("code: " + request.status)
 			        console.log("message: " + request.responseText)
 			        console.log("error: " + error);
 			        alert("error: " + error);
 			        //$('#tr13-grid .btnCancel13').trigger('click');
 			     },
 			    complete : function(){
 			    	console.log('....always...')
 			    	buttonsDisEnable(false);
 			    }
 			}
 	   );
	});	
	//table13에서 popup창으로 대표계정코드 구하기
	$('#table13').on('click','#jnl13ReprAcntCdPopup', function(){
        var url = '/popup/jnl/repr-acnt?openerCdId=jnl13ReprAcntCd&openerNmId=jnl13ReprAcntNm';
        var prop = {};
        var width = 720;
        var height = 518;
        var win = AssetUtil.popupWindow(url, '대표계정코드', {}, width, height);
        return false;
	});
	
}); 
</script>
</body>
</html>