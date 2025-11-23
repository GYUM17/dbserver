<%--
  Created by IntelliJ IDEA.
  User: gim-wongyeom
  Date: 25. 11. 21.
  Time: 오전 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.example.serverdemo.BoardDAO"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="org.example.serverdemo.BoardVO" />
<jsp:setProperty name="u" property="*"/>


<%
    BoardDAO boardDAO = new BoardDAO();
    int i = boardDAO.insertBoard(u);
    String msg =
            "데이터 추가 성공 !";
    if(i == 0) msg = "[에러] 데이터 추가 ";
%>

<script>
    alert('<%=msg%>');
    location.href='list.jsp';

</script>