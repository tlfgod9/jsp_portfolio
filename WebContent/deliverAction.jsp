<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="deliver.DeliverDAO" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="deliver" class="deliver.Deliver" scope="page"></jsp:useBean>
<jsp:setProperty name="deliver" property="recipient" />
<jsp:setProperty name="deliver" property="tel" />
<jsp:setProperty name="deliver" property="payment" />
<jsp:setProperty name="deliver" property="memo" />
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
		String address = null;
		if(request.getParameter("addr1") != null) {
			address = request.getParameter("addr1")+ " " + request.getParameter("addr2");
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
		} else {

			if(request.getParameter("addr1") == null || request.getParameter("tel") == null ||
					request.getParameter("reciptient") == null || request.getParameter("payment") == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				DeliverDAO deliverDAO = new DeliverDAO();
				int result = deliverDAO.write(pID, deliver.getRecipient(), deliver.getTel(), address, deliver.getMemo(), deliver.getPayment());

				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'myPage.jsp'");
					script.println("</script>");
				}
			}
		}
		
		
	%>
	
</body>
</html>