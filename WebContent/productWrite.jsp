<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="product.ProductDAO" %>
<!DOCTYPE html>
<html>
<head>
<title>경매장터 회원가입 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/custom.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
		}
		ProductDAO productDAO = new ProductDAO();
	%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="margin:24px 0;">
  		<a class="navbar-brand" href="main.jsp">경매장터</a>
  	<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navb">
    	<span class="navbar-toggler-icon"></span>
  	</button>

  	<div class="collapse navbar-collapse" id="navb">
    	<ul class="navbar-nav mr-auto">
      		<li class="nav-item">
       	 		<a class="nav-link " href="logoutAction.jsp">로그아웃</a>
     		</li>
     	 	<li class="nav-item">
      	  		<a class="nav-link" href="fbbs.jsp">자유 게시판 </a>
     	 	</li>
      		<li class="nav-item">
       	 		<a class="nav-link active" href="javascript:void(0)">상품등록</a>
      		</li>
    	</ul>
    	
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="검색">
      <button class="btn btn-success my-2 my-sm-0" type="button">검색</button>
    </form>
  </div>
</nav>
<div class="container">
	<div class="col-sm-12 col-md-10 col-lg-8 mx-auto">
		<div class="jumbotron" style="padding-top: 20px;">
			<form method="post" action="productWriteAction.jsp">
				<h3 style="text-align: center;">상품 등록</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="<%=productDAO.getUserName(userID) %>" name="uName" maxlength="20">
				</div>
				<div class="form-group">
					<select name="category" class="form-control">
						<option value="패션의류">패션의류</option>
						<option value="가구생활">가구생활</option>
						<option value="디지털">디지털</option>
						<option value="생활가전">생활가전</option>
						<option value="도서기타">도서기타</option>
						<option value="등등1">등 1</option>
						<option value="등등2">등 2</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="상품명" name="pName" maxlength="20">
				</div>
				<div class="form-group">
					입찰가&nbsp;<input type="number" name="big" maxlength="10" value="0"> 원
					&nbsp;&nbsp;&nbsp;
					<input type="number" placeholder="즉시 판매가" name="price" maxlength="10"> 원
				</div>
				<!-- <div class="form-group">
					<input type="datetime-local" name="inputDate" class="form-control">
				</div> -->
				<div class="form-group">
					<label>경매 마감일</label>
					<input type="datetime-local" name="outputDate" class="form-control">
				</div>
				<div class="form-group">
					<input type="file" name="image" size="20" class="form-control">
				</div>
				<div class="form-group">
					<textarea class="form-control" placeholder="상품 설명" name="description" maxlength="2048" style="height: 200px;"></textarea>
				</div>
				<input type="submit" class="btn btn-primary form-control" value="등록">
			</form>
		</div>
	</div>
</div>
</body>
</html>