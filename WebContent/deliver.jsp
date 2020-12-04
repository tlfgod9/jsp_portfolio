<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<title>경매장터 기본 페이지</title>
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
		int pID = 0;
		if(request.getParameter("pID") != null) {
			pID = Integer.parseInt(request.getParameter("pID"));
		}
		if(pID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = ''");
			script.println("</script>");
		}
	%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="margin:24px 0;">
  		<a class="navbar-brand" href="javascript:void(0)">경매장터</a>
  	<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navb">
    	<span class="navbar-toggler-icon"></span>
  	</button>

  	<div class="collapse navbar-collapse" id="navb">
    	<ul class="navbar-nav mr-auto">
    		<%
    			if(userID == null) {
    				
    		%>
    			<li class="nav-item">
       	 			<a class="nav-link" href="login.jsp">로그인</a>
     			</li>
     	 		<li class="nav-item">
      	  			<a class="nav-link" href="join.jsp">회원가입</a>
     	 		</li>
      			<li class="nav-item active">
       	 			<a class="nav-link" href="javascript:void(0)">자유 게시판 </a>
      			</li>
    		<%
    			} else{
    		%>
    			<li class="nav-item">
       	 			<a class="nav-link" href="logoutAction.jsp">로그아웃</a>
     			</li>
     	 		<li class="nav-item">
      	 	 		<a class="nav-link" href="join.jsp">회원관리</a>
     	 		</li>
      			<li class="nav-item active">
       	 			<a class="nav-link" href="javascript:void(0)">자유 게시판 </a>
      			</li>
    		<%
    			}
    		%>
      		
    	</ul>
    	
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="검색">
      <button class="btn btn-success my-2 my-sm-0" type="button">검색</button>
    </form>
  </div>
</nav>
<div class="container">
	<div class="col-sm-10 col-md-8 col-lg-6 mx-auto">
		<div class="jumbotron" style="padding-top: 20px;">
			<form method="post" action="deliverAction.jsp?pID=<%= pID %>">
				<h3 style="text-align: center;">주문정보 입력</h3>
				<div class="form-group">
					<input type="text" class="form-control" name="reciptient" maxlength="20" placeholder="수령인" >
				</div>
				<div class="form-group">
					<input type="tel" class="form-control" name="tel" maxlength="20" placeholder="연락처">
				</div>
				<div class="form-group">
					우편번호 : <input type="text" name="zip1" size="3" maxlength="3">-
					<input type="text" name="zip2" size="3" maxlength="3">
					<input type="button" value="우편번호 검색"><br><br>
					<input type="text" name="addr1" placeholder="기본주소">&nbsp;
					<input type="text" name="addr2" placeholder="상세주소">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" name="memo" maxlength="20" placeholder="배송메모">
				</div><br>
				
				<h3 style="text-align: center;">결제수단</h3>
				<div class="form-group" style="text-align: center;">
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-primary">
							<input type="radio" name="payment" autocomplete="off" value="신용카드" checked>신용카드
						</label>
						<label class="btn btn-primary">
							<input type="radio" name="payment" autocomplete="off" value="휴대폰">휴대폰
						</label>
					</div>
				</div>
				<input type="submit" class="btn btn-primary form-control" value="결제하기">
			</form>
		</div>
	</div>
</div>



</body>
</html>