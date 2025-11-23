<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.serverdemo.BoardDAO,org.example.serverdemo.BoardVO" %>
<%
    request.setCharacterEncoding("UTF-8");
    BoardVO vo = new BoardVO();
    vo.setTitle(request.getParameter("title"));
    vo.setWriter(request.getParameter("writer"));
    vo.setContent(request.getParameter("content"));

    int result = 0;
    try {
        result = new BoardDAO().insertBoard(vo);
    } catch (Exception e) {
        // swallow to show message below
    }
    String msg = (result > 0) ? "글이 등록되었습니다." : "등록에 실패했습니다.";
%>
<jsp:include page="top.jsp" />
    <div class="card shadow-sm mx-auto" style="max-width: 520px;">
        <div class="card-body text-center">
            <h1 class="h5 mb-3">글 작성 결과</h1>
            <p class="text-secondary mb-4"><%= msg %></p>
            <div class="d-flex justify-content-center gap-2">
                <a href="list.jsp" class="btn btn-primary">목록으로</a>
                <a href="write.jsp" class="btn btn-outline-secondary">다시 작성</a>
            </div>
        </div>
    </div>
<jsp:include page="bottom.jsp" />
