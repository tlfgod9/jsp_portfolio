<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="product.Product" %>
<%@ page import="product.ProductDAO" %>

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
		Product product = new ProductDAO().getProduct(pID);
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
	 <div> 
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="3" style="background-color: #8C8C8C; text-align:center;">상품 상세보기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 40%;"><%= product.getImage() %></td>
					<td colspan="2">
						상품분류 : <%= product.getCategory() %><br>
						상품명 : <%= product.getpName() %><br>
						올린날짜 : <%= product.getInputDate().substring(0, 11) + product.getInputDate().substring(11, 13) + "시 " + product.getInputDate().substring(14, 16) + "분 " %><br>
						마감날짜 : <%= product.getOutputDate().substring(0, 11) + product.getOutputDate().substring(11, 13) + "시 " + product.getOutputDate().substring(14, 16) + "분 " %><br>
						입찰가 : <%= product.getBid() %> 원<br>
						판매가 : <%= product.getPrice() %> 원	<br>		
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<div  style="min-height: 200px; text-align:left" >
							<%= product.getDescription().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\n", "<br>") %>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<a href="myPage.jsp" class="btn btn-primary">목록</a>
		<%-- <%
			if(userID != null && userID.equals(product.getUserID())) {
		%>	
		 	<a href="productUpdate.jsp?pID=<%= pID %>" class="btn btn-primary">수정</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="productDeleteAction.jsp?pID=<%= pID %>" class="btn btn-primary">삭제</a>	
		<%
			} else {
		%> --%>
		<div class="text-right">
			<form method="post" action="myPage.jsp">
				현재 입찰가 <input type="number" placeholder="<%= product.getBid() %>" step="100"> <input type="submit" class="btn btn-primary" value="입찰하기">
			</form>
		</div>
			<a onclick="return confirm('구매하시겠습니까?')" href="deliver.jsp?pID=<%= pID %>" class="btn btn-primary float-right" style="background-color: #8C8C8C;" >즉시 구매하기</a>
		<%-- <%
			}
		%> --%>
	 </div> 
</div>
<br><br>
<footer class="footer text-center bg-secondary">
            <div class="container">
                <div class="row">
                    <!-- Footer Location-->
                    <div class="col-lg-4 mb-5 mb-lg-0"><br>
                        <h4 class="text-uppercase mb-4 text-white">최윤영</h4>
                        <p class="lead mb-0 text-white" >tlfgod9@naver.com<br />010-6509-0067</p>
                    </div>
                    <!-- Footer Social Icons-->
                    <div class="col-lg-4 mb-5 mb-lg-0"><br>
                        <h4 class="text-uppercase mb-4 text-white">소셜 미디어</h4>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-facebook-f"></i></a><a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-google-plus"></i></a><a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-youtube"></i></a>
                    </div>
                    <!-- Footer About Text-->
                    <div class="col-lg-4"><br>
                        <h4 class="text-uppercase mb-4 text-white">한마디</h4>
                        <p class="lead mb-0 text-white">노력하는 개발자가 되겠습니다</p>
                    </div>
                </div>
            </div>
        </footer>
</body>
</html>