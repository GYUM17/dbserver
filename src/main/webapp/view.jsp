<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.serverdemo.BoardDAO,org.example.serverdemo.BoardVO,java.text.SimpleDateFormat" %>
<%
    String idParam = request.getParameter("id");
    BoardVO post = null;
    if (idParam != null && !idParam.isEmpty()) {
        try {
            int id = Integer.parseInt(idParam);
            post = new BoardDAO().getBoard(id);
        } catch (NumberFormatException ignore) { }
    }
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<jsp:include page="top.jsp" />
    <div class="card shadow-sm mx-auto" style="max-width: 840px;">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-start gap-2 mb-3">
                <div>
                    <p class="text-muted mb-1 small">글번호 <%= post != null ? post.getId() : "" %></p>
                    <h1 class="h4 mb-1"><%= post != null ? post.getTitle() : "게시글을 찾을 수 없습니다." %></h1>
                    <div class="text-muted small">
                        작성자 <%= post != null ? post.getWriter() : "-" %> ·
                        작성일 <%= (post != null && post.getRegDate() != null) ? sdf.format(post.getRegDate()) : "-" %> ·
                        조회수 <%= post != null ? post.getCnt() : 0 %>
                    </div>
                </div>
                <div class="d-flex gap-2">
                    <a href="edit.jsp?id=<%= post != null ? post.getId() : "" %>" class="btn btn-outline-primary btn-sm">수정</a>
                    <a href="delete.jsp?id=<%= post != null ? post.getId() : "" %>" class="btn btn-outline-danger btn-sm" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
                </div>
            </div>
            <hr>
            <div class="mt-3">
                <pre class="form-control bg-light border-0" style="min-height: 260px; white-space: pre-wrap;"><%= post != null ? post.getContent() : "" %></pre>
            </div>
            <div class="d-flex justify-content-end gap-2 mt-4">
                <a href="list.jsp" class="btn btn-outline-secondary">목록</a>
                <a href="write.jsp" class="btn btn-primary">새 글</a>
            </div>
        </div>
    </div>
<jsp:include page="bottom.jsp" />
