<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-expand-lg bg-dark">
     <div class="container-fluid">
         <a class="navbar-brand text-warning fw-bold" href="/main">AssetEDU</a>
         <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
             data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
             aria-label="Toggle navigation">
             <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
             <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                 <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                         aria-expanded="false" style="color:#DECEFE">
                         기본정보
                     </a>
                     <ul class="dropdown-menu">
                         <li><a class="dropdown-item" href="/fund/list">펀드정보</a></li>
                         <li><a class="dropdown-item" href="/item/list">주식종목정보</a></li>
                         <li><a class="dropdown-item" href="/corp/list">기관정보</a></li>
                         <li><a class="dropdown-item" href="/code/list">공통코드</a></li>
                     </ul>
                 </li>
                 <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                         aria-expanded="false" style="color:#DECEFE">
                         운용지시
                     </a>
                     <ul class="dropdown-menu">
                         <li><a class="dropdown-item" href="/opr/buy_list">주식매수</a></li>
                         <li><a class="dropdown-item" href="/opr/sell_list">주식매도</a></li>
                     </ul>
                 </li>
                 <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                         aria-expanded="false" style="color:#DECEFE">
                         평가처리
                     </a>
                     <ul class="dropdown-menu">
                     	<li><a class="dropdown-item" href="/book/list">주식보유원장</a></li>
                     	<li><a class="dropdown-item" href="/item/price">시세입력</a></li>
                     	<li><a class="dropdown-item" href="/book/eval_list">평가처리</a></li>
                     </ul>
                 </li>
                 <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                         aria-expanded="false" style="color:#DECEFE">
                         회계관리
                     </a>
                     <ul class="dropdown-menu">
                         <li><a class="dropdown-item" href="/jnl/acnt/list">계정과목</a></li>
                         <li><a class="dropdown-item" href="/jnl/repr-acnt/list">대표계정코드</a></li>
                         <li><a class="dropdown-item" href="/jnl/trmap/list">분개매핑</a></li>
                         <li><a class="dropdown-item" href="/jnl/real-acnt/list">실계정매핑</a></li>
                         <li><a class="dropdown-item" href="/jnl/journal/list">분개장</a></li>
                     </ul>
                 </li>                 
				<sec:authorize access="hasAnyRole('ROLE_ADMIN')"> 
				<!-- 관리자만 test와 admin -->    
                 <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                         aria-expanded="false" style="color:#DECEFE">
                         시스템관리
                     </a>
                     <ul class="dropdown-menu">
                         <li><a class="dropdown-item" href="/admin/user/list">사용자관리</a></li>
                         <li><a class="dropdown-item" href="/admin/dict/list">용어사전</a></li>
                     </ul>
                 </li>
                 </sec:authorize>                 
             </ul>
         <div  class="d-flex">
			<sec:authorize access="isAuthenticated()">
		       <span class="text-warning fw-bold"><sec:authentication property="principal.username"/>님 반갑습니다.</span>&nbsp;&nbsp;
		    </sec:authorize>
		    <a href="/logout"><i class="fa fa-sign-in text-white-50"></i></a>
         </div>
       </div>
     </div>
 </nav>
