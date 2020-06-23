<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.Product" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="product" class="product.Product" scope="page"></jsp:useBean>
<jsp:setProperty name="product" property="pName" />
<jsp:setProperty name="product" property="price" />
<jsp:setProperty name="product" property="outputDate" />
<jsp:setProperty name="product" property="description" />
<jsp:setProperty name="product" property="image" />
<jsp:setProperty name="product" property="category" />
<jsp:setProperty name="product" property="bid" />
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
		} else {

			if(product.getpName() == null || product.getOutputDate()
					== null || product.getDescription() == null
				|| product.getImage() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				ProductDAO productDAO = new ProductDAO();
				int result = productDAO.write(product.getpName(), userID, product.getBid(), product.getPrice()
						, product.getCategory(), product.getImage(), product.getOutputDate(), product.getDescription());

				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = '########'");
					script.println("</script>");
				}
			}
		}
		
		
	%>
	
</body>
</html>