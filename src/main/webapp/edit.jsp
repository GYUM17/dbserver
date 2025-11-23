<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.serverdemo.BoardDAO,org.example.serverdemo.BoardVO" %>
<%
    String idParam = request.getParameter("id");
    BoardVO post = null;
    if (idParam != null && !idParam.isEmpty()) {
        try {
            int id = Integer.parseInt(idParam);
            post = new BoardDAO().getBoard(id);
        } catch (NumberFormatException ignore) { }
    }
%>
<jsp:include page="top.jsp" />
    <div class="card shadow-sm mx-auto" style="max-width: 720px;">
        <div class="card-body">
            <h1 class="h4 text-center mb-4">글 수정</h1>
            <%
                if (post == null) {
            %>
            <div class="alert alert-warning">게시글을 찾을 수 없습니다.</div>
            <a href="list.jsp" class="btn btn-outline-secondary">목록으로</a>
            <%
                } else {
            %>
            <form action="update_ok.jsp" method="post">
                <input type="hidden" name="id" value="<%= post.getId() %>">
                <div class="mb-3">
                    <label class="form-label">제목</label>
                    <input type="text" class="form-control" name="title" value="<%= post.getTitle() %>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">작성자</label>
                    <input type="text" class="form-control" name="writer" value="<%= post.getWriter() %>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">내용</label>
                    <textarea class="form-control" name="content" rows="8" required><%= post.getContent() %></textarea>
                </div>
                <div class="d-flex justify-content-center gap-2 pt-3">
                    <button type="submit" class="btn btn-primary px-4">저장</button>
                    <a href="view.jsp?id=<%= post.getId() %>" class="btn btn-outline-secondary px-4">취소</a>
                </div>
            </form>
            <%
                }
            %>
        </div>
    </div>
<jsp:include page="bottom.jsp" />
