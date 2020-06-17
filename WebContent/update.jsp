<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="fbbs.Fbbs" %>
<%@ page import="fbbs.FbbsDAO" %>
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
		if(userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int fbbsID = 0;
		if(request.getParameter("fbbsID") != null) {
			fbbsID = Integer.parseInt(request.getParameter("fbbsID"));
		}
		if(fbbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'fbbs.jsp'");
			script.println("</script>");
		}
		Fbbs fbbs = new FbbsDAO().getFbbs(fbbsID);
		if(!userID.equals(fbbs.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'fbbs.jsp'");
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
   			<li class="nav-item">
   			   	<a class="nav-link" href="logoutAction.jsp">로그아웃</a>
     		</li>
     	 	<li class="nav-item">
      	 	 	<a class="nav-link" href="join.jsp">회원관리</a>
     	 	</li>
      		<li class="nav-item active">
       	 		<a class="nav-link" href="javascript:void(0)">자유 게시판 </a>
      		</li>    		
    	</ul>
    	
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="검색">
      <button class="btn btn-success my-2 my-sm-0" type="button">검색</button>
    </form>
  </div>
</nav>
<div class="container">
	 <div> 
		<form method="post" action="updateAction.jsp?fbbsID=<%= fbbsID %>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #8C8C8C; text-align:center;">게시판 글 수정 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="fbbsTitle" maxlength="50" value="<%= fbbs.getFbbsTitle() %>"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="fbbsContent" maxlength="2048" style="height: 350px;"><%= fbbs.getFbbsContent() %></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary float-right" value="글수정">
		</form>		
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