<%@page contentType="application; charset=EUC-KR"%>
<jsp:useBean id="bMgr" class="ch14.BoardMgr" />
<%
	  bMgr.downLoad(request, response, out, pageContext);
%>