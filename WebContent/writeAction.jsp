<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
   request.setCharacterEncoding("euc-kr");
%>

<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />  
<jsp:setProperty name="bbs" property="bbsContent" />  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP �Խ��� �� ����Ʈ</title>
</head>
<body>

	<%
		String userID = null;
			if (session.getAttribute("userID") != null) {
		userID = (String)session.getAttribute("userID");
			}
			if ( userID == null) {
		
			} else {
		if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null ) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�Է��� �� �� ������ �ֽ��ϴ�.')");
				script.println("history.back()");
				script.println("</script>");
			} else { 
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>"); 
					script.println("alert('�۾��⿡ �����߽��ϴ�.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'bbs.jsp'");
					script.println("</script>");
				}
			}
		}  
	%>  
</body>
</html>