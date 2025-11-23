<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.serverdemo.BoardDAO,org.example.serverdemo.BoardVO" %>
<%
    request.setCharacterEncoding("UTF-8");
    String idParam = request.getParameter("id");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String writer = request.getParameter("writer");

    boolean success = false;
    String msg;
    if (idParam == null || idParam.isEmpty()) {
        msg = "id가 없습니다.";
    } else {
        try {
            int id = Integer.parseInt(idParam);
            BoardVO vo = new BoardVO();
            vo.setId(id);
            vo.setTitle(title);
            vo.setWriter(writer);
            vo.setContent(content);
            new BoardDAO().updateBoard(vo);
            success = true;
            msg = "글이 수정되었습니다.";
        } catch (NumberFormatException e) {
            msg = "id가 올바르지 않습니다.";
        } catch (Exception e) {
            msg = "수정 중 오류: " + e.getMessage();
        }
    }
%>
<jsp:include page="top.jsp" />
    <div class="card shadow-sm mx-auto" style="max-width: 520px;">
        <div class="card-body text-center">
            <h1 class="h5 mb-3">글 수정</h1>
            <p class="text-secondary mb-4"><%= msg %></p>
            <div class="d-flex justify-content-center gap-2">
                <a href="list.jsp" class="btn btn-outline-secondary">목록으로</a>
                <% if (idParam != null && !idParam.isEmpty()) { %>
                <a href="view.jsp?id=<%= idParam %>" class="btn btn-primary">상세보기</a>
                <% } %>
            </div>
        </div>
    </div>
<jsp:include page="bottom.jsp" />
<script>
