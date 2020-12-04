<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="deliver.DeliverDAO" %>
<%@ page import="deliver.Deliver" %>

<!DOCTYPE html>
<html>
<head>
<title>경매장터 기본 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/custom.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  
  <style type="text/css">
  	a, a:hover {
  		color : #000000;
  		text-decoration: none;
  	}
  	
  </style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		ProductDAO productDAO = new ProductDAO();
		DeliverDAO deliverDAO = new DeliverDAO();
		ArrayList<Product> list = productDAO.getList(pageNumber, userID);
		
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
      			<li class="nav-item">
       	 			<a class="nav-link" href="javascript:void(0)">자유 게시판 </a>
      			</li>
    		<%
    			} else{
    		%>
    			<li class="nav-item">
       	 			<a class="nav-link" href="logoutAction.jsp">로그아웃</a>
     			</li>
     	 		<li class="nav-item">
      	 	 		<a class="nav-link" href="javascript:void(0)">회원관리</a>
     	 		</li>
      			<li class="nav-item">
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
	<div class="row">
		<div class="col-sm-8">
			<h2>등록상품 목록</h2>
		</div>
	</div>
	<table class="table table-hover text-center">
    <thead>
      <tr>
        <th>상품 이미지</th>
        <th>상품 정보</th>
        <th>판매자</th>
      </tr>
    </thead>
    <tbody>
      <tr>
      <%
      	for(int i=0; i<list.size(); i++) {
      %>
      <!-- 클릭시 pID 데이터 보내기 !  -->
      <!-- <img src="image/text2.jpg" alt="#" width="1100" height="500"> -->
        <td><a href='productView.jsp?pID=<%= list.get(i).getpID() %>'><img src="image/<%= list.get(i).getImage() %>" alt="#" width="200" height="130"></a></td>
		<td>
			<%= "상품분류 : " + list.get(i).getCategory() %><br>
			<%= "상품명 : " + list.get(i).getpName() %><br><br>
			<%= "올린날짜 : " + list.get(i).getInputDate().substring(0, 11) + list.get(i).getInputDate().substring(11, 13) + "시 " + list.get(i).getInputDate().substring(14, 16) + "분 " %><br>
			<%= "마감날짜 : " + list.get(i).getOutputDate().substring(0, 11) + list.get(i).getOutputDate().substring(11, 13) + "시 " + list.get(i).getOutputDate().substring(14, 16) + "분 " %><br><br>
			<%= "입찰가 : " + list.get(i).getBid() + " 원" %><br>
			<%= "즉시판매가 : " + list.get(i).getPrice() + " 원" %><br>
		</td>
		<td><br><br><br><%= list.get(i).getUserID() %></td>
      </tr>
      <%
      	}
      %>
    </tbody>
  </table>
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