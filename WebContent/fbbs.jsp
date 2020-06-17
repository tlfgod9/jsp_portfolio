<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="fbbs.FbbsDAO" %>
<%@ page import="fbbs.Fbbs" %>
<%@ page import="java.util.ArrayList" %>
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
      	 	 		<a class="nav-link" href="join.jsp">회원관리</a>
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
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #8C8C8C; text-align:center;">번호</th>
					<th style="background-color: #8C8C8C; text-align:center;">제목</th>
					<th style="background-color: #8C8C8C; text-align:center;">작성자</th>
					<th style="background-color: #8C8C8C; text-align:center;">작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
					FbbsDAO fbbsDAO = new FbbsDAO();
					ArrayList<Fbbs> list = fbbsDAO.getList(pageNumber);
					for(int i=0; i<list.size(); i++) {
						
					
				%>
					<tr>
						<td><%= list.get(i).getFbbsID() %></td>
						<td><a href="view.jsp?fbbsID=<%= list.get(i).getFbbsID() %> "><%= list.get(i).getFbbsTitle() %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getFbbsDate().substring(0, 11) + list.get(i).getFbbsDate().substring(11, 13) + "시 " + list.get(i).getFbbsDate().substring(14, 16) + "분 " %></td>
					</tr>
				<%
					}
				%>
				
			</tbody>
		</table>
		<%
			if(pageNumber != 1) {
				
		%>
			<a href="fbbs.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arraw-left">이전</a>
		<%
			} if(fbbsDAO.nextPage(pageNumber + 1)) {
				
		%>
			<a href="fbbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left">다음</a>
		<%
			}
		%>
		<div class=" ml-auto"> 
			<a href="write.jsp" class="btn btn-primary float-right">글쓰기</a>
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