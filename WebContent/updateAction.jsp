<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fbbs.FbbsDAO" %>
<%@ page import="fbbs.Fbbs" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>경매장터 기본 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
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
		} else {

			if(request.getParameter("fbbsTitle") == null || request.getParameter("fbbsContent") == null
					|| request.getParameter("fbbsTitle").equals("") || request.getParameter("fbbsContent").equals("")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				FbbsDAO fbbsDAO = new FbbsDAO();
				int result = fbbsDAO.update(fbbsID, request.getParameter("fbbsTitle"), request.getParameter("fbbsContent"));

				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'fbbs.jsp'");
					script.println("</script>");
				}
			}
		}
		
		
	%>
	
</body>
</html>