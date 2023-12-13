<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>자산운용IT교육</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">    
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container" style="height:100px"></div>
	<div class="container p-5 my-5 bg-primary text-white" style="width:600px;">
		<h1>Asset Management IT Education</h1>
	</div>

	<div class="container" style="width:600px">
		<form class="form" id="login-form" action="/loginProcess" method="post">
			<div class="row">
                <label for="username" class="col-sm-3 col-form-label text-end fw-bold">LOGIN ID</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="username" name="username" required>
				</div>
			</div>
			<br>
			<div class="row">
				<label for="password" class="col-sm-3 col-form-label text-end fw-bold">PASSWORD</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="password" name="password" required>
				</div>
			</div>
			<div class="container" style="height:50px"></div>
			<div class="d-grid col-8 mx-auto">
				<button class="btn btn-success" type="submit">SUBMIT</button>
			</div>
		</form>
	</div>

    <!-- Bootstrap JS -->
    <script src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>
</body>
</html>