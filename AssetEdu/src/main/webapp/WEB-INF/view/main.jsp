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
<jsp:include page="common/meta_css.jsp" flush="false" />
<!-- =================================================== -->
<title><c:out value="${pageTitle }" default="자산운용교육" /></title>
</head>
<body>
<!-- =================================================== -->
<jsp:include page="common/header.jsp" flush="false" />
<!-- =================================================== -->
<main class="container-flud text-center">
<%-- 	<h1><c:out value="${title }"/></h1> --%>
<!-- 	<img src="image/screen1.png" alt="교육내용소개"/> -->
<%-- 	<a href="${gitSourceUrl }" target="_blank"> Git Source Url</a> --%>

    <p class="text-start fs-3 mt-5 mx-5" style="color:#5B5959;">
        <i class="fa-solid fa-paper-plane mx-2"></i> IT관련 SITE
    </p>

    <div class="row mt-3 mx-5">
        <!-- bootstrap -->
        <div class="col-sm-2">
            <a href="https://getbootstrap.com/docs/5.2" target="_blank" style="text-decoration-line:none; color:black;">
		    <div class="card">
                <img src="image/card_bootstrap4.jpg" class="card-img-top">
		        <div class="card-body">
		            <h5 class="card-title text-start">Bootstrap v5.2 Docs</h5>
                    <p class="card-text text-start">Build fast, responsive sites with Bootstrap</p>
		        </div>
		    </div>
		    </a>
        </div>

        <!-- postgresql -->
        <div class="col-sm-2">
            <a href="https://www.postgresql.org/" target="_blank" style="text-decoration-line:none; color:black;">
            <div class="card">
                <img src="image/card_postgresql4.jpg" class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title text-start">PostgreSQL</h5>
                    <p class="card-text text-start">The World's Most Advanced Open Source Relational Database</p>
                </div>
            </div>
            </a>
        </div>
   
        <!-- JQuery -->
        <div class="col-sm-2">
            <a href="https://jquery.com/" target="_blank" style="text-decoration-line:none; color:black;">
            <div class="card">
                <img src="image/card_jquery.jpg" class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title text-start">jQuery</h5>
                    <p class="card-text text-start">jQuery is a fast, small, and feature-rich JavaScript library</p>
                </div>
            </div>
            </a>
        </div>
    
        <!-- HandleBar -->
        <div class="col-sm-2">
            <a href="https://handlebarsjs.com/" target="_blank" style="text-decoration-line:none; color:black;">
            <div class="card">
                <img src="image/card_handlebars.jpg" class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title text-start">handlebars</h5>
                    <p class="card-text text-start">Minimal templating on steroids</p>
                </div>
            </div>
            </a>
        </div>
    </div>
    
    <div class="row mt-2 mx-5">
        <!-- maven repository -->
        <div class="col-sm-2">
            <a href="https://mvnrepository.com/" target="_blank" style="text-decoration-line:none; color:black;">
            <div class="card">
                <img src="image/card_mavenRepository.jpg" class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title text-start">Maven Repository</h5>
                    <p class="card-text text-start">Librarys Repository</p>
                </div>
            </div>
            </a>
        </div>

	    <!-- spring boot -->
        <div class="col-sm-2">
            <a href="https://spring.io/projects/spring-boot" target="_blank" style="text-decoration-line:none; color:black;">
            <div class="card">
                <img src="image/card_springboot.jpg" class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title text-start">Spring Boot</h5>
                    <p class="card-text text-start">Spring Boot makes it easy to create stand-alone, production-grade Spring based Applications that you can "just run"</p>
                </div>
            </div>
            </a>
        </div>
	    
	    <!-- dbeaver -->
        <div class="col-sm-2">
            <a href="https://dbeaver.io/" target="_blank" style="text-decoration-line:none; color:black;">
            <div class="card">
                <img src="image/card_dbeaver.jpg" class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title text-start">DBeaver</h5>
                    <p class="card-text text-start">Free Universal Database Tool</p>
                </div>
            </div>
            </a>
        </div>
	    
	    <!-- gradle -->
        <div class="col-sm-2">
            <a href="https://docs.gradle.org/current/userguide/about_manual.html" target="_blank" style="text-decoration-line:none; color:black;">
            <div class="card">
                <img src="image/card_gradle.jpg" class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title text-start">Gradle</h5>
                    <p class="card-text text-start">Gradle Build Tool is a fast, dependable, and adaptable open-source build automation tool with an elegant and extensible declarative build language.</p>
<!--                     <a href="https://docs.gradle.org/current/userguide/about_manual.html" target="_blank" class="btn btn-primary w-25">Go</a> -->
                </div>
            </div>
            </a>
        </div>
    </div>

    <p class="text-start fs-3 mt-5 mx-5" style="color:#5B5959;">
        <i class="fa-solid fa-paper-plane mx-2"></i>업무관련 SITE
    </p>

    <div class="row mt-3 mx-5">
        <!-- 예탁결제원 -->
        <div class="col-sm-2">
            <div class="card">
                <a href="https://seibro.or.kr/websquare/control.jsp?w2xPath=/IPORTAL/user/index.xml" target="_blank">
                    <img src="image/card_biz_ksd.jpg" class="card-img-top">
                </a>
                <div class="card-body">
<!--                     <h5 class="card-title text-start">예탁결제원-증권정보</h5> -->
<!--                     <a href="https://seibro.or.kr/websquare/control.jsp?w2xPath=/IPORTAL/user/index.xml" target="_blank" class="btn btn-primary w-25">Go</a> -->
                </div>
            </div>
        </div>

        <!-- 금융투자협회 -->
        <div class="col-sm-2">
            <div class="card">
                <a href="https://dis.kofia.or.kr/websquare/index.jsp?w2xPath=/wq/main/main.xml" target="_blank">
                    <img src="image/card_biz_kofia2.jpg" class="card-img-top">
                </a>
                <div class="card-body">
<!--                     <h5 class="card-title text-start">금융투자협회-전자공시</h5> -->
<!--                     <p class="card-text text-start">펀드공시정보 및 기준가 등 정보제공</p> -->
<!--                     <a href="https://dis.kofia.or.kr/websquare/index.jsp?w2xPath=/wq/main/main.xml" target="_blank" class="btn btn-primary w-25">Go</a> -->
                </div>
            </div>
        </div>

        <!-- DART -->
        <div class="col-sm-2">
            <div class="card">
                <a href="https://dart.fss.or.kr/" target="_blank">
                    <img src="image/card_biz_dart.jpg" class="card-img-top">
                </a>
                <div class="card-body">
                </div>
            </div>
        </div>
        
        <!-- 기업공시(KIND) -->
        <div class="col-sm-2">
            <div class="card">
                <a href="https://kind.krx.co.kr/" target="_blank">
                    <img src="image/card_biz_kind.jpg" class="card-img-top">
                </a>
                <div class="card-body">
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-2 mx-5">
        <!-- 외국환중개 -->
        <div class="col-sm-2">
            <div class="card">
                <a href="http://www.smbs.biz/ExRate/StdExRate.jsp" target="_blank">
                    <img src="image/card_biz_fxrate.jpg" class="card-img-top">
                </a>
                <div class="card-body">
                </div>
            </div>
        </div>

        <!-- 한국회계기준원 -->
        <div class="col-sm-2">
            <div class="card">
                <a href="http://www.kasb.or.kr/" target="_blank">
                    <img src="image/card_biz_kai2.jpg" class="card-img-top">
                </a>
                <div class="card-body">
<!--                     <h5 class="card-title text-start">한국회계기준원</h5> -->
<!--                     <p class="card-text text-start">일반기업회계기준, 한국채택국제회계기준</p> -->
<!--                     <a href="http://www.kasb.or.kr/" target="_blank" class="btn btn-primary w-25">Go</a> -->
                </div>
            </div>
        </div>

        <!-- KRX-정보데이터 -->
        <div class="col-sm-2">
            <div class="card">
                <a href="http://data.krx.co.kr/contents/MDC/MAIN/main/index.cmd" target="_blank">
                    <img src="image/card_biz_krx1.jpg" class="card-img-top">
                </a>
                <div class="card-body">
                </div>
            </div>
        </div>

        <!-- KRX-표준코드시스템 -->
        <div class="col-sm-2">
            <div class="card">
                <a href="https://isin.krx.co.kr/srch/srch.do?method=srchList" target="_blank">
                    <img src="image/card_biz_krx2.jpg" class="card-img-top">
                </a>
                <div class="card-body">
                </div>
            </div>
        </div>

    </div>

    <div class="row mt-2 mx-5 mb-5">
        <!-- 펀드정보 One-Click 시스템 -->
        <div class="col-sm-2">
            <div class="card">
                <a href="https://fund.kofia.or.kr/" target="_blank">
                    <img src="image/card_biz_oneclick.jpg" class="card-img-top">
                </a>
                <div class="card-body">
                </div>
            </div>
        </div>
    </div>

</main>
<!-- =================================================== -->
<jsp:include page="common/footer.jsp" flush="false" />
<!-- -================================================== -->
<script>
$( document ).ready(function() {
});
</script>	
</body>
</html>