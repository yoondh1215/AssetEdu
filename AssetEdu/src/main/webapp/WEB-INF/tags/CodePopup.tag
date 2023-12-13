<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"  %>
<%@ attribute name="btnId" required="true" %>
<%@ attribute name="codeId" required="true" %>
<%@ attribute name="nameId" required="true" %>
<!-- 
팝업을 띄워서 코드와 명칭을 찾는 input박스
 <kfs:CodePopup btnId="btnId" codeId="jnl14RealAcntCd" nameId="jnl14RealAcntNm" />
 -->
 <button class="btn btn-outline-secondary text-warning bg-secondary" type="button" id="${btnId}"><i class="fa-solid fa-search"></i></button>
 <form:hidden path="${codeId}"  required="true"  />
 <form:input type="text" path="${nameId}" class="form-control" readonly="true" style="background-color:#F5F5F5" />
 