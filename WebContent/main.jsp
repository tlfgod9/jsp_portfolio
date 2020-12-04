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
       	 			<a class="nav-link" href="fbbs.jsp">자유 게시판 </a>
      			</li>
    		<%
    			} else{
    		%>
    			<li class="nav-item">
       	 			<a class="nav-link" href="logoutAction.jsp">로그아웃</a>
     			</li>
     	 		<li class="nav-item">
      	 	 		<a class="nav-link" href="myPage.jsp">마이페이지</a>
     	 		</li>
      			<li class="nav-item">
       	 			<a class="nav-link" href="fbbs.jsp">자유 게시판 </a>
      			</li>
    		<%
    			}
    		%>
      		
    	</ul>
    	
    <form action="./main.jsp" method="get" class="form-inline my-2 my-lg-0" >
      <input class="form-control mr-sm-2" type="text" name="search" placeholder="검색">
      <button class="btn btn-success my-2 my-sm-0" type="submit">검색</button>
    </form>
  </div>
</nav>

<div class="container">
  <ul class="nav nav-pills nav-justified bg-secondary">
    <li class="nav-item">
      <a class="nav-link text-white" href="#">패션의류</a>
    </li>
    <li class="nav-item ">
      <a class="nav-link text-white" href="#">가구생활</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-white" href="#">디지털</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-white" href="#">생활가전</a>
    </li><li class="nav-item">
      <a class="nav-link text-white" href="#">도서기타</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-white" href="#">등드1</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-white" href="#">등등2</a>
    </li>
  </ul>
</div><br>



<div class="container">
	<div id="demo" class="carousel slide" data-ride="carousel">
	
	  <!-- Indicators -->
	  <ul class="carousel-indicators">
	    <li data-target="#demo" data-slide-to="0" class="active"></li>
	    <li data-target="#demo" data-slide-to="1"></li>
	    <li data-target="#demo" data-slide-to="2"></li>
	  </ul>
	  
	  <!-- The slideshow -->
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <!-- <img src="image/text1.jpg" alt="#" width="1100" height="500"> -->
	      <div class="container">
				<div class="jumbotron">
					<div class="container">
						<h1>웹 사이트 소개</h1>
						<p>이 웹 사이트는 부트스트랩으로 만든 JSP 웹 사이트입니다. 최소한의 간단한 로직만을 이용해서 개발했습니다. 디자인 템플릿으로는 부트스트랩을 이용했습니다.</p>
						<p><a class="btn btn-primary btn-pull" href="#" role="button">자세히 알아보기</a></p>
					</div>
				</div>
			</div>
	    </div>
	    <div class="carousel-item">
	    	<img src="image/text2.jpg" alt="#" width="1100" height="500">
	    </div>
	    <div class="carousel-item">
	      <img src="image/text3.jpg" alt="#" width="1100" height="500">
	    </div>
	  </div>
	  
	  <!-- Left and right controls -->
	  <a class="carousel-control-prev" href="#demo" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#demo" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </a>
	</div>
</div>
<br><br>
<div class="container">
	<div class="row">
		<div class="col-sm-8">
			<h2>상품 리스트</h2>
		</div>
		<%
    			if(userID != null) {		
    	%>
		<div class="col-sm-4">
			<form class="float-right" method="get" action="productWrite.jsp?userID=<%=userID %>">
				<input type="submit" class="btn btn-primary" value="상품 등록">
			</form>
		</div>
		<%
    			}
		%>
	</div>
	<table class="table table-hover text-center">
    <thead>
      <tr>
        <th>상품 이미지</th>
        <th>상품 정보</th>
        <th>판매자 이름</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td> 
        	<div>
      			<img src="image/text1.jpg" alt="#" width="250" height="200">
    		</div>
    	</td>
        <td>상풍명  : 나이키 후드티 <br><br>입찰가 : 10,000원<br>즉시 구매가 : 25,000원<br>배송 : 무료<br>경매 마감일 : 00월 00일 00:00시 마감</td>
        <td><br><br><br>홍길동</td>
      </tr>
      <tr>
        <td>
            <div>
      			<img src="image/text2.jpg" alt="#" width="250" height="200">
    		</div>
        </td>
        <td>상풍명  : 흰색 긴팔티 <br><br>입찰가 : 10,000원<br>즉시 구매가 : 25,000원<br>배송 : 무료<br>경매 마감일 : 00월 00일 00:00시 마감</td>
        <td><br><br><br>최윤영</td>
      </tr>
      <tr>
        <td>
        	<div>
      			<a href="#"><img src="image/text3.jpg" alt="#" width="250" height="200" ></a>
    		</div>
        </td>
        <td>상풍명  : 서랍장 <br><br>입찰가 : 10,000원<br>즉시 구매가 : 25,000원<br>배송 : 무료<br>경매 마감일 : 00월 00일 00:00시 마감</td>
        <td><br><br><br>이순신</td>
      </tr>
    </tbody>
  </table>
</div>
<br><br>
<div class="container">
  <h2>자주하는 질문</h2>
  <ul class="nav nav-pills nav-justified">
    <li class="nav-item active"><a class="nav-link text-dark" data-toggle="pill" href="#menu1">회원</a></li>
    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu2">주문</a></li>
    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu3">결제</a></li>
    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu4">배송</a></li>
    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu5">취소/환불</a></li>
    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu6">반품/교환</a></li>
    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu7">서비스 등</a></li>
  </ul>
  
  <div class="tab-content">
    <div id="menu1" class="tab-pane fade in active">
		<div class="container">
		  <ul class="nav nav-pills nav-justified flex-column">
		    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu11">회원 정보를 변경하고 싶어요.</a></li>
		    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu22">로그인이 안돼요.</a></li>
		    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu33">재가입하나요?</a></li>
		    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu44">회원탈퇴는 어떻게 하나요?</a></li>
		    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu55">회원 정보를 변경하고 싶어요.</a></li>
		    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu66">로그인이 안돼요.</a></li>
		    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu77">재가입은 어떻게 하나요?</a></li>
		    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu88">회원탈퇴는 어떻게 하나요?</a></li>    
		  </ul>
		  
		  <div class="tab-content">
		    <div id="menu11" class="tab-pane fade text-center"><br>
		      <h3>정보 수정</h3><br>
		      <p>마이페이지에서 정보수정을 누르시고 비밀번호 입력 후 변경하시면 됩니다.</p>
		    </div>
		    <div id="menu22" class="tab-pane fade text-center"><br>
		      <h3>로그인</h3><br>
		      <p>아이디와 비밀번호가 일치하시는데 로그인이 안되시는거면 문의 부탁드립니다.</p> 
		    </div>
		    <div id="menu33" class="tab-pane fade text-center"><br>
		      <h3>재가입</h3><br>
		      <p>회원탈퇴후 일주일 후에 다시 회원가입 하시면 됩니다.</p>
		    </div>
		    <div id="menu44" class="tab-pane fade text-center"><br>
		      <h3>회원탈퇴</h3><br>
		      <p>마이페이지에서 정보수정을 누르시고 비밀번호 입력 후 탈퇴 버튼을 누르시면 됩니다.</p>
		    </div>
		    <div id="menu55" class="tab-pane fade text-center"><br>
		      <h3>정보 수정</h3><br>
		      <p>마이페이지에서 정보수정을 누르시고 비밀번호 입력 후 변경하시면 됩니다.</p>
		    </div>
		    <div id="menu66" class="tab-pane fade text-center"><br>
		      <h3>로그인</h3><br>
		      <p>아이디와 비밀번호가 일치하시는데 로그인이 안되시는거면 문의 부탁드립니다.</p>
		    </div>
		    <div id="menu77" class="tab-pane fade text-center"><br>
		      <h3>재가입</h3><br>
		      <p>회원탈퇴후 일주일 후에 다시 회원가입 하시면 됩니다.</p>
		    </div>
		    <div id="menu88" class="tab-pane fade text-center"><br>
		      <h3>회원탈퇴</h3><br>
		      <p>마이페이지에서 정보수정을 누르시고 비밀번호 입력 후 탈퇴 버튼을 누르시면 됩니다.</p>
		    </div>
		  </div>
		</div>
    </div>
    <div id="menu2" class="tab-pane fade">
		<div class="container">
		  <ul class="nav nav-pills nav-justified flex-column">
		    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu111">주문이 안돼요.</a></li>
		    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu222">주문을 어떻게 하나요?</a></li>
		    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu333">주문이 안돼요.</a></li>
		    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu444">주문을 어떻게 하나요?</a></li>
		    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu555">주문이 안돼요.</a></li>
		    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu666">주문을 어떻게 하나요?</a></li>
		    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu777">주문이 안돼요.</a></li>
		    <li class="nav-item"><a class="nav-link text-dark" data-toggle="pill" href="#menu888">주문을 어떻게 하나요?</a></li>    
		  </ul>
		  
		  <div class="tab-content">
		    <div id="menu111" class="tab-pane fade text-center"><br>
		      <h3>주문</h3><br>
		      <p>인터넷을 다시 한번 껏다가 켜서 해보시겠어요? 안되시면 문의 부탁드립니다.</p>
		    </div>
		    <div id="menu222" class="tab-pane fade text-center"><br>
		      <h3>주문</h3><br>
		      <p>주문하기를 누르시고 결제하시면 됩니다.</p> 
		    </div>
		    <div id="menu333" class="tab-pane fade text-center"><br>
		      <h3>주문</h3><br>
		      <p>인터넷을 다시 한번 껏다가 켜서 해보시겠어요? 안되시면 문의 부탁드립니다.</p>
		    </div>
		    <div id="menu444" class="tab-pane fade text-center"><br>
		      <h3>주문</h3><br>
		      <p>주문하기를 누르시고 결제하시면 됩니다.</p>
		    </div>
		    <div id="menu555" class="tab-pane fade text-center"><br>
		      <h3>주문 </h3><br>
		      <p>인터넷을 다시 한번 껏다가 켜서 해보시겠어요? 안되시면 문의 부탁드립니다.</p>
		    </div>
		    <div id="menu666" class="tab-pane fade text-center"><br>
		      <h3>주문</h3><br>
		      <p>주문하기를 누르시고 결제하시면 됩니다.</p>
		    </div>
		    <div id="menu777" class="tab-pane fade text-center"><br>
		      <h3>주문</h3><br>
		      <p>인터넷을 다시 한번 껏다가 켜서 해보시겠어요? 안되시면 문의 부탁드립니다.</p>
		    </div>
		    <div id="menu888" class="tab-pane fade text-center"><br>
		      <h3>주문</h3><br>
		      <p>주문하기를 누르시고 결제하시면 됩니다.</p>
		    </div>
		  </div>
		</div> 
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>Menu 2</h3>
      <p>텍스트 작성해야함 !!</p>
    </div>
    <div id="menu4" class="tab-pane fade">
      <h3>Menu 3</h3>
      <p>텍스트 작성해야함 !!</p>
    </div>
    <div id="menu5" class="tab-pane fade">
      <h3>Menu 1</h3>
      <p>텍스트 작성해야함 !!</p>
    </div>
    <div id="menu6" class="tab-pane fade">
      <h3>Menu 2</h3>
      <p>텍스트 작성해야함 !!</p>
    </div>
    <div id="menu7" class="tab-pane fade">
      <h3>Menu 3</h3>
      <p>텍스트 작성해야함 !!</p>
    </div>
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